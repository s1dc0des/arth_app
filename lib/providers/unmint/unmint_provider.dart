import 'package:agent_dart/agent_dart.dart';
import 'package:arth_app/common/utils/amount_utils.dart';
import 'package:arth_app/providers/unmint/unmint_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../common/did/ckbtc.idl.dart' as ck;
import '../../common/did/minter.idl.dart';
part 'unmint_provider.g.dart';

@Riverpod(keepAlive: true)
class Unmint extends _$Unmint {
  @override
  UnmintState build() {
    getWithdrawalAccount();
    return UnmintState.initial();
  }

  final MinterIDLService _minterIDLService = GetIt.I.get<MinterIDLService>();
  final ck.CkbtcIDLService _ckbtcIDLService = GetIt.I.get<ck.CkbtcIDLService>();

  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool setAddress(String a) {
    if (AmountUtils.isvalidBtcAddress(a)) {
      addressController.text = a;
      state = state.copyWith(withrawalAddress: a);
      return true;
    }
    return false;
  }

  bool setAmount(BigInt amount) {
    if (amount > state.depositAccountBalance!) {
      return false;
    } else {
      amountController.text = AmountUtils.divideBy10e8(amount: amount.toInt()).toString();
      state = state.copyWith(withdrawAmount: amount);
      return true;
    }
  }

  validateAddressAndAmount() {
    if (state.withrawalAddress != null && state.withdrawAmount != null) {
      return _setAddressAndAmount();
    }
    return false;
  }

  _setAddressAndAmount() {
    try {
      state = state.copyWith(
        withrawalAddress: addressController.text,
        withdrawAmount: BigInt.from(AmountUtils.multiplyBy10e8(amount: double.parse(amountController.text))),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future getWithdrawalAccount() async {
    Future.delayed(const Duration(microseconds: 100), () {
      state = state.copyWith(loading: true);
    });
    final Account account = await _minterIDLService.getWithdrawalAccount();
    balanceOfAccount(account.owner, account.subaccount);
    state = state.copyWith(
      depositAccount: account,
      loading: false,
      status: UnmintStage.deposit,
    );
  }

  Future<RetrieveBtcRet0> retriveBtc() async {
    if (state.withdrawAmount != null && state.withrawalAddress != null) {
      state = state.copyWith(loading: true);
      final RetrieveBtcRet0 res = await _minterIDLService.retrieveBtc(RetrieveBtcArgs(
        address: state.withrawalAddress!,
        amount: state.withdrawAmount!,
      ));
      print(res.toJson().toString());
      state = state.copyWith(
        loading: false,
        res: res,
      );
      if (res.ok != null) {
        amountController.clear();
        addressController.clear();
      }
      return res;
    } else {
      return RetrieveBtcRet0.fromJson(const {"err": "Please enter amount and address"});
    }
  }

  Future<BigInt> balanceOfAccount(Principal owner, Uint8List? account) async {
    try {
      ck.Account a = ck.Account(owner: owner, subaccount: account);
      var x = await _ckbtcIDLService.icrc1BalanceOf(a);
      state = state.copyWith(depositAccountBalance: x);
      return x;
    } catch (e) {
      print(e);
      return BigInt.zero;
    }
  }
}
