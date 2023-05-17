import 'package:arth_app/common/did/ckbtc.idl.dart';
import 'package:arth_app/common/enums/states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_state.freezed.dart';

@freezed
class SendState with _$SendState {
  factory SendState(
      {required Account? account,
      required BigInt? amount,
      required LoadingState sendState,
      required Result? result,
      required bool subaccountToo}) = _SendState;

  factory SendState.initial() => SendState(
        account: null,
        amount: null,
        sendState: LoadingState.initial,
        result: null,
        subaccountToo: false,
      );
}
