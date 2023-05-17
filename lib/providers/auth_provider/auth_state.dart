import 'package:agent_dart/agent/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initializing() = _Initializing;
  const factory AuthState.needsIdentity() = _NeedsIdentity;
  const factory AuthState.authenticating(String message) = _Authenticating;
  const factory AuthState.authenticated(Identity identity) = _Authenticated;
  const factory AuthState.error(String error) = _Error;
}
