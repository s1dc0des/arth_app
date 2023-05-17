// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unmint_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnmintState {
  Account? get depositAccount => throw _privateConstructorUsedError;
  String? get withrawalAddress => throw _privateConstructorUsedError;
  BigInt? get withdrawAmount => throw _privateConstructorUsedError;
  BigInt? get depositAccountBalance => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  UnmintStage get status => throw _privateConstructorUsedError;
  RetrieveBtcRet0? get res => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnmintStateCopyWith<UnmintState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnmintStateCopyWith<$Res> {
  factory $UnmintStateCopyWith(
          UnmintState value, $Res Function(UnmintState) then) =
      _$UnmintStateCopyWithImpl<$Res, UnmintState>;
  @useResult
  $Res call(
      {Account? depositAccount,
      String? withrawalAddress,
      BigInt? withdrawAmount,
      BigInt? depositAccountBalance,
      int amount,
      bool loading,
      UnmintStage status,
      RetrieveBtcRet0? res});
}

/// @nodoc
class _$UnmintStateCopyWithImpl<$Res, $Val extends UnmintState>
    implements $UnmintStateCopyWith<$Res> {
  _$UnmintStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depositAccount = freezed,
    Object? withrawalAddress = freezed,
    Object? withdrawAmount = freezed,
    Object? depositAccountBalance = freezed,
    Object? amount = null,
    Object? loading = null,
    Object? status = null,
    Object? res = freezed,
  }) {
    return _then(_value.copyWith(
      depositAccount: freezed == depositAccount
          ? _value.depositAccount
          : depositAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      withrawalAddress: freezed == withrawalAddress
          ? _value.withrawalAddress
          : withrawalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawAmount: freezed == withdrawAmount
          ? _value.withdrawAmount
          : withdrawAmount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      depositAccountBalance: freezed == depositAccountBalance
          ? _value.depositAccountBalance
          : depositAccountBalance // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnmintStage,
      res: freezed == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as RetrieveBtcRet0?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnmintStateCopyWith<$Res>
    implements $UnmintStateCopyWith<$Res> {
  factory _$$_UnmintStateCopyWith(
          _$_UnmintState value, $Res Function(_$_UnmintState) then) =
      __$$_UnmintStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Account? depositAccount,
      String? withrawalAddress,
      BigInt? withdrawAmount,
      BigInt? depositAccountBalance,
      int amount,
      bool loading,
      UnmintStage status,
      RetrieveBtcRet0? res});
}

/// @nodoc
class __$$_UnmintStateCopyWithImpl<$Res>
    extends _$UnmintStateCopyWithImpl<$Res, _$_UnmintState>
    implements _$$_UnmintStateCopyWith<$Res> {
  __$$_UnmintStateCopyWithImpl(
      _$_UnmintState _value, $Res Function(_$_UnmintState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depositAccount = freezed,
    Object? withrawalAddress = freezed,
    Object? withdrawAmount = freezed,
    Object? depositAccountBalance = freezed,
    Object? amount = null,
    Object? loading = null,
    Object? status = null,
    Object? res = freezed,
  }) {
    return _then(_$_UnmintState(
      depositAccount: freezed == depositAccount
          ? _value.depositAccount
          : depositAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      withrawalAddress: freezed == withrawalAddress
          ? _value.withrawalAddress
          : withrawalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      withdrawAmount: freezed == withdrawAmount
          ? _value.withdrawAmount
          : withdrawAmount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      depositAccountBalance: freezed == depositAccountBalance
          ? _value.depositAccountBalance
          : depositAccountBalance // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnmintStage,
      res: freezed == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as RetrieveBtcRet0?,
    ));
  }
}

/// @nodoc

class _$_UnmintState implements _UnmintState {
  const _$_UnmintState(
      {required this.depositAccount,
      required this.withrawalAddress,
      required this.withdrawAmount,
      required this.depositAccountBalance,
      required this.amount,
      required this.loading,
      required this.status,
      required this.res});

  @override
  final Account? depositAccount;
  @override
  final String? withrawalAddress;
  @override
  final BigInt? withdrawAmount;
  @override
  final BigInt? depositAccountBalance;
  @override
  final int amount;
  @override
  final bool loading;
  @override
  final UnmintStage status;
  @override
  final RetrieveBtcRet0? res;

  @override
  String toString() {
    return 'UnmintState(depositAccount: $depositAccount, withrawalAddress: $withrawalAddress, withdrawAmount: $withdrawAmount, depositAccountBalance: $depositAccountBalance, amount: $amount, loading: $loading, status: $status, res: $res)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnmintState &&
            (identical(other.depositAccount, depositAccount) ||
                other.depositAccount == depositAccount) &&
            (identical(other.withrawalAddress, withrawalAddress) ||
                other.withrawalAddress == withrawalAddress) &&
            (identical(other.withdrawAmount, withdrawAmount) ||
                other.withdrawAmount == withdrawAmount) &&
            (identical(other.depositAccountBalance, depositAccountBalance) ||
                other.depositAccountBalance == depositAccountBalance) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.res, res) || other.res == res));
  }

  @override
  int get hashCode => Object.hash(runtimeType, depositAccount, withrawalAddress,
      withdrawAmount, depositAccountBalance, amount, loading, status, res);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnmintStateCopyWith<_$_UnmintState> get copyWith =>
      __$$_UnmintStateCopyWithImpl<_$_UnmintState>(this, _$identity);
}

abstract class _UnmintState implements UnmintState {
  const factory _UnmintState(
      {required final Account? depositAccount,
      required final String? withrawalAddress,
      required final BigInt? withdrawAmount,
      required final BigInt? depositAccountBalance,
      required final int amount,
      required final bool loading,
      required final UnmintStage status,
      required final RetrieveBtcRet0? res}) = _$_UnmintState;

  @override
  Account? get depositAccount;
  @override
  String? get withrawalAddress;
  @override
  BigInt? get withdrawAmount;
  @override
  BigInt? get depositAccountBalance;
  @override
  int get amount;
  @override
  bool get loading;
  @override
  UnmintStage get status;
  @override
  RetrieveBtcRet0? get res;
  @override
  @JsonKey(ignore: true)
  _$$_UnmintStateCopyWith<_$_UnmintState> get copyWith =>
      throw _privateConstructorUsedError;
}
