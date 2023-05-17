import 'package:arth_app/common/did/ckbtc.idl.dart';
import 'package:arth_app/providers/auth_provider/auth_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../common/enums/states.dart';
import '../../common/utils/amount_utils.dart';
import 'ck_btc_state.dart';
part 'ckbtc_provider.g.dart';

@Riverpod(keepAlive: true)
class CkBtc extends _$CkBtc {
  @override
  CkBtcState build() {
    getBalance();
    getFee();
    return CkBtcState.initial();
  }

  final CkbtcIDLService _ckbtcIDLService = GetIt.I.get<CkbtcIDLService>();

  Future<BigInt> getFee() async {
    int d = await _ckbtcIDLService.icrc1Decimals();
    BigInt f = await _ckbtcIDLService.icrc1Fee();
    state = state.copyWith(
      fee: f,
      decimals: d,
    );
    return f;
  }

  Future<void> voidGetbalance() async {
    await getBalance();
  }

  Future<String> getBalance() async {
    try {
      Future.delayed(const Duration(milliseconds: 100), (() {
        state = state.copyWith(loadingState: LoadingState.loading);
      }));
      var i = ref.watch(identityProvider);
      var a = await _ckbtcIDLService.icrc1BalanceOf(
        Account(owner: i!.getPrincipal()),
      );
      state = state.copyWith(
        balanceString: AmountUtils.formatAmount(amount: a.toInt(), decimals: 8),
        balance: a,
        loadingState: LoadingState.success,
      );

      return "ok: $a";
    } catch (e) {
      print(e);
      state = state.copyWith(
        balanceString: "--.--",
        balance: BigInt.zero,
        loadingState: LoadingState.error,
      );
      return e.toString();
    }
  }

  Future<Result?> transfer(Account account, BigInt amount) async {
    try {
      Result r = await _ckbtcIDLService.icrc1Transfer(
        TransferArg(
          to: account,
          amount: amount,
        ),
      );
      print(r.toJson());
      return r;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
