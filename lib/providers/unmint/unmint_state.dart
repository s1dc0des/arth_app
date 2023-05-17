import 'package:arth_app/common/did/minter.idl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'unmint_state.freezed.dart';

enum UnmintStage {
  deposit,
  withdraw,
}

@freezed
class UnmintState with _$UnmintState {
  const factory UnmintState({
    required Account? depositAccount,
    required String? withrawalAddress,
    required BigInt? withdrawAmount,
    required BigInt? depositAccountBalance,
    required int amount,
    required bool loading,
    required UnmintStage status,
    required RetrieveBtcRet0? res,
  }) = _UnmintState;

  factory UnmintState.initial() => const UnmintState(
        depositAccount: null,
        depositAccountBalance: null,
        amount: 0,
        withdrawAmount: null,
        withrawalAddress: null,
        loading: false,
        status: UnmintStage.deposit,
        res: null,
      );
}
