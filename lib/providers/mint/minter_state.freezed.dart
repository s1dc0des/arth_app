// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'minter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MinterState {
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get btcAddress => throw _privateConstructorUsedError;
  UpdateBalanceRet0? get result => throw _privateConstructorUsedError;
  MintStatus get status => throw _privateConstructorUsedError;
  BigInt? get depositFee => throw _privateConstructorUsedError;
  double get bitcoinBalance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MinterStateCopyWith<MinterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MinterStateCopyWith<$Res> {
  factory $MinterStateCopyWith(
          MinterState value, $Res Function(MinterState) then) =
      _$MinterStateCopyWithImpl<$Res, MinterState>;
  @useResult
  $Res call(
      {bool loading,
      String? error,
      String? btcAddress,
      UpdateBalanceRet0? result,
      MintStatus status,
      BigInt? depositFee,
      double bitcoinBalance});
}

/// @nodoc
class _$MinterStateCopyWithImpl<$Res, $Val extends MinterState>
    implements $MinterStateCopyWith<$Res> {
  _$MinterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? btcAddress = freezed,
    Object? result = freezed,
    Object? status = null,
    Object? depositFee = freezed,
    Object? bitcoinBalance = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      btcAddress: freezed == btcAddress
          ? _value.btcAddress
          : btcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UpdateBalanceRet0?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MintStatus,
      depositFee: freezed == depositFee
          ? _value.depositFee
          : depositFee // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      bitcoinBalance: null == bitcoinBalance
          ? _value.bitcoinBalance
          : bitcoinBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MinterStateCopyWith<$Res>
    implements $MinterStateCopyWith<$Res> {
  factory _$$_MinterStateCopyWith(
          _$_MinterState value, $Res Function(_$_MinterState) then) =
      __$$_MinterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      String? error,
      String? btcAddress,
      UpdateBalanceRet0? result,
      MintStatus status,
      BigInt? depositFee,
      double bitcoinBalance});
}

/// @nodoc
class __$$_MinterStateCopyWithImpl<$Res>
    extends _$MinterStateCopyWithImpl<$Res, _$_MinterState>
    implements _$$_MinterStateCopyWith<$Res> {
  __$$_MinterStateCopyWithImpl(
      _$_MinterState _value, $Res Function(_$_MinterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? btcAddress = freezed,
    Object? result = freezed,
    Object? status = null,
    Object? depositFee = freezed,
    Object? bitcoinBalance = null,
  }) {
    return _then(_$_MinterState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      btcAddress: freezed == btcAddress
          ? _value.btcAddress
          : btcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UpdateBalanceRet0?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MintStatus,
      depositFee: freezed == depositFee
          ? _value.depositFee
          : depositFee // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      bitcoinBalance: null == bitcoinBalance
          ? _value.bitcoinBalance
          : bitcoinBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MinterState with DiagnosticableTreeMixin implements _MinterState {
  const _$_MinterState(
      {required this.loading,
      required this.error,
      required this.btcAddress,
      required this.result,
      required this.status,
      required this.depositFee,
      required this.bitcoinBalance});

  @override
  final bool loading;
  @override
  final String? error;
  @override
  final String? btcAddress;
  @override
  final UpdateBalanceRet0? result;
  @override
  final MintStatus status;
  @override
  final BigInt? depositFee;
  @override
  final double bitcoinBalance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MinterState(loading: $loading, error: $error, btcAddress: $btcAddress, result: $result, status: $status, depositFee: $depositFee, bitcoinBalance: $bitcoinBalance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MinterState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('btcAddress', btcAddress))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('depositFee', depositFee))
      ..add(DiagnosticsProperty('bitcoinBalance', bitcoinBalance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MinterState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.btcAddress, btcAddress) ||
                other.btcAddress == btcAddress) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.depositFee, depositFee) ||
                other.depositFee == depositFee) &&
            (identical(other.bitcoinBalance, bitcoinBalance) ||
                other.bitcoinBalance == bitcoinBalance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error, btcAddress,
      result, status, depositFee, bitcoinBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MinterStateCopyWith<_$_MinterState> get copyWith =>
      __$$_MinterStateCopyWithImpl<_$_MinterState>(this, _$identity);
}

abstract class _MinterState implements MinterState {
  const factory _MinterState(
      {required final bool loading,
      required final String? error,
      required final String? btcAddress,
      required final UpdateBalanceRet0? result,
      required final MintStatus status,
      required final BigInt? depositFee,
      required final double bitcoinBalance}) = _$_MinterState;

  @override
  bool get loading;
  @override
  String? get error;
  @override
  String? get btcAddress;
  @override
  UpdateBalanceRet0? get result;
  @override
  MintStatus get status;
  @override
  BigInt? get depositFee;
  @override
  double get bitcoinBalance;
  @override
  @JsonKey(ignore: true)
  _$$_MinterStateCopyWith<_$_MinterState> get copyWith =>
      throw _privateConstructorUsedError;
}
