import 'package:arth_app/common/did/minter.idl.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'minter_state.freezed.dart';

enum MintStatus {
  createAddress,
  deposit,
  mint,
  minting,
  success,
  error,
}

@freezed
class MinterState with _$MinterState {
  const factory MinterState({
    required bool loading,
    required String? error,
    required String? btcAddress,
    required UpdateBalanceRet0? result,
    required MintStatus status,
    required BigInt? depositFee,
    required double bitcoinBalance,
  }) = _MinterState;

  factory MinterState.initial() => const MinterState(
        loading: false,
        error: null,
        btcAddress: null,
        result: null,
        status: MintStatus.createAddress,
        depositFee: null,
        bitcoinBalance: 0,
      );
}
