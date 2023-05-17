// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SendState {
  Account? get account => throw _privateConstructorUsedError;
  BigInt? get amount => throw _privateConstructorUsedError;
  LoadingState get sendState => throw _privateConstructorUsedError;
  Result? get result => throw _privateConstructorUsedError;
  bool get subaccountToo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendStateCopyWith<SendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendStateCopyWith<$Res> {
  factory $SendStateCopyWith(SendState value, $Res Function(SendState) then) =
      _$SendStateCopyWithImpl<$Res, SendState>;
  @useResult
  $Res call(
      {Account? account,
      BigInt? amount,
      LoadingState sendState,
      Result? result,
      bool subaccountToo});
}

/// @nodoc
class _$SendStateCopyWithImpl<$Res, $Val extends SendState>
    implements $SendStateCopyWith<$Res> {
  _$SendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? amount = freezed,
    Object? sendState = null,
    Object? result = freezed,
    Object? subaccountToo = null,
  }) {
    return _then(_value.copyWith(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      sendState: null == sendState
          ? _value.sendState
          : sendState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      subaccountToo: null == subaccountToo
          ? _value.subaccountToo
          : subaccountToo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendStateCopyWith<$Res> implements $SendStateCopyWith<$Res> {
  factory _$$_SendStateCopyWith(
          _$_SendState value, $Res Function(_$_SendState) then) =
      __$$_SendStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Account? account,
      BigInt? amount,
      LoadingState sendState,
      Result? result,
      bool subaccountToo});
}

/// @nodoc
class __$$_SendStateCopyWithImpl<$Res>
    extends _$SendStateCopyWithImpl<$Res, _$_SendState>
    implements _$$_SendStateCopyWith<$Res> {
  __$$_SendStateCopyWithImpl(
      _$_SendState _value, $Res Function(_$_SendState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? amount = freezed,
    Object? sendState = null,
    Object? result = freezed,
    Object? subaccountToo = null,
  }) {
    return _then(_$_SendState(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      sendState: null == sendState
          ? _value.sendState
          : sendState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      subaccountToo: null == subaccountToo
          ? _value.subaccountToo
          : subaccountToo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SendState implements _SendState {
  _$_SendState(
      {required this.account,
      required this.amount,
      required this.sendState,
      required this.result,
      required this.subaccountToo});

  @override
  final Account? account;
  @override
  final BigInt? amount;
  @override
  final LoadingState sendState;
  @override
  final Result? result;
  @override
  final bool subaccountToo;

  @override
  String toString() {
    return 'SendState(account: $account, amount: $amount, sendState: $sendState, result: $result, subaccountToo: $subaccountToo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendState &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.sendState, sendState) ||
                other.sendState == sendState) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.subaccountToo, subaccountToo) ||
                other.subaccountToo == subaccountToo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, account, amount, sendState, result, subaccountToo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendStateCopyWith<_$_SendState> get copyWith =>
      __$$_SendStateCopyWithImpl<_$_SendState>(this, _$identity);
}

abstract class _SendState implements SendState {
  factory _SendState(
      {required final Account? account,
      required final BigInt? amount,
      required final LoadingState sendState,
      required final Result? result,
      required final bool subaccountToo}) = _$_SendState;

  @override
  Account? get account;
  @override
  BigInt? get amount;
  @override
  LoadingState get sendState;
  @override
  Result? get result;
  @override
  bool get subaccountToo;
  @override
  @JsonKey(ignore: true)
  _$$_SendStateCopyWith<_$_SendState> get copyWith =>
      throw _privateConstructorUsedError;
}
