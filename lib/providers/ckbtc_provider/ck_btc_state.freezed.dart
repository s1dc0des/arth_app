// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ck_btc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CkBtcState {
  String? get balanceString => throw _privateConstructorUsedError;
  BigInt? get balance => throw _privateConstructorUsedError;
  BigInt? get fee => throw _privateConstructorUsedError;
  int? get decimals => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CkBtcStateCopyWith<CkBtcState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CkBtcStateCopyWith<$Res> {
  factory $CkBtcStateCopyWith(
          CkBtcState value, $Res Function(CkBtcState) then) =
      _$CkBtcStateCopyWithImpl<$Res, CkBtcState>;
  @useResult
  $Res call(
      {String? balanceString,
      BigInt? balance,
      BigInt? fee,
      int? decimals,
      LoadingState loadingState});
}

/// @nodoc
class _$CkBtcStateCopyWithImpl<$Res, $Val extends CkBtcState>
    implements $CkBtcStateCopyWith<$Res> {
  _$CkBtcStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balanceString = freezed,
    Object? balance = freezed,
    Object? fee = freezed,
    Object? decimals = freezed,
    Object? loadingState = null,
  }) {
    return _then(_value.copyWith(
      balanceString: freezed == balanceString
          ? _value.balanceString
          : balanceString // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      decimals: freezed == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CkBtcStateCopyWith<$Res>
    implements $CkBtcStateCopyWith<$Res> {
  factory _$$_CkBtcStateCopyWith(
          _$_CkBtcState value, $Res Function(_$_CkBtcState) then) =
      __$$_CkBtcStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? balanceString,
      BigInt? balance,
      BigInt? fee,
      int? decimals,
      LoadingState loadingState});
}

/// @nodoc
class __$$_CkBtcStateCopyWithImpl<$Res>
    extends _$CkBtcStateCopyWithImpl<$Res, _$_CkBtcState>
    implements _$$_CkBtcStateCopyWith<$Res> {
  __$$_CkBtcStateCopyWithImpl(
      _$_CkBtcState _value, $Res Function(_$_CkBtcState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balanceString = freezed,
    Object? balance = freezed,
    Object? fee = freezed,
    Object? decimals = freezed,
    Object? loadingState = null,
  }) {
    return _then(_$_CkBtcState(
      balanceString: freezed == balanceString
          ? _value.balanceString
          : balanceString // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      decimals: freezed == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$_CkBtcState implements _CkBtcState {
  const _$_CkBtcState(
      {required this.balanceString,
      required this.balance,
      required this.fee,
      required this.decimals,
      required this.loadingState});

  @override
  final String? balanceString;
  @override
  final BigInt? balance;
  @override
  final BigInt? fee;
  @override
  final int? decimals;
  @override
  final LoadingState loadingState;

  @override
  String toString() {
    return 'CkBtcState(balanceString: $balanceString, balance: $balance, fee: $fee, decimals: $decimals, loadingState: $loadingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CkBtcState &&
            (identical(other.balanceString, balanceString) ||
                other.balanceString == balanceString) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, balanceString, balance, fee, decimals, loadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CkBtcStateCopyWith<_$_CkBtcState> get copyWith =>
      __$$_CkBtcStateCopyWithImpl<_$_CkBtcState>(this, _$identity);
}

abstract class _CkBtcState implements CkBtcState {
  const factory _CkBtcState(
      {required final String? balanceString,
      required final BigInt? balance,
      required final BigInt? fee,
      required final int? decimals,
      required final LoadingState loadingState}) = _$_CkBtcState;

  @override
  String? get balanceString;
  @override
  BigInt? get balance;
  @override
  BigInt? get fee;
  @override
  int? get decimals;
  @override
  LoadingState get loadingState;
  @override
  @JsonKey(ignore: true)
  _$$_CkBtcStateCopyWith<_$_CkBtcState> get copyWith =>
      throw _privateConstructorUsedError;
}
