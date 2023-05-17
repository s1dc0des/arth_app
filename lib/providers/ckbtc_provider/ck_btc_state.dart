import 'package:arth_app/common/enums/states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ck_btc_state.freezed.dart';

@freezed
class CkBtcState with _$CkBtcState {
  const factory CkBtcState({
    required String? balanceString,
    required BigInt? balance,
    required BigInt? fee,
    required int? decimals,
    required LoadingState loadingState,
  }) = _CkBtcState;

  factory CkBtcState.initial() => const CkBtcState(
        balanceString: null,
        balance: null,
        fee: null,
        decimals: null,
        loadingState: LoadingState.initial,
      );
}
