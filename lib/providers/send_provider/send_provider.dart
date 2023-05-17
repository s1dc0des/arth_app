import 'package:agent_dart/agent_dart.dart';
import 'package:arth_app/common/did/ckbtc.idl.dart';
import 'package:arth_app/common/utils/amount_utils.dart';
import 'package:arth_app/providers/send_provider/send_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../common/enums/states.dart';
part 'send_provider.g.dart';

@riverpod
class Send extends _$Send {
  @override
  SendState build() {
    return SendState.initial();
  }

  final CkbtcIDLService _ck = GetIt.I.get<CkbtcIDLService>();

  TextEditingController addressController = TextEditingController();
  TextEditingController subaccountController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool toggleSubAccount() {
    if (state.subaccountToo) {
      subaccountController.text = "";
      Account? a = state.account;
      if (a != null) {
        state = state.copyWith(
          account: Account(
            owner: a.owner,
            subaccount: null,
          ),
        );
      }
    }
    state = state.copyWith(subaccountToo: !state.subaccountToo);
    return state.subaccountToo;
  }

  bool setAddress(String? s) {
    try {
      late Principal p;
      if (s != null) {
        p = Principal.fromText(s);
        addressController.text = s;
      } else {
        p = Principal.fromText(addressController.text);
      }
      state = state.copyWith(
        account: Account(owner: p),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // use agent_dart isAccount after fix in package
  bool _isAccountId(String str) {
    if (str.length != 64) {
      return false;
    }
    return true;
  }

  bool setSubaccount(String? a) {
    try {
      if (a != null) {
        if (_isAccountId(a)) {
          subaccountController.text = a;
          Account? a0 = state.account;
          if (a0 != null) {
            state = state.copyWith(
              account: Account(
                owner: a0.owner,
                subaccount: a.toU8a(),
              ),
            );
            return true;
          }
        }
      } else {
        if (_isAccountId(subaccountController.text)) {
          Account? a0 = state.account;
          if (a0 != null) {
            state = state.copyWith(
              account: Account(
                owner: a0.owner,
                subaccount: subaccountController.text.toU8a(),
              ),
            );
            return true;
          }
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  bool setAmount({BigInt? amount, BigInt? fee}) {
    try {
      late BigInt ba;
      if (amount != null && fee != null) {
        ba = BigInt.from(amount.toInt() - fee.toInt());
        amountController.text = (AmountUtils.divideBy10e8(amount: ba.toInt())).toString();
      } else {
        double a = double.parse(amountController.text);
        ba = BigInt.from(AmountUtils.multiplyBy10e8(amount: a));
      }
      state = state.copyWith(
        amount: ba,
      );

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool isValid() {
    return state.account != null && state.amount != null;
  }

  bool isValidPrincipal() {
    return state.account != null && AmountUtils.isPrincipal(state.account?.owner.toString());
  }

  bool isValidAccount() {
    return state.account != null && AmountUtils.isAccount(state.account?.subaccount.toString());
  }

  Future<String> send(BigInt fee) async {
    try {
      if (state.account == null || state.amount == null) {
        return "err: invalid address or amount";
      }
      // print(state.account!.toJson());
      // print(state.amount!.toInt());
      final a = state.amount! - fee;
      state = state.copyWith(sendState: LoadingState.loading);
      Result r = await _ck.icrc1Transfer(TransferArg(to: state.account!, amount: a));
      if (r.ok != null) {
        state = state.copyWith(sendState: LoadingState.success, result: r);
        return r.ok!.toString();
      } else {
        state = state.copyWith(sendState: LoadingState.error, result: r);
        return r.err!.toString();
      }
    } catch (e) {
      state = state.copyWith(sendState: LoadingState.error, result: null);
      return e.toString();
    }
  }
}
