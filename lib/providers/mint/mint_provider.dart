import 'package:arth_app/common/did/minter.idl.dart';
import 'package:arth_app/common/utils/amount_utils.dart';
import 'package:arth_app/providers/auth_provider/auth_provider.dart';
import 'package:arth_app/services/bitcoin/bitcoin_service.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'minter_state.dart';

part 'mint_provider.g.dart';

enum MintStage {
  deposit,
  withdraw,
}

@Riverpod(keepAlive: true)
class Minter extends _$Minter {
  @override
  MinterState build() {
    getMyBtcAddress();
    return MinterState.initial();
  }

  final MinterIDLService _minterIDLService = GetIt.I.get<MinterIDLService>();
  final BitcoinService _bitcoinService = GetIt.I.get<BitcoinService>();

  Future getMyBtcAddress() async {
    try {
      Future.delayed(const Duration(milliseconds: 100), () => state = state.copyWith(loading: true));
      String a = await _minterIDLService.getBtcAddress(const GetBtcAddressArg0());
      state = state.copyWith(btcAddress: a);
      await getBtcBalance();
      await getDepositFee();
      state = state.copyWith(loading: false);
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString());
    }
  }

  bool canMint() {
    return state.bitcoinBalance > 0.00004 && state.depositFee != null && state.btcAddress != null;
  }

  getDepositFee() async {
    try {
      final BigInt fee = await _minterIDLService.getDepositFee();
      state = state.copyWith(depositFee: fee);
    } catch (e) {
      print(e);
    }
  }

  getBtcBalance() async {
    try {
      int b = await _bitcoinService.getAccountBalance(state.btcAddress!);
      state = state.copyWith(bitcoinBalance: AmountUtils.divideBy10e8(amount: b));
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString());
    }
  }

  Future updateBalance() async {
    try {
      if (state.btcAddress == null) {
        return "Invalid/null BTC address";
      }
      if (state.bitcoinBalance < 0.00004) {
        return "Insufficient BTC  balance < 0.00004";
      }
      final i = ref.read(identityProvider);
      if (i == null) {
        return "Error fetching identity, please login again";
      }
      state = state.copyWith(loading: true, result: null, status: MintStatus.minting);
      UpdateBalanceRet0 r = await _minterIDLService.updateBalance(
        UpdateBalanceArg0(owner: i.getPrincipal()),
      );
      state = state.copyWith(
        result: r,
        loading: false,
        status: r.err != null ? MintStatus.error : MintStatus.success,
      );
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString(), loading: false);
    }
  }
}
