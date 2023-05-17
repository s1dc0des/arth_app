// coverage:ignore-file
// ignore_for_file: type=lint, unnecessary_null_comparison
// ======================================
// GENERATED CODE - DO NOT MODIFY BY HAND
// ======================================

import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:agent_dart/agent_dart.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

class MinterIDLActor {
  const MinterIDLActor._();

  /// ```Candid
  ///   get_btc_address: (record { owner: opt principal; subaccount: opt blob }) -> (text)
  /// ```
  static Future<String> getBtcAddress(
    CanisterActor actor,
    GetBtcAddressArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('get_btc_address')!(dat);
    return ret;
  }

  /// ```Candid
  ///   update_balance: (record { owner: opt principal; subaccount: opt blob }) -> (variant { Ok: vec UtxoStatus; Err: UpdateBalanceError })
  /// ```
  static Future<UpdateBalanceRet0> updateBalance(
    CanisterActor actor,
    UpdateBalanceArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('update_balance')!(dat);
    return UpdateBalanceRet0.fromJson(
      ret,
    );
  }

  /// ```Candid
  ///   estimate_withdrawal_fee: (record { amount: opt nat64 }) -> (record { bitcoin_fee: nat64; minter_fee: nat64 }) query
  /// ```
  static Future<EstimateWithdrawalFeeRet0> estimateWithdrawalFee(
    CanisterActor actor,
    EstimateWithdrawalFeeArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('estimate_withdrawal_fee')!(dat);
    return EstimateWithdrawalFeeRet0.fromJson(
      ret,
    );
  }

  /// ```Candid
  ///   get_deposit_fee: () -> (nat64) query
  /// ```
  static Future<BigInt> getDepositFee(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('get_deposit_fee')!(dat);
    return ret is BigInt ? ret : BigInt.from(ret);
  }

  /// ```Candid
  ///   get_withdrawal_account: () -> (Account)
  /// ```
  static Future<Account> getWithdrawalAccount(
    CanisterActor actor,
  ) async {
    const dat = [];
    final ret = await actor.getFunc('get_withdrawal_account')!(dat);
    return Account.fromJson(ret);
  }

  /// ```Candid
  ///   retrieve_btc: (RetrieveBtcArgs) -> (variant { Ok: RetrieveBtcOk; Err: RetrieveBtcError })
  /// ```
  static Future<RetrieveBtcRet0> retrieveBtc(
    CanisterActor actor,
    RetrieveBtcArgs arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('retrieve_btc')!(dat);
    return RetrieveBtcRet0.fromJson(
      ret,
    );
  }

  /// ```Candid
  ///   retrieve_btc_status: (record { block_index: nat64 }) -> (RetrieveBtcStatus) query
  /// ```
  static Future<RetrieveBtcStatus> retrieveBtcStatus(
    CanisterActor actor,
    RetrieveBtcStatusArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('retrieve_btc_status')!(dat);
    return RetrieveBtcStatus.fromJson(ret);
  }

  /// ```Candid
  ///   get_events: (record { start: nat64; length: nat64 }) -> (vec Event) query
  /// ```
  static Future<List<Event>> getEvents(
    CanisterActor actor,
    GetEventsArg0 arg,
  ) async {
    final dat = [arg];
    final ret = await actor.getFunc('get_events')!(dat);
    return (ret as List).map((e) {
      return Event.fromJson(e);
    }).toList();
  }
}

class MinterIDLService {
  MinterIDLService({
    required this.canisterId,
    required this.uri,
    this.identity,
    this.createActorMethod,
    this.debug = true,
  }) : idl = MinterIDL.idl;

  final String canisterId;
  final Uri uri;
  final Service idl;
  final Identity? identity;
  final bool debug;
  final CreateActorMethod? createActorMethod;

  Completer<CanisterActor>? _actor;

  Future<CanisterActor> getActor() {
    if (_actor != null) {
      return _actor!.future;
    }
    final completer = Completer<CanisterActor>();
    _actor = completer;
    Future(() async {
      final httpAgent = HttpAgent(
        defaultProtocol: uri.scheme,
        defaultHost: uri.host,
        defaultPort: uri.port,
        options: HttpAgentOptions(identity: identity),
      );
      if (debug) {
        await httpAgent.fetchRootKey();
      }
      httpAgent.addTransform(
        HttpAgentRequestTransformFn(call: makeNonceTransform()),
      );
      return CanisterActor(
        ActorConfig(
          canisterId: Principal.fromText(canisterId),
          agent: httpAgent,
        ),
        idl,
        createActorMethod: createActorMethod,
      );
    }).then(completer.complete).catchError((e, s) {
      completer.completeError(e, s);
      _actor = null;
    });
    return completer.future;
  }

  /// ```Candid
  ///   get_btc_address: (record { owner: opt principal; subaccount: opt blob }) -> (text)
  /// ```
  Future<String> getBtcAddress(
    GetBtcAddressArg0 arg,
  ) async {
    final actor = await getActor();
    return MinterIDLActor.getBtcAddress(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   update_balance: (record { owner: opt principal; subaccount: opt blob }) -> (variant { Ok: vec UtxoStatus; Err: UpdateBalanceError })
  /// ```
  Future<UpdateBalanceRet0> updateBalance(
    UpdateBalanceArg0 arg,
  ) async {
    final actor = await getActor();
    return MinterIDLActor.updateBalance(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   estimate_withdrawal_fee: (record { amount: opt nat64 }) -> (record { bitcoin_fee: nat64; minter_fee: nat64 }) query
  /// ```
  Future<EstimateWithdrawalFeeRet0> estimateWithdrawalFee(
    EstimateWithdrawalFeeArg0 arg,
  ) async {
    final actor = await getActor();
    return MinterIDLActor.estimateWithdrawalFee(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   get_deposit_fee: () -> (nat64) query
  /// ```
  Future<BigInt> getDepositFee() async {
    final actor = await getActor();
    return MinterIDLActor.getDepositFee(
      actor,
    );
  }

  /// ```Candid
  ///   get_withdrawal_account: () -> (Account)
  /// ```
  Future<Account> getWithdrawalAccount() async {
    final actor = await getActor();
    return MinterIDLActor.getWithdrawalAccount(
      actor,
    );
  }

  /// ```Candid
  ///   retrieve_btc: (RetrieveBtcArgs) -> (variant { Ok: RetrieveBtcOk; Err: RetrieveBtcError })
  /// ```
  Future<RetrieveBtcRet0> retrieveBtc(
    RetrieveBtcArgs arg,
  ) async {
    final actor = await getActor();
    return MinterIDLActor.retrieveBtc(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   retrieve_btc_status: (record { block_index: nat64 }) -> (RetrieveBtcStatus) query
  /// ```
  Future<RetrieveBtcStatus> retrieveBtcStatus(
    RetrieveBtcStatusArg0 arg,
  ) async {
    final actor = await getActor();
    return MinterIDLActor.retrieveBtcStatus(
      actor,
      arg,
    );
  }

  /// ```Candid
  ///   get_events: (record { start: nat64; length: nat64 }) -> (vec Event) query
  /// ```
  Future<List<Event>> getEvents(
    GetEventsArg0 arg,
  ) async {
    final actor = await getActor();
    return MinterIDLActor.getEvents(
      actor,
      arg,
    );
  }
}

class MinterIDL {
  const MinterIDL._();

  /// [_Account] defined in Candid
  /// ```Candid
  ///   type Account = record { owner: principal; subaccount: opt blob };
  /// ```
  static final RecordClass _Account = IDL.Record({
    'owner': IDL.Principal,
    'subaccount': IDL.Opt(
      IDL.Vec(IDL.Nat8),
    ),
  });

  /// [_RetrieveBtcArgs] defined in Candid
  /// ```Candid
  ///   type RetrieveBtcArgs = record { address: text; amount: nat64 };
  /// ```
  static final RecordClass _RetrieveBtcArgs = IDL.Record({
    'address': IDL.Text,
    'amount': IDL.Nat64,
  });

  /// [_RetrieveBtcError] defined in Candid
  /// ```Candid
  ///   type RetrieveBtcError = variant { MalformedAddress: text; AlreadyProcessing; AmountTooLow: nat64; InsufficientFunds: record { balance: nat64 }; TemporarilyUnavailable: text; GenericError: record { error_message: text; error_code: nat64 } };
  /// ```
  static final VariantClass _RetrieveBtcError = IDL.Variant({
    'MalformedAddress': IDL.Text,
    'AlreadyProcessing': IDL.Null,
    'AmountTooLow': IDL.Nat64,
    'InsufficientFunds': IDL.Record({
      'balance': IDL.Nat64,
    }),
    'TemporarilyUnavailable': IDL.Text,
    'GenericError': IDL.Record({
      'error_message': IDL.Text,
      'error_code': IDL.Nat64,
    }),
  });

  /// [_RetrieveBtcOk] defined in Candid
  /// ```Candid
  ///   type RetrieveBtcOk = record { block_index: nat64 };
  /// ```
  static final RecordClass _RetrieveBtcOk = IDL.Record({
    'block_index': IDL.Nat64,
  });

  /// [_UtxoStatus] defined in Candid
  /// ```Candid
  ///   type UtxoStatus = variant { ValueTooSmall: Utxo; Tainted: Utxo; Checked: Utxo; Minted: record { block_index: nat64; minted_amount: nat64; utxo: Utxo } };
  /// ```
  static final VariantClass _UtxoStatus = IDL.Variant({
    'ValueTooSmall': _Utxo,
    'Tainted': _Utxo,
    'Checked': _Utxo,
    'Minted': IDL.Record({
      'block_index': IDL.Nat64,
      'minted_amount': IDL.Nat64,
      'utxo': _Utxo,
    }),
  });

  /// [_UpdateBalanceError] defined in Candid
  /// ```Candid
  ///   type UpdateBalanceError = variant { NoNewUtxos: record { current_confirmations: opt nat32; required_confirmations: nat32 }; AlreadyProcessing; TemporarilyUnavailable: text; GenericError: record { error_message: text; error_code: nat64 } };
  /// ```
  static final VariantClass _UpdateBalanceError = IDL.Variant({
    'NoNewUtxos': IDL.Record({
      'current_confirmations': IDL.Opt(
        IDL.Nat32,
      ),
      'required_confirmations': IDL.Nat32,
    }),
    'AlreadyProcessing': IDL.Null,
    'TemporarilyUnavailable': IDL.Text,
    'GenericError': IDL.Record({
      'error_message': IDL.Text,
      'error_code': IDL.Nat64,
    }),
  });

  /// [_BtcNetwork] defined in Candid
  /// ```Candid
  ///   type BtcNetwork = variant { Mainnet; Testnet; Regtest };
  /// ```
  static final VariantClass _BtcNetwork = IDL.Variant({
    'Mainnet': IDL.Null,
    'Testnet': IDL.Null,
    'Regtest': IDL.Null,
  });

  /// [_Mode] defined in Candid
  /// ```Candid
  ///   type Mode = variant { ReadOnly; RestrictedTo: vec principal; DepositsRestrictedTo: vec principal; GeneralAvailability };
  /// ```
  static final VariantClass _Mode = IDL.Variant({
    'ReadOnly': IDL.Null,
    'RestrictedTo': IDL.Vec(
      IDL.Principal,
    ),
    'DepositsRestrictedTo': IDL.Vec(
      IDL.Principal,
    ),
    'GeneralAvailability': IDL.Null,
  });

  /// [_InitArgs] defined in Candid
  /// ```Candid
  ///   type InitArgs = record { btc_network: BtcNetwork; ledger_id: principal; ecdsa_key_name: text; retrieve_btc_min_amount: nat64; max_time_in_queue_nanos: nat64; min_confirmations: opt nat32; mode: Mode; kyt_fee: opt nat64; kyt_principal: opt principal };
  /// ```
  static final RecordClass _InitArgs = IDL.Record({
    'btc_network': _BtcNetwork,
    'ledger_id': IDL.Principal,
    'ecdsa_key_name': IDL.Text,
    'retrieve_btc_min_amount': IDL.Nat64,
    'max_time_in_queue_nanos': IDL.Nat64,
    'min_confirmations': IDL.Opt(
      IDL.Nat32,
    ),
    'mode': _Mode,
    'kyt_fee': IDL.Opt(
      IDL.Nat64,
    ),
    'kyt_principal': IDL.Opt(
      IDL.Principal,
    ),
  });

  /// [_UpgradeArgs] defined in Candid
  /// ```Candid
  ///   type UpgradeArgs = record { retrieve_btc_min_amount: opt nat64; max_time_in_queue_nanos: opt nat64; min_confirmations: opt nat32; mode: opt Mode; kyt_fee: opt nat64; kyt_principal: opt principal };
  /// ```
  static final RecordClass _UpgradeArgs = IDL.Record({
    'retrieve_btc_min_amount': IDL.Opt(
      IDL.Nat64,
    ),
    'max_time_in_queue_nanos': IDL.Opt(
      IDL.Nat64,
    ),
    'min_confirmations': IDL.Opt(
      IDL.Nat32,
    ),
    'mode': IDL.Opt(
      _Mode,
    ),
    'kyt_fee': IDL.Opt(
      IDL.Nat64,
    ),
    'kyt_principal': IDL.Opt(
      IDL.Principal,
    ),
  });

  /// [_RetrieveBtcStatus] defined in Candid
  /// ```Candid
  ///   type RetrieveBtcStatus = variant { Unknown; Pending; Signing; Sending: record { txid: blob }; Submitted: record { txid: blob }; AmountTooLow; Confirmed: record { txid: blob } };
  /// ```
  static final VariantClass _RetrieveBtcStatus = IDL.Variant({
    'Unknown': IDL.Null,
    'Pending': IDL.Null,
    'Signing': IDL.Null,
    'Sending': IDL.Record({
      'txid': IDL.Vec(IDL.Nat8),
    }),
    'Submitted': IDL.Record({
      'txid': IDL.Vec(IDL.Nat8),
    }),
    'AmountTooLow': IDL.Null,
    'Confirmed': IDL.Record({
      'txid': IDL.Vec(IDL.Nat8),
    }),
  });

  /// [_Utxo] defined in Candid
  /// ```Candid
  ///   type Utxo = record { outpoint: record { txid: vec nat8; vout: nat32 }; value: nat64; height: nat32 };
  /// ```
  static final RecordClass _Utxo = IDL.Record({
    'outpoint': IDL.Record({
      'txid': IDL.Vec(
        IDL.Nat8,
      ),
      'vout': IDL.Nat32,
    }),
    'value': IDL.Nat64,
    'height': IDL.Nat32,
  });

  /// [_BitcoinAddress] defined in Candid
  /// ```Candid
  ///   type BitcoinAddress = variant { p2wpkh_v0: blob; p2pkh: blob; p2sh: blob };
  /// ```
  static final VariantClass _BitcoinAddress = IDL.Variant({
    'p2wpkh_v0': IDL.Vec(IDL.Nat8),
    'p2pkh': IDL.Vec(IDL.Nat8),
    'p2sh': IDL.Vec(IDL.Nat8),
  });

  /// [_Event] defined in Candid
  /// ```Candid
  ///   type Event = variant { init: InitArgs; upgrade: UpgradeArgs; received_utxos: record { to_account: Account; utxos: vec Utxo }; accepted_retrieve_btc_request: record { amount: nat64; address: BitcoinAddress; block_index: nat64; received_at: nat64; kyt_provider: opt principal }; removed_retrieve_btc_request: record { block_index: nat64 }; sent_transaction: record { requests: vec nat64; txid: blob; utxos: vec Utxo; change_output: opt record { vout: nat32; value: nat64 }; submitted_at: nat64 }; confirmed_transaction: record { txid: blob }; checked_utxo: record { utxo: Utxo; uuid: text; clean: bool; kyt_provider: opt principal }; ignored_utxo: record { utxo: Utxo }; retrieve_btc_kyt_failed: record { address: text; amount: nat64; kyt_provider: principal; uuid: text; block_index: nat64 } };
  /// ```
  static final VariantClass _Event = IDL.Variant({
    'init': _InitArgs,
    'upgrade': _UpgradeArgs,
    'received_utxos': IDL.Record({
      'to_account': _Account,
      'utxos': IDL.Vec(
        _Utxo,
      ),
    }),
    'accepted_retrieve_btc_request': IDL.Record({
      'amount': IDL.Nat64,
      'address': _BitcoinAddress,
      'block_index': IDL.Nat64,
      'received_at': IDL.Nat64,
      'kyt_provider': IDL.Opt(
        IDL.Principal,
      ),
    }),
    'removed_retrieve_btc_request': IDL.Record({
      'block_index': IDL.Nat64,
    }),
    'sent_transaction': IDL.Record({
      'requests': IDL.Vec(
        IDL.Nat64,
      ),
      'txid': IDL.Vec(IDL.Nat8),
      'utxos': IDL.Vec(
        _Utxo,
      ),
      'change_output': IDL.Opt(
        IDL.Record({
          'vout': IDL.Nat32,
          'value': IDL.Nat64,
        }),
      ),
      'submitted_at': IDL.Nat64,
    }),
    'confirmed_transaction': IDL.Record({
      'txid': IDL.Vec(IDL.Nat8),
    }),
    'checked_utxo': IDL.Record({
      'utxo': _Utxo,
      'uuid': IDL.Text,
      'clean': IDL.Bool,
      'kyt_provider': IDL.Opt(
        IDL.Principal,
      ),
    }),
    'ignored_utxo': IDL.Record({
      'utxo': _Utxo,
    }),
    'retrieve_btc_kyt_failed': IDL.Record({
      'address': IDL.Text,
      'amount': IDL.Nat64,
      'kyt_provider': IDL.Principal,
      'uuid': IDL.Text,
      'block_index': IDL.Nat64,
    }),
  });

  /// [_MinterArg] defined in Candid
  /// ```Candid
  ///   type MinterArg = variant { Init: InitArgs; Upgrade: opt UpgradeArgs };
  /// ```
  static final VariantClass _MinterArg = IDL.Variant({
    'Init': _InitArgs,
    'Upgrade': IDL.Opt(
      _UpgradeArgs,
    ),
  });

  static final ServiceClass idl = IDL.Service({
    'get_btc_address': IDL.Func(
      [
        IDL.Record({
          'owner': IDL.Opt(
            IDL.Principal,
          ),
          'subaccount': IDL.Opt(
            IDL.Vec(IDL.Nat8),
          ),
        })
      ],
      [IDL.Text],
      [],
    ),
    'update_balance': IDL.Func(
      [
        IDL.Record({
          'owner': IDL.Opt(
            IDL.Principal,
          ),
          'subaccount': IDL.Opt(
            IDL.Vec(IDL.Nat8),
          ),
        })
      ],
      [
        IDL.Variant({
          'Ok': IDL.Vec(
            _UtxoStatus,
          ),
          'Err': _UpdateBalanceError,
        })
      ],
      [],
    ),
    'estimate_withdrawal_fee': IDL.Func(
      [
        IDL.Record({
          'amount': IDL.Opt(
            IDL.Nat64,
          ),
        })
      ],
      [
        IDL.Record({
          'bitcoin_fee': IDL.Nat64,
          'minter_fee': IDL.Nat64,
        })
      ],
      ['query'],
    ),
    'get_deposit_fee': IDL.Func(
      [],
      [IDL.Nat64],
      ['query'],
    ),
    'get_withdrawal_account': IDL.Func(
      [],
      [_Account],
      [],
    ),
    'retrieve_btc': IDL.Func(
      [_RetrieveBtcArgs],
      [
        IDL.Variant({
          'Ok': _RetrieveBtcOk,
          'Err': _RetrieveBtcError,
        })
      ],
      [],
    ),
    'retrieve_btc_status': IDL.Func(
      [
        IDL.Record({
          'block_index': IDL.Nat64,
        })
      ],
      [_RetrieveBtcStatus],
      ['query'],
    ),
    'get_events': IDL.Func(
      [
        IDL.Record({
          'start': IDL.Nat64,
          'length': IDL.Nat64,
        })
      ],
      [
        IDL.Vec(
          _Event,
        )
      ],
      ['query'],
    ),
  });
  static final List<CType> $initIdl = <CType>[_MinterArg];
}

/// [GetBtcAddressArg0] defined in Candid
/// ```Candid
///   record { owner: opt principal; subaccount: opt blob }
/// ```
@immutable
class GetBtcAddressArg0 {
  const GetBtcAddressArg0({
    /// [owner] defined in Candid: `owner: opt principal`
    this.owner,

    /// [subaccount] defined in Candid: `subaccount: opt blob`
    this.subaccount,
  });

  factory GetBtcAddressArg0.fromJson(Map json) {
    return GetBtcAddressArg0(
      owner: (json['owner'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
      subaccount: (json['subaccount'] as List).map((e) {
        return e == null
            ? null
            : e is Uint8List
                ? e
                : Uint8List.fromList(e);
      }).firstOrNull,
    );
  }

  /// [owner] defined in Candid: `owner: opt principal`
  final Principal? owner;

  /// [subaccount] defined in Candid: `subaccount: opt blob`
  final Uint8List? subaccount;

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final subaccount = this.subaccount;
    return {
      'owner': [if (owner != null) owner],
      'subaccount': [if (subaccount != null) subaccount],
    };
  }

  GetBtcAddressArg0 copyWith({
    /// [owner] defined in Candid: `owner: opt principal`
    Principal? owner,

    /// [subaccount] defined in Candid: `subaccount: opt blob`
    Uint8List? subaccount,
  }) {
    return GetBtcAddressArg0(
      owner: owner ?? this.owner,
      subaccount: subaccount ?? this.subaccount,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetBtcAddressArg0 &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.subaccount, subaccount) || other.subaccount == subaccount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, owner, subaccount]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UpdateBalanceArg0] defined in Candid
/// ```Candid
///   record { owner: opt principal; subaccount: opt blob }
/// ```
typedef UpdateBalanceArg0 = GetBtcAddressArg0;

/// [UpdateBalanceRet0] defined in Candid
/// ```Candid
///   variant { Ok: vec UtxoStatus; Err: UpdateBalanceError }
/// ```
@immutable
class UpdateBalanceRet0 {
  const UpdateBalanceRet0({
    /// [ok] defined in Candid: `Ok: vec UtxoStatus`
    this.ok,

    /// [err] defined in Candid: `Err: UpdateBalanceError`
    this.err,
  });

  factory UpdateBalanceRet0.fromJson(Map json) {
    return UpdateBalanceRet0(
      ok: (json['Ok'] as List?)?.map((e) {
        return UtxoStatus.fromJson(e);
      }).toList(),
      err: json['Err'] == null ? null : UpdateBalanceError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: vec UtxoStatus`
  final List<UtxoStatus>? ok;

  /// [err] defined in Candid: `Err: UpdateBalanceError`
  final UpdateBalanceError? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  UpdateBalanceRet0 copyWith({
    /// [ok] defined in Candid: `Ok: vec UtxoStatus`
    List<UtxoStatus>? ok,

    /// [err] defined in Candid: `Err: UpdateBalanceError`
    UpdateBalanceError? err,
  }) {
    return UpdateBalanceRet0(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBalanceRet0 &&
            const DeepCollectionEquality().equals(other.ok, ok) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, const DeepCollectionEquality().hash(ok), err]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EstimateWithdrawalFeeArg0] defined in Candid
/// ```Candid
///   record { amount: opt nat64 }
/// ```
@immutable
class EstimateWithdrawalFeeArg0 {
  const EstimateWithdrawalFeeArg0(
      {
      /// [amount] defined in Candid: `amount: opt nat64`
      this.amount});

  factory EstimateWithdrawalFeeArg0.fromJson(Map json) {
    return EstimateWithdrawalFeeArg0(
      amount: (json['amount'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
    );
  }

  /// [amount] defined in Candid: `amount: opt nat64`
  final BigInt? amount;

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    return {
      'amount': [if (amount != null) amount],
    };
  }

  EstimateWithdrawalFeeArg0 copyWith(
      {
      /// [amount] defined in Candid: `amount: opt nat64`
      BigInt? amount}) {
    return EstimateWithdrawalFeeArg0(
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EstimateWithdrawalFeeArg0 &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, amount]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EstimateWithdrawalFeeRet0] defined in Candid
/// ```Candid
///   record { bitcoin_fee: nat64; minter_fee: nat64 }
/// ```
@immutable
class EstimateWithdrawalFeeRet0 {
  const EstimateWithdrawalFeeRet0({
    /// [bitcoinFee] defined in Candid: `bitcoin_fee: nat64`
    required this.bitcoinFee,

    /// [minterFee] defined in Candid: `minter_fee: nat64`
    required this.minterFee,
  });

  factory EstimateWithdrawalFeeRet0.fromJson(Map json) {
    return EstimateWithdrawalFeeRet0(
      bitcoinFee: json['bitcoin_fee'] is BigInt ? json['bitcoin_fee'] : BigInt.from(json['bitcoin_fee']),
      minterFee: json['minter_fee'] is BigInt ? json['minter_fee'] : BigInt.from(json['minter_fee']),
    );
  }

  /// [bitcoinFee] defined in Candid: `bitcoin_fee: nat64`
  final BigInt bitcoinFee;

  /// [minterFee] defined in Candid: `minter_fee: nat64`
  final BigInt minterFee;

  Map<String, dynamic> toJson() {
    final bitcoinFee = this.bitcoinFee;
    final minterFee = this.minterFee;
    return {
      'bitcoin_fee': bitcoinFee,
      'minter_fee': minterFee,
    };
  }

  EstimateWithdrawalFeeRet0 copyWith({
    /// [bitcoinFee] defined in Candid: `bitcoin_fee: nat64`
    BigInt? bitcoinFee,

    /// [minterFee] defined in Candid: `minter_fee: nat64`
    BigInt? minterFee,
  }) {
    return EstimateWithdrawalFeeRet0(
      bitcoinFee: bitcoinFee ?? this.bitcoinFee,
      minterFee: minterFee ?? this.minterFee,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EstimateWithdrawalFeeRet0 &&
            (identical(other.bitcoinFee, bitcoinFee) || other.bitcoinFee == bitcoinFee) &&
            (identical(other.minterFee, minterFee) || other.minterFee == minterFee));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, bitcoinFee, minterFee]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcRet0] defined in Candid
/// ```Candid
///   variant { Ok: RetrieveBtcOk; Err: RetrieveBtcError }
/// ```
@immutable
class RetrieveBtcRet0 {
  const RetrieveBtcRet0({
    /// [ok] defined in Candid: `Ok: RetrieveBtcOk`
    this.ok,

    /// [err] defined in Candid: `Err: RetrieveBtcError`
    this.err,
  });

  factory RetrieveBtcRet0.fromJson(Map json) {
    return RetrieveBtcRet0(
      ok: json['Ok'] == null ? null : RetrieveBtcOk.fromJson(json['Ok']),
      err: json['Err'] == null ? null : RetrieveBtcError.fromJson(json['Err']),
    );
  }

  /// [ok] defined in Candid: `Ok: RetrieveBtcOk`
  final RetrieveBtcOk? ok;

  /// [err] defined in Candid: `Err: RetrieveBtcError`
  final RetrieveBtcError? err;

  Map<String, dynamic> toJson() {
    final ok = this.ok;
    final err = this.err;
    return {
      if (ok != null) 'Ok': ok,
      if (err != null) 'Err': err,
    };
  }

  RetrieveBtcRet0 copyWith({
    /// [ok] defined in Candid: `Ok: RetrieveBtcOk`
    RetrieveBtcOk? ok,

    /// [err] defined in Candid: `Err: RetrieveBtcError`
    RetrieveBtcError? err,
  }) {
    return RetrieveBtcRet0(
      ok: ok ?? this.ok,
      err: err ?? this.err,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcRet0 &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, ok, err]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcStatusArg0] defined in Candid
/// ```Candid
///   record { block_index: nat64 }
/// ```
@immutable
class RetrieveBtcStatusArg0 {
  const RetrieveBtcStatusArg0(
      {
      /// [blockIndex] defined in Candid: `block_index: nat64`
      required this.blockIndex});

  factory RetrieveBtcStatusArg0.fromJson(Map json) {
    return RetrieveBtcStatusArg0(
      blockIndex: json['block_index'] is BigInt ? json['block_index'] : BigInt.from(json['block_index']),
    );
  }

  /// [blockIndex] defined in Candid: `block_index: nat64`
  final BigInt blockIndex;

  Map<String, dynamic> toJson() {
    final blockIndex = this.blockIndex;
    return {
      'block_index': blockIndex,
    };
  }

  RetrieveBtcStatusArg0 copyWith(
      {
      /// [blockIndex] defined in Candid: `block_index: nat64`
      BigInt? blockIndex}) {
    return RetrieveBtcStatusArg0(
      blockIndex: blockIndex ?? this.blockIndex,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcStatusArg0 &&
            (identical(other.blockIndex, blockIndex) || other.blockIndex == blockIndex));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, blockIndex]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcOk] defined in Candid
/// ```Candid
///   record { block_index: nat64 }
/// ```
typedef RetrieveBtcOk = RetrieveBtcStatusArg0;

/// [EventRemovedRetrieveBtcRequest] defined in Candid
/// ```Candid
///   record { block_index: nat64 }
/// ```
typedef EventRemovedRetrieveBtcRequest = RetrieveBtcStatusArg0;

/// [GetEventsArg0] defined in Candid
/// ```Candid
///   record { start: nat64; length: nat64 }
/// ```
@immutable
class GetEventsArg0 {
  const GetEventsArg0({
    /// [start] defined in Candid: `start: nat64`
    required this.start,

    /// [length] defined in Candid: `length: nat64`
    required this.length,
  });

  factory GetEventsArg0.fromJson(Map json) {
    return GetEventsArg0(
      start: json['start'] is BigInt ? json['start'] : BigInt.from(json['start']),
      length: json['length'] is BigInt ? json['length'] : BigInt.from(json['length']),
    );
  }

  /// [start] defined in Candid: `start: nat64`
  final BigInt start;

  /// [length] defined in Candid: `length: nat64`
  final BigInt length;

  Map<String, dynamic> toJson() {
    final start = this.start;
    final length = this.length;
    return {
      'start': start,
      'length': length,
    };
  }

  GetEventsArg0 copyWith({
    /// [start] defined in Candid: `start: nat64`
    BigInt? start,

    /// [length] defined in Candid: `length: nat64`
    BigInt? length,
  }) {
    return GetEventsArg0(
      start: start ?? this.start,
      length: length ?? this.length,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetEventsArg0 &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.length, length) || other.length == length));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, start, length]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Account] defined in Candid
/// ```Candid
///   record { owner: principal; subaccount: opt blob }
/// ```
@immutable
class Account {
  const Account({
    /// [owner] defined in Candid: `owner: principal`
    required this.owner,

    /// [subaccount] defined in Candid: `subaccount: opt blob`
    this.subaccount,
  });

  factory Account.fromJson(Map json) {
    return Account(
      owner: Principal.from(json['owner']),
      subaccount: (json['subaccount'] as List<dynamic>).map(
        (e) {
          return e == null
              ? null
              : e is Uint8List
                  ? e
                  : Uint8List.fromList((e as List).map((e) => e as int).toList());
        },
      ).firstOrNull,
    );
  }

  /// [owner] defined in Candid: `owner: principal`
  final Principal owner;

  /// [subaccount] defined in Candid: `subaccount: opt blob`
  final Uint8List? subaccount;

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final subaccount = this.subaccount;
    return {
      'owner': owner,
      'subaccount': [if (subaccount != null) subaccount],
    };
  }

  Account copyWith({
    /// [owner] defined in Candid: `owner: principal`
    Principal? owner,

    /// [subaccount] defined in Candid: `subaccount: opt blob`
    Uint8List? subaccount,
  }) {
    return Account(
      owner: owner ?? this.owner,
      subaccount: subaccount ?? this.subaccount,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Account &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.subaccount, subaccount) || other.subaccount == subaccount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, owner, subaccount]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcArgs] defined in Candid
/// ```Candid
///   record { address: text; amount: nat64 }
/// ```
@immutable
class RetrieveBtcArgs {
  const RetrieveBtcArgs({
    /// [address] defined in Candid: `address: text`
    required this.address,

    /// [amount] defined in Candid: `amount: nat64`
    required this.amount,
  });

  factory RetrieveBtcArgs.fromJson(Map json) {
    return RetrieveBtcArgs(
      address: json['address'],
      amount: json['amount'] is BigInt ? json['amount'] : BigInt.from(json['amount']),
    );
  }

  /// [address] defined in Candid: `address: text`
  final String address;

  /// [amount] defined in Candid: `amount: nat64`
  final BigInt amount;

  Map<String, dynamic> toJson() {
    final address = this.address;
    final amount = this.amount;
    return {
      'address': address,
      'amount': amount,
    };
  }

  RetrieveBtcArgs copyWith({
    /// [address] defined in Candid: `address: text`
    String? address,

    /// [amount] defined in Candid: `amount: nat64`
    BigInt? amount,
  }) {
    return RetrieveBtcArgs(
      address: address ?? this.address,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcArgs &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, address, amount]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcErrorInsufficientFunds] defined in Candid
/// ```Candid
///   record { balance: nat64 }
/// ```
@immutable
class RetrieveBtcErrorInsufficientFunds {
  const RetrieveBtcErrorInsufficientFunds(
      {
      /// [balance] defined in Candid: `balance: nat64`
      required this.balance});

  factory RetrieveBtcErrorInsufficientFunds.fromJson(Map json) {
    return RetrieveBtcErrorInsufficientFunds(
      balance: json['balance'] is BigInt ? json['balance'] : BigInt.from(json['balance']),
    );
  }

  /// [balance] defined in Candid: `balance: nat64`
  final BigInt balance;

  Map<String, dynamic> toJson() {
    final balance = this.balance;
    return {
      'balance': balance,
    };
  }

  RetrieveBtcErrorInsufficientFunds copyWith(
      {
      /// [balance] defined in Candid: `balance: nat64`
      BigInt? balance}) {
    return RetrieveBtcErrorInsufficientFunds(
      balance: balance ?? this.balance,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcErrorInsufficientFunds &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, balance]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcErrorGenericError] defined in Candid
/// ```Candid
///   record { error_message: text; error_code: nat64 }
/// ```
@immutable
class RetrieveBtcErrorGenericError {
  const RetrieveBtcErrorGenericError({
    /// [errorMessage] defined in Candid: `error_message: text`
    required this.errorMessage,

    /// [errorCode] defined in Candid: `error_code: nat64`
    required this.errorCode,
  });

  factory RetrieveBtcErrorGenericError.fromJson(Map json) {
    return RetrieveBtcErrorGenericError(
      errorMessage: json['error_message'],
      errorCode: json['error_code'] is BigInt ? json['error_code'] : BigInt.from(json['error_code']),
    );
  }

  /// [errorMessage] defined in Candid: `error_message: text`
  final String errorMessage;

  /// [errorCode] defined in Candid: `error_code: nat64`
  final BigInt errorCode;

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorCode = this.errorCode;
    return {
      'error_message': errorMessage,
      'error_code': errorCode,
    };
  }

  RetrieveBtcErrorGenericError copyWith({
    /// [errorMessage] defined in Candid: `error_message: text`
    String? errorMessage,

    /// [errorCode] defined in Candid: `error_code: nat64`
    BigInt? errorCode,
  }) {
    return RetrieveBtcErrorGenericError(
      errorMessage: errorMessage ?? this.errorMessage,
      errorCode: errorCode ?? this.errorCode,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcErrorGenericError &&
            (identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage) &&
            (identical(other.errorCode, errorCode) || other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, errorMessage, errorCode]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UpdateBalanceErrorGenericError] defined in Candid
/// ```Candid
///   record { error_message: text; error_code: nat64 }
/// ```
typedef UpdateBalanceErrorGenericError = RetrieveBtcErrorGenericError;

/// [RetrieveBtcError] defined in Candid
/// ```Candid
///   variant { MalformedAddress: text; AlreadyProcessing; AmountTooLow: nat64; InsufficientFunds: record { balance: nat64 }; TemporarilyUnavailable: text; GenericError: record { error_message: text; error_code: nat64 } }
/// ```
@immutable
class RetrieveBtcError {
  const RetrieveBtcError({
    /// [malformedAddress] defined in Candid: `MalformedAddress: text`
    this.malformedAddress,

    /// [alreadyProcessing] defined in Candid: `AlreadyProcessing`
    this.alreadyProcessing = false,

    /// [amountTooLow] defined in Candid: `AmountTooLow: nat64`
    this.amountTooLow,

    /// [insufficientFunds] defined in Candid: `InsufficientFunds: record { balance: nat64 }`
    this.insufficientFunds,

    /// [temporarilyUnavailable] defined in Candid: `TemporarilyUnavailable: text`
    this.temporarilyUnavailable,

    /// [genericError] defined in Candid: `GenericError: record { error_message: text; error_code: nat64 }`
    this.genericError,
  });

  factory RetrieveBtcError.fromJson(Map json) {
    return RetrieveBtcError(
      malformedAddress: json['MalformedAddress'],
      alreadyProcessing: json.containsKey('AlreadyProcessing'),
      amountTooLow: json['AmountTooLow'] == null
          ? null
          : json['AmountTooLow'] is BigInt
              ? json['AmountTooLow']
              : BigInt.from(json['AmountTooLow']),
      insufficientFunds: json['InsufficientFunds'] == null
          ? null
          : RetrieveBtcErrorInsufficientFunds.fromJson(
              json['InsufficientFunds'],
            ),
      temporarilyUnavailable: json['TemporarilyUnavailable'],
      genericError: json['GenericError'] == null
          ? null
          : RetrieveBtcErrorGenericError.fromJson(
              json['GenericError'],
            ),
    );
  }

  /// [malformedAddress] defined in Candid: `MalformedAddress: text`
  final String? malformedAddress;

  /// [alreadyProcessing] defined in Candid: `AlreadyProcessing`
  final bool alreadyProcessing;

  /// [amountTooLow] defined in Candid: `AmountTooLow: nat64`
  final BigInt? amountTooLow;

  /// [insufficientFunds] defined in Candid: `InsufficientFunds: record { balance: nat64 }`
  final RetrieveBtcErrorInsufficientFunds? insufficientFunds;

  /// [temporarilyUnavailable] defined in Candid: `TemporarilyUnavailable: text`
  final String? temporarilyUnavailable;

  /// [genericError] defined in Candid: `GenericError: record { error_message: text; error_code: nat64 }`
  final RetrieveBtcErrorGenericError? genericError;

  Map<String, dynamic> toJson() {
    final malformedAddress = this.malformedAddress;
    final alreadyProcessing = this.alreadyProcessing;
    final amountTooLow = this.amountTooLow;
    final insufficientFunds = this.insufficientFunds;
    final temporarilyUnavailable = this.temporarilyUnavailable;
    final genericError = this.genericError;
    return {
      if (malformedAddress != null) 'MalformedAddress': malformedAddress,
      if (alreadyProcessing) 'AlreadyProcessing': null,
      if (amountTooLow != null) 'AmountTooLow': amountTooLow,
      if (insufficientFunds != null) 'InsufficientFunds': insufficientFunds,
      if (temporarilyUnavailable != null) 'TemporarilyUnavailable': temporarilyUnavailable,
      if (genericError != null) 'GenericError': genericError,
    };
  }

  RetrieveBtcError copyWith({
    /// [malformedAddress] defined in Candid: `MalformedAddress: text`
    String? malformedAddress,

    /// [alreadyProcessing] defined in Candid: `AlreadyProcessing`
    bool? alreadyProcessing,

    /// [amountTooLow] defined in Candid: `AmountTooLow: nat64`
    BigInt? amountTooLow,

    /// [insufficientFunds] defined in Candid: `InsufficientFunds: record { balance: nat64 }`
    RetrieveBtcErrorInsufficientFunds? insufficientFunds,

    /// [temporarilyUnavailable] defined in Candid: `TemporarilyUnavailable: text`
    String? temporarilyUnavailable,

    /// [genericError] defined in Candid: `GenericError: record { error_message: text; error_code: nat64 }`
    RetrieveBtcErrorGenericError? genericError,
  }) {
    return RetrieveBtcError(
      malformedAddress: malformedAddress ?? this.malformedAddress,
      alreadyProcessing: alreadyProcessing ?? this.alreadyProcessing,
      amountTooLow: amountTooLow ?? this.amountTooLow,
      insufficientFunds: insufficientFunds ?? this.insufficientFunds,
      temporarilyUnavailable: temporarilyUnavailable ?? this.temporarilyUnavailable,
      genericError: genericError ?? this.genericError,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcError &&
            (identical(other.malformedAddress, malformedAddress) || other.malformedAddress == malformedAddress) &&
            (identical(other.alreadyProcessing, alreadyProcessing) || other.alreadyProcessing == alreadyProcessing) &&
            (identical(other.amountTooLow, amountTooLow) || other.amountTooLow == amountTooLow) &&
            (identical(other.insufficientFunds, insufficientFunds) || other.insufficientFunds == insufficientFunds) &&
            (identical(other.temporarilyUnavailable, temporarilyUnavailable) ||
                other.temporarilyUnavailable == temporarilyUnavailable) &&
            (identical(other.genericError, genericError) || other.genericError == genericError));
  }

  @override
  int get hashCode => Object.hashAll(
      [runtimeType, malformedAddress, alreadyProcessing, amountTooLow, insufficientFunds, temporarilyUnavailable, genericError]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UtxoStatusMinted] defined in Candid
/// ```Candid
///   record { block_index: nat64; minted_amount: nat64; utxo: Utxo }
/// ```
@immutable
class UtxoStatusMinted {
  const UtxoStatusMinted({
    /// [blockIndex] defined in Candid: `block_index: nat64`
    required this.blockIndex,

    /// [mintedAmount] defined in Candid: `minted_amount: nat64`
    required this.mintedAmount,

    /// [utxo] defined in Candid: `utxo: Utxo`
    required this.utxo,
  });

  factory UtxoStatusMinted.fromJson(Map json) {
    return UtxoStatusMinted(
      blockIndex: json['block_index'] is BigInt ? json['block_index'] : BigInt.from(json['block_index']),
      mintedAmount: json['minted_amount'] is BigInt ? json['minted_amount'] : BigInt.from(json['minted_amount']),
      utxo: Utxo.fromJson(json['utxo']),
    );
  }

  /// [blockIndex] defined in Candid: `block_index: nat64`
  final BigInt blockIndex;

  /// [mintedAmount] defined in Candid: `minted_amount: nat64`
  final BigInt mintedAmount;

  /// [utxo] defined in Candid: `utxo: Utxo`
  final Utxo utxo;

  Map<String, dynamic> toJson() {
    final blockIndex = this.blockIndex;
    final mintedAmount = this.mintedAmount;
    final utxo = this.utxo;
    return {
      'block_index': blockIndex,
      'minted_amount': mintedAmount,
      'utxo': utxo,
    };
  }

  UtxoStatusMinted copyWith({
    /// [blockIndex] defined in Candid: `block_index: nat64`
    BigInt? blockIndex,

    /// [mintedAmount] defined in Candid: `minted_amount: nat64`
    BigInt? mintedAmount,

    /// [utxo] defined in Candid: `utxo: Utxo`
    Utxo? utxo,
  }) {
    return UtxoStatusMinted(
      blockIndex: blockIndex ?? this.blockIndex,
      mintedAmount: mintedAmount ?? this.mintedAmount,
      utxo: utxo ?? this.utxo,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UtxoStatusMinted &&
            (identical(other.blockIndex, blockIndex) || other.blockIndex == blockIndex) &&
            (identical(other.mintedAmount, mintedAmount) || other.mintedAmount == mintedAmount) &&
            (identical(other.utxo, utxo) || other.utxo == utxo));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, blockIndex, mintedAmount, utxo]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UtxoStatus] defined in Candid
/// ```Candid
///   variant { ValueTooSmall: Utxo; Tainted: Utxo; Checked: Utxo; Minted: record { block_index: nat64; minted_amount: nat64; utxo: Utxo } }
/// ```
@immutable
class UtxoStatus {
  const UtxoStatus({
    /// [valueTooSmall] defined in Candid: `ValueTooSmall: Utxo`
    this.valueTooSmall,

    /// [tainted] defined in Candid: `Tainted: Utxo`
    this.tainted,

    /// [checked] defined in Candid: `Checked: Utxo`
    this.checked,

    /// [minted] defined in Candid: `Minted: record { block_index: nat64; minted_amount: nat64; utxo: Utxo }`
    this.minted,
  });

  factory UtxoStatus.fromJson(Map json) {
    return UtxoStatus(
      valueTooSmall: json['ValueTooSmall'] == null ? null : Utxo.fromJson(json['ValueTooSmall']),
      tainted: json['Tainted'] == null ? null : Utxo.fromJson(json['Tainted']),
      checked: json['Checked'] == null ? null : Utxo.fromJson(json['Checked']),
      minted: json['Minted'] == null
          ? null
          : UtxoStatusMinted.fromJson(
              json['Minted'],
            ),
    );
  }

  /// [valueTooSmall] defined in Candid: `ValueTooSmall: Utxo`
  final Utxo? valueTooSmall;

  /// [tainted] defined in Candid: `Tainted: Utxo`
  final Utxo? tainted;

  /// [checked] defined in Candid: `Checked: Utxo`
  final Utxo? checked;

  /// [minted] defined in Candid: `Minted: record { block_index: nat64; minted_amount: nat64; utxo: Utxo }`
  final UtxoStatusMinted? minted;

  Map<String, dynamic> toJson() {
    final valueTooSmall = this.valueTooSmall;
    final tainted = this.tainted;
    final checked = this.checked;
    final minted = this.minted;
    return {
      if (valueTooSmall != null) 'ValueTooSmall': valueTooSmall,
      if (tainted != null) 'Tainted': tainted,
      if (checked != null) 'Checked': checked,
      if (minted != null) 'Minted': minted,
    };
  }

  UtxoStatus copyWith({
    /// [valueTooSmall] defined in Candid: `ValueTooSmall: Utxo`
    Utxo? valueTooSmall,

    /// [tainted] defined in Candid: `Tainted: Utxo`
    Utxo? tainted,

    /// [checked] defined in Candid: `Checked: Utxo`
    Utxo? checked,

    /// [minted] defined in Candid: `Minted: record { block_index: nat64; minted_amount: nat64; utxo: Utxo }`
    UtxoStatusMinted? minted,
  }) {
    return UtxoStatus(
      valueTooSmall: valueTooSmall ?? this.valueTooSmall,
      tainted: tainted ?? this.tainted,
      checked: checked ?? this.checked,
      minted: minted ?? this.minted,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UtxoStatus &&
            (identical(other.valueTooSmall, valueTooSmall) || other.valueTooSmall == valueTooSmall) &&
            (identical(other.tainted, tainted) || other.tainted == tainted) &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.minted, minted) || other.minted == minted));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, valueTooSmall, tainted, checked, minted]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UpdateBalanceErrorNoNewUtxos] defined in Candid
/// ```Candid
///   record { current_confirmations: opt nat32; required_confirmations: nat32 }
/// ```
@immutable
class UpdateBalanceErrorNoNewUtxos {
  const UpdateBalanceErrorNoNewUtxos({
    /// [currentConfirmations] defined in Candid: `current_confirmations: opt nat32`
    this.currentConfirmations,

    /// [requiredConfirmations] defined in Candid: `required_confirmations: nat32`
    required this.requiredConfirmations,
  });

  factory UpdateBalanceErrorNoNewUtxos.fromJson(Map json) {
    return UpdateBalanceErrorNoNewUtxos(
      currentConfirmations: (json['current_confirmations'] as List).map((e) {
        return e;
      }).firstOrNull,
      requiredConfirmations: json['required_confirmations'],
    );
  }

  /// [currentConfirmations] defined in Candid: `current_confirmations: opt nat32`
  final int? currentConfirmations;

  /// [requiredConfirmations] defined in Candid: `required_confirmations: nat32`
  final int requiredConfirmations;

  Map<String, dynamic> toJson() {
    final currentConfirmations = this.currentConfirmations;
    final requiredConfirmations = this.requiredConfirmations;
    return {
      'current_confirmations': [if (currentConfirmations != null) currentConfirmations],
      'required_confirmations': requiredConfirmations,
    };
  }

  UpdateBalanceErrorNoNewUtxos copyWith({
    /// [currentConfirmations] defined in Candid: `current_confirmations: opt nat32`
    int? currentConfirmations,

    /// [requiredConfirmations] defined in Candid: `required_confirmations: nat32`
    int? requiredConfirmations,
  }) {
    return UpdateBalanceErrorNoNewUtxos(
      currentConfirmations: currentConfirmations ?? this.currentConfirmations,
      requiredConfirmations: requiredConfirmations ?? this.requiredConfirmations,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBalanceErrorNoNewUtxos &&
            (identical(other.currentConfirmations, currentConfirmations) || other.currentConfirmations == currentConfirmations) &&
            (identical(other.requiredConfirmations, requiredConfirmations) ||
                other.requiredConfirmations == requiredConfirmations));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, currentConfirmations, requiredConfirmations]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UpdateBalanceError] defined in Candid
/// ```Candid
///   variant { NoNewUtxos: record { current_confirmations: opt nat32; required_confirmations: nat32 }; AlreadyProcessing; TemporarilyUnavailable: text; GenericError: record { error_message: text; error_code: nat64 } }
/// ```
@immutable
class UpdateBalanceError {
  const UpdateBalanceError({
    /// [noNewUtxos] defined in Candid: `NoNewUtxos: record { current_confirmations: opt nat32; required_confirmations: nat32 }`
    this.noNewUtxos,

    /// [alreadyProcessing] defined in Candid: `AlreadyProcessing`
    this.alreadyProcessing = false,

    /// [temporarilyUnavailable] defined in Candid: `TemporarilyUnavailable: text`
    this.temporarilyUnavailable,

    /// [genericError] defined in Candid: `GenericError: record { error_message: text; error_code: nat64 }`
    this.genericError,
  });

  factory UpdateBalanceError.fromJson(Map json) {
    return UpdateBalanceError(
      noNewUtxos: json['NoNewUtxos'] == null
          ? null
          : UpdateBalanceErrorNoNewUtxos.fromJson(
              json['NoNewUtxos'],
            ),
      alreadyProcessing: json.containsKey('AlreadyProcessing'),
      temporarilyUnavailable: json['TemporarilyUnavailable'],
      genericError: json['GenericError'] == null
          ? null
          : UpdateBalanceErrorGenericError.fromJson(
              json['GenericError'],
            ),
    );
  }

  /// [noNewUtxos] defined in Candid: `NoNewUtxos: record { current_confirmations: opt nat32; required_confirmations: nat32 }`
  final UpdateBalanceErrorNoNewUtxos? noNewUtxos;

  /// [alreadyProcessing] defined in Candid: `AlreadyProcessing`
  final bool alreadyProcessing;

  /// [temporarilyUnavailable] defined in Candid: `TemporarilyUnavailable: text`
  final String? temporarilyUnavailable;

  /// [genericError] defined in Candid: `GenericError: record { error_message: text; error_code: nat64 }`
  final UpdateBalanceErrorGenericError? genericError;

  Map<String, dynamic> toJson() {
    final noNewUtxos = this.noNewUtxos;
    final alreadyProcessing = this.alreadyProcessing;
    final temporarilyUnavailable = this.temporarilyUnavailable;
    final genericError = this.genericError;
    return {
      if (noNewUtxos != null) 'NoNewUtxos': noNewUtxos,
      if (alreadyProcessing) 'AlreadyProcessing': null,
      if (temporarilyUnavailable != null) 'TemporarilyUnavailable': temporarilyUnavailable,
      if (genericError != null) 'GenericError': genericError,
    };
  }

  UpdateBalanceError copyWith({
    /// [noNewUtxos] defined in Candid: `NoNewUtxos: record { current_confirmations: opt nat32; required_confirmations: nat32 }`
    UpdateBalanceErrorNoNewUtxos? noNewUtxos,

    /// [alreadyProcessing] defined in Candid: `AlreadyProcessing`
    bool? alreadyProcessing,

    /// [temporarilyUnavailable] defined in Candid: `TemporarilyUnavailable: text`
    String? temporarilyUnavailable,

    /// [genericError] defined in Candid: `GenericError: record { error_message: text; error_code: nat64 }`
    UpdateBalanceErrorGenericError? genericError,
  }) {
    return UpdateBalanceError(
      noNewUtxos: noNewUtxos ?? this.noNewUtxos,
      alreadyProcessing: alreadyProcessing ?? this.alreadyProcessing,
      temporarilyUnavailable: temporarilyUnavailable ?? this.temporarilyUnavailable,
      genericError: genericError ?? this.genericError,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBalanceError &&
            (identical(other.noNewUtxos, noNewUtxos) || other.noNewUtxos == noNewUtxos) &&
            (identical(other.alreadyProcessing, alreadyProcessing) || other.alreadyProcessing == alreadyProcessing) &&
            (identical(other.temporarilyUnavailable, temporarilyUnavailable) ||
                other.temporarilyUnavailable == temporarilyUnavailable) &&
            (identical(other.genericError, genericError) || other.genericError == genericError));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, noNewUtxos, alreadyProcessing, temporarilyUnavailable, genericError]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [BtcNetwork] defined in Candid
/// ```Candid
///   variant { Mainnet; Testnet; Regtest }
/// ```
enum BtcNetwork {
  /// [mainnet] defined in Candid: `Mainnet`
  mainnet('Mainnet'),

  /// [testnet] defined in Candid: `Testnet`
  testnet('Testnet'),

  /// [regtest] defined in Candid: `Regtest`
  regtest('Regtest');

  const BtcNetwork(this.name);

  factory BtcNetwork.fromJson(Map json) {
    final key = json.keys.first;
    return BtcNetwork.values.firstWhere((e) => e.name == key);
  }

  final String name;

  Map<String, dynamic> toJson() {
    return {name: null};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Mode] defined in Candid
/// ```Candid
///   variant { ReadOnly; RestrictedTo: vec principal; DepositsRestrictedTo: vec principal; GeneralAvailability }
/// ```
@immutable
class Mode {
  const Mode({
    /// [readOnly] defined in Candid: `ReadOnly`
    this.readOnly = false,

    /// [restrictedTo] defined in Candid: `RestrictedTo: vec principal`
    this.restrictedTo,

    /// [depositsRestrictedTo] defined in Candid: `DepositsRestrictedTo: vec principal`
    this.depositsRestrictedTo,

    /// [generalAvailability] defined in Candid: `GeneralAvailability`
    this.generalAvailability = false,
  });

  factory Mode.fromJson(Map json) {
    return Mode(
      readOnly: json.containsKey('ReadOnly'),
      restrictedTo: (json['RestrictedTo'] as List?)?.map((e) {
        return Principal.from(e);
      }).toList(),
      depositsRestrictedTo: (json['DepositsRestrictedTo'] as List?)?.map((e) {
        return Principal.from(e);
      }).toList(),
      generalAvailability: json.containsKey('GeneralAvailability'),
    );
  }

  /// [readOnly] defined in Candid: `ReadOnly`
  final bool readOnly;

  /// [restrictedTo] defined in Candid: `RestrictedTo: vec principal`
  final List<Principal>? restrictedTo;

  /// [depositsRestrictedTo] defined in Candid: `DepositsRestrictedTo: vec principal`
  final List<Principal>? depositsRestrictedTo;

  /// [generalAvailability] defined in Candid: `GeneralAvailability`
  final bool generalAvailability;

  Map<String, dynamic> toJson() {
    final readOnly = this.readOnly;
    final restrictedTo = this.restrictedTo;
    final depositsRestrictedTo = this.depositsRestrictedTo;
    final generalAvailability = this.generalAvailability;
    return {
      if (readOnly) 'ReadOnly': null,
      if (restrictedTo != null) 'RestrictedTo': restrictedTo,
      if (depositsRestrictedTo != null) 'DepositsRestrictedTo': depositsRestrictedTo,
      if (generalAvailability) 'GeneralAvailability': null,
    };
  }

  Mode copyWith({
    /// [readOnly] defined in Candid: `ReadOnly`
    bool? readOnly,

    /// [restrictedTo] defined in Candid: `RestrictedTo: vec principal`
    List<Principal>? restrictedTo,

    /// [depositsRestrictedTo] defined in Candid: `DepositsRestrictedTo: vec principal`
    List<Principal>? depositsRestrictedTo,

    /// [generalAvailability] defined in Candid: `GeneralAvailability`
    bool? generalAvailability,
  }) {
    return Mode(
      readOnly: readOnly ?? this.readOnly,
      restrictedTo: restrictedTo ?? this.restrictedTo,
      depositsRestrictedTo: depositsRestrictedTo ?? this.depositsRestrictedTo,
      generalAvailability: generalAvailability ?? this.generalAvailability,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Mode &&
            (identical(other.readOnly, readOnly) || other.readOnly == readOnly) &&
            const DeepCollectionEquality().equals(other.restrictedTo, restrictedTo) &&
            const DeepCollectionEquality().equals(other.depositsRestrictedTo, depositsRestrictedTo) &&
            (identical(other.generalAvailability, generalAvailability) || other.generalAvailability == generalAvailability));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        readOnly,
        const DeepCollectionEquality().hash(restrictedTo),
        const DeepCollectionEquality().hash(depositsRestrictedTo),
        generalAvailability
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [InitArgs] defined in Candid
/// ```Candid
///   record { btc_network: BtcNetwork; ledger_id: principal; ecdsa_key_name: text; retrieve_btc_min_amount: nat64; max_time_in_queue_nanos: nat64; min_confirmations: opt nat32; mode: Mode; kyt_fee: opt nat64; kyt_principal: opt principal }
/// ```
@immutable
class InitArgs {
  const InitArgs({
    /// [btcNetwork] defined in Candid: `btc_network: BtcNetwork`
    required this.btcNetwork,

    /// [ledgerId] defined in Candid: `ledger_id: principal`
    required this.ledgerId,

    /// [ecdsaKeyName] defined in Candid: `ecdsa_key_name: text`
    required this.ecdsaKeyName,

    /// [retrieveBtcMinAmount] defined in Candid: `retrieve_btc_min_amount: nat64`
    required this.retrieveBtcMinAmount,

    /// [maxTimeInQueueNanos] defined in Candid: `max_time_in_queue_nanos: nat64`
    required this.maxTimeInQueueNanos,

    /// [minConfirmations] defined in Candid: `min_confirmations: opt nat32`
    this.minConfirmations,

    /// [mode] defined in Candid: `mode: Mode`
    required this.mode,

    /// [kytFee] defined in Candid: `kyt_fee: opt nat64`
    this.kytFee,

    /// [kytPrincipal] defined in Candid: `kyt_principal: opt principal`
    this.kytPrincipal,
  });

  factory InitArgs.fromJson(Map json) {
    return InitArgs(
      btcNetwork: BtcNetwork.fromJson(json['btc_network']),
      ledgerId: Principal.from(json['ledger_id']),
      ecdsaKeyName: json['ecdsa_key_name'],
      retrieveBtcMinAmount: json['retrieve_btc_min_amount'] is BigInt
          ? json['retrieve_btc_min_amount']
          : BigInt.from(json['retrieve_btc_min_amount']),
      maxTimeInQueueNanos: json['max_time_in_queue_nanos'] is BigInt
          ? json['max_time_in_queue_nanos']
          : BigInt.from(json['max_time_in_queue_nanos']),
      minConfirmations: (json['min_confirmations'] as List).map((e) {
        return e;
      }).firstOrNull,
      mode: Mode.fromJson(json['mode']),
      kytFee: (json['kyt_fee'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      kytPrincipal: (json['kyt_principal'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  /// [btcNetwork] defined in Candid: `btc_network: BtcNetwork`
  final BtcNetwork btcNetwork;

  /// [ledgerId] defined in Candid: `ledger_id: principal`
  final Principal ledgerId;

  /// [ecdsaKeyName] defined in Candid: `ecdsa_key_name: text`
  final String ecdsaKeyName;

  /// [retrieveBtcMinAmount] defined in Candid: `retrieve_btc_min_amount: nat64`
  final BigInt retrieveBtcMinAmount;

  /// [maxTimeInQueueNanos] defined in Candid: `max_time_in_queue_nanos: nat64`
  final BigInt maxTimeInQueueNanos;

  /// [minConfirmations] defined in Candid: `min_confirmations: opt nat32`
  final int? minConfirmations;

  /// [mode] defined in Candid: `mode: Mode`
  final Mode mode;

  /// [kytFee] defined in Candid: `kyt_fee: opt nat64`
  final BigInt? kytFee;

  /// [kytPrincipal] defined in Candid: `kyt_principal: opt principal`
  final Principal? kytPrincipal;

  Map<String, dynamic> toJson() {
    final btcNetwork = this.btcNetwork;
    final ledgerId = this.ledgerId;
    final ecdsaKeyName = this.ecdsaKeyName;
    final retrieveBtcMinAmount = this.retrieveBtcMinAmount;
    final maxTimeInQueueNanos = this.maxTimeInQueueNanos;
    final minConfirmations = this.minConfirmations;
    final mode = this.mode;
    final kytFee = this.kytFee;
    final kytPrincipal = this.kytPrincipal;
    return {
      'btc_network': btcNetwork,
      'ledger_id': ledgerId,
      'ecdsa_key_name': ecdsaKeyName,
      'retrieve_btc_min_amount': retrieveBtcMinAmount,
      'max_time_in_queue_nanos': maxTimeInQueueNanos,
      'min_confirmations': [if (minConfirmations != null) minConfirmations],
      'mode': mode,
      'kyt_fee': [if (kytFee != null) kytFee],
      'kyt_principal': [if (kytPrincipal != null) kytPrincipal],
    };
  }

  InitArgs copyWith({
    /// [btcNetwork] defined in Candid: `btc_network: BtcNetwork`
    BtcNetwork? btcNetwork,

    /// [ledgerId] defined in Candid: `ledger_id: principal`
    Principal? ledgerId,

    /// [ecdsaKeyName] defined in Candid: `ecdsa_key_name: text`
    String? ecdsaKeyName,

    /// [retrieveBtcMinAmount] defined in Candid: `retrieve_btc_min_amount: nat64`
    BigInt? retrieveBtcMinAmount,

    /// [maxTimeInQueueNanos] defined in Candid: `max_time_in_queue_nanos: nat64`
    BigInt? maxTimeInQueueNanos,

    /// [minConfirmations] defined in Candid: `min_confirmations: opt nat32`
    int? minConfirmations,

    /// [mode] defined in Candid: `mode: Mode`
    Mode? mode,

    /// [kytFee] defined in Candid: `kyt_fee: opt nat64`
    BigInt? kytFee,

    /// [kytPrincipal] defined in Candid: `kyt_principal: opt principal`
    Principal? kytPrincipal,
  }) {
    return InitArgs(
      btcNetwork: btcNetwork ?? this.btcNetwork,
      ledgerId: ledgerId ?? this.ledgerId,
      ecdsaKeyName: ecdsaKeyName ?? this.ecdsaKeyName,
      retrieveBtcMinAmount: retrieveBtcMinAmount ?? this.retrieveBtcMinAmount,
      maxTimeInQueueNanos: maxTimeInQueueNanos ?? this.maxTimeInQueueNanos,
      minConfirmations: minConfirmations ?? this.minConfirmations,
      mode: mode ?? this.mode,
      kytFee: kytFee ?? this.kytFee,
      kytPrincipal: kytPrincipal ?? this.kytPrincipal,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitArgs &&
            (identical(other.btcNetwork, btcNetwork) || other.btcNetwork == btcNetwork) &&
            (identical(other.ledgerId, ledgerId) || other.ledgerId == ledgerId) &&
            (identical(other.ecdsaKeyName, ecdsaKeyName) || other.ecdsaKeyName == ecdsaKeyName) &&
            (identical(other.retrieveBtcMinAmount, retrieveBtcMinAmount) || other.retrieveBtcMinAmount == retrieveBtcMinAmount) &&
            (identical(other.maxTimeInQueueNanos, maxTimeInQueueNanos) || other.maxTimeInQueueNanos == maxTimeInQueueNanos) &&
            (identical(other.minConfirmations, minConfirmations) || other.minConfirmations == minConfirmations) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.kytFee, kytFee) || other.kytFee == kytFee) &&
            (identical(other.kytPrincipal, kytPrincipal) || other.kytPrincipal == kytPrincipal));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        btcNetwork,
        ledgerId,
        ecdsaKeyName,
        retrieveBtcMinAmount,
        maxTimeInQueueNanos,
        minConfirmations,
        mode,
        kytFee,
        kytPrincipal
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UpgradeArgs] defined in Candid
/// ```Candid
///   record { retrieve_btc_min_amount: opt nat64; max_time_in_queue_nanos: opt nat64; min_confirmations: opt nat32; mode: opt Mode; kyt_fee: opt nat64; kyt_principal: opt principal }
/// ```
@immutable
class UpgradeArgs {
  const UpgradeArgs({
    /// [retrieveBtcMinAmount] defined in Candid: `retrieve_btc_min_amount: opt nat64`
    this.retrieveBtcMinAmount,

    /// [maxTimeInQueueNanos] defined in Candid: `max_time_in_queue_nanos: opt nat64`
    this.maxTimeInQueueNanos,

    /// [minConfirmations] defined in Candid: `min_confirmations: opt nat32`
    this.minConfirmations,

    /// [mode] defined in Candid: `mode: opt Mode`
    this.mode,

    /// [kytFee] defined in Candid: `kyt_fee: opt nat64`
    this.kytFee,

    /// [kytPrincipal] defined in Candid: `kyt_principal: opt principal`
    this.kytPrincipal,
  });

  factory UpgradeArgs.fromJson(Map json) {
    return UpgradeArgs(
      retrieveBtcMinAmount: (json['retrieve_btc_min_amount'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      maxTimeInQueueNanos: (json['max_time_in_queue_nanos'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      minConfirmations: (json['min_confirmations'] as List).map((e) {
        return e;
      }).firstOrNull,
      mode: (json['mode'] as List).map((e) {
        return e == null ? null : Mode.fromJson(e);
      }).firstOrNull,
      kytFee: (json['kyt_fee'] as List).map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      kytPrincipal: (json['kyt_principal'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  /// [retrieveBtcMinAmount] defined in Candid: `retrieve_btc_min_amount: opt nat64`
  final BigInt? retrieveBtcMinAmount;

  /// [maxTimeInQueueNanos] defined in Candid: `max_time_in_queue_nanos: opt nat64`
  final BigInt? maxTimeInQueueNanos;

  /// [minConfirmations] defined in Candid: `min_confirmations: opt nat32`
  final int? minConfirmations;

  /// [mode] defined in Candid: `mode: opt Mode`
  final Mode? mode;

  /// [kytFee] defined in Candid: `kyt_fee: opt nat64`
  final BigInt? kytFee;

  /// [kytPrincipal] defined in Candid: `kyt_principal: opt principal`
  final Principal? kytPrincipal;

  Map<String, dynamic> toJson() {
    final retrieveBtcMinAmount = this.retrieveBtcMinAmount;
    final maxTimeInQueueNanos = this.maxTimeInQueueNanos;
    final minConfirmations = this.minConfirmations;
    final mode = this.mode;
    final kytFee = this.kytFee;
    final kytPrincipal = this.kytPrincipal;
    return {
      'retrieve_btc_min_amount': [if (retrieveBtcMinAmount != null) retrieveBtcMinAmount],
      'max_time_in_queue_nanos': [if (maxTimeInQueueNanos != null) maxTimeInQueueNanos],
      'min_confirmations': [if (minConfirmations != null) minConfirmations],
      'mode': [if (mode != null) mode],
      'kyt_fee': [if (kytFee != null) kytFee],
      'kyt_principal': [if (kytPrincipal != null) kytPrincipal],
    };
  }

  UpgradeArgs copyWith({
    /// [retrieveBtcMinAmount] defined in Candid: `retrieve_btc_min_amount: opt nat64`
    BigInt? retrieveBtcMinAmount,

    /// [maxTimeInQueueNanos] defined in Candid: `max_time_in_queue_nanos: opt nat64`
    BigInt? maxTimeInQueueNanos,

    /// [minConfirmations] defined in Candid: `min_confirmations: opt nat32`
    int? minConfirmations,

    /// [mode] defined in Candid: `mode: opt Mode`
    Mode? mode,

    /// [kytFee] defined in Candid: `kyt_fee: opt nat64`
    BigInt? kytFee,

    /// [kytPrincipal] defined in Candid: `kyt_principal: opt principal`
    Principal? kytPrincipal,
  }) {
    return UpgradeArgs(
      retrieveBtcMinAmount: retrieveBtcMinAmount ?? this.retrieveBtcMinAmount,
      maxTimeInQueueNanos: maxTimeInQueueNanos ?? this.maxTimeInQueueNanos,
      minConfirmations: minConfirmations ?? this.minConfirmations,
      mode: mode ?? this.mode,
      kytFee: kytFee ?? this.kytFee,
      kytPrincipal: kytPrincipal ?? this.kytPrincipal,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpgradeArgs &&
            (identical(other.retrieveBtcMinAmount, retrieveBtcMinAmount) || other.retrieveBtcMinAmount == retrieveBtcMinAmount) &&
            (identical(other.maxTimeInQueueNanos, maxTimeInQueueNanos) || other.maxTimeInQueueNanos == maxTimeInQueueNanos) &&
            (identical(other.minConfirmations, minConfirmations) || other.minConfirmations == minConfirmations) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.kytFee, kytFee) || other.kytFee == kytFee) &&
            (identical(other.kytPrincipal, kytPrincipal) || other.kytPrincipal == kytPrincipal));
  }

  @override
  int get hashCode =>
      Object.hashAll([runtimeType, retrieveBtcMinAmount, maxTimeInQueueNanos, minConfirmations, mode, kytFee, kytPrincipal]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcStatusSending] defined in Candid
/// ```Candid
///   record { txid: blob }
/// ```
@immutable
class RetrieveBtcStatusSending {
  const RetrieveBtcStatusSending(
      {
      /// [txid] defined in Candid: `txid: blob`
      required this.txid});

  factory RetrieveBtcStatusSending.fromJson(Map json) {
    return RetrieveBtcStatusSending(
      txid: json['txid'] is Uint8List ? json['txid'] : Uint8List.fromList(json['txid']),
    );
  }

  /// [txid] defined in Candid: `txid: blob`
  final Uint8List txid;

  Map<String, dynamic> toJson() {
    final txid = this.txid;
    return {
      'txid': txid,
    };
  }

  RetrieveBtcStatusSending copyWith(
      {
      /// [txid] defined in Candid: `txid: blob`
      Uint8List? txid}) {
    return RetrieveBtcStatusSending(
      txid: txid ?? this.txid,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcStatusSending &&
            (identical(other.txid, txid) || other.txid == txid));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, txid]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [RetrieveBtcStatusSubmitted] defined in Candid
/// ```Candid
///   record { txid: blob }
/// ```
typedef RetrieveBtcStatusSubmitted = RetrieveBtcStatusSending;

/// [RetrieveBtcStatusConfirmed] defined in Candid
/// ```Candid
///   record { txid: blob }
/// ```
typedef RetrieveBtcStatusConfirmed = RetrieveBtcStatusSending;

/// [EventConfirmedTransaction] defined in Candid
/// ```Candid
///   record { txid: blob }
/// ```
typedef EventConfirmedTransaction = RetrieveBtcStatusSending;

/// [RetrieveBtcStatus] defined in Candid
/// ```Candid
///   variant { Unknown; Pending; Signing; Sending: record { txid: blob }; Submitted: record { txid: blob }; AmountTooLow; Confirmed: record { txid: blob } }
/// ```
@immutable
class RetrieveBtcStatus {
  const RetrieveBtcStatus({
    /// [unknown] defined in Candid: `Unknown`
    this.unknown = false,

    /// [pending] defined in Candid: `Pending`
    this.pending = false,

    /// [signing] defined in Candid: `Signing`
    this.signing = false,

    /// [sending] defined in Candid: `Sending: record { txid: blob }`
    this.sending,

    /// [submitted] defined in Candid: `Submitted: record { txid: blob }`
    this.submitted,

    /// [amountTooLow] defined in Candid: `AmountTooLow`
    this.amountTooLow = false,

    /// [confirmed] defined in Candid: `Confirmed: record { txid: blob }`
    this.confirmed,
  });

  factory RetrieveBtcStatus.fromJson(Map json) {
    return RetrieveBtcStatus(
      unknown: json.containsKey('Unknown'),
      pending: json.containsKey('Pending'),
      signing: json.containsKey('Signing'),
      sending: json['Sending'] == null
          ? null
          : RetrieveBtcStatusSending.fromJson(
              json['Sending'],
            ),
      submitted: json['Submitted'] == null
          ? null
          : RetrieveBtcStatusSubmitted.fromJson(
              json['Submitted'],
            ),
      amountTooLow: json.containsKey('AmountTooLow'),
      confirmed: json['Confirmed'] == null
          ? null
          : RetrieveBtcStatusConfirmed.fromJson(
              json['Confirmed'],
            ),
    );
  }

  /// [unknown] defined in Candid: `Unknown`
  final bool unknown;

  /// [pending] defined in Candid: `Pending`
  final bool pending;

  /// [signing] defined in Candid: `Signing`
  final bool signing;

  /// [sending] defined in Candid: `Sending: record { txid: blob }`
  final RetrieveBtcStatusSending? sending;

  /// [submitted] defined in Candid: `Submitted: record { txid: blob }`
  final RetrieveBtcStatusSubmitted? submitted;

  /// [amountTooLow] defined in Candid: `AmountTooLow`
  final bool amountTooLow;

  /// [confirmed] defined in Candid: `Confirmed: record { txid: blob }`
  final RetrieveBtcStatusConfirmed? confirmed;

  Map<String, dynamic> toJson() {
    final unknown = this.unknown;
    final pending = this.pending;
    final signing = this.signing;
    final sending = this.sending;
    final submitted = this.submitted;
    final amountTooLow = this.amountTooLow;
    final confirmed = this.confirmed;
    return {
      if (unknown) 'Unknown': null,
      if (pending) 'Pending': null,
      if (signing) 'Signing': null,
      if (sending != null) 'Sending': sending,
      if (submitted != null) 'Submitted': submitted,
      if (amountTooLow) 'AmountTooLow': null,
      if (confirmed != null) 'Confirmed': confirmed,
    };
  }

  RetrieveBtcStatus copyWith({
    /// [unknown] defined in Candid: `Unknown`
    bool? unknown,

    /// [pending] defined in Candid: `Pending`
    bool? pending,

    /// [signing] defined in Candid: `Signing`
    bool? signing,

    /// [sending] defined in Candid: `Sending: record { txid: blob }`
    RetrieveBtcStatusSending? sending,

    /// [submitted] defined in Candid: `Submitted: record { txid: blob }`
    RetrieveBtcStatusSubmitted? submitted,

    /// [amountTooLow] defined in Candid: `AmountTooLow`
    bool? amountTooLow,

    /// [confirmed] defined in Candid: `Confirmed: record { txid: blob }`
    RetrieveBtcStatusConfirmed? confirmed,
  }) {
    return RetrieveBtcStatus(
      unknown: unknown ?? this.unknown,
      pending: pending ?? this.pending,
      signing: signing ?? this.signing,
      sending: sending ?? this.sending,
      submitted: submitted ?? this.submitted,
      amountTooLow: amountTooLow ?? this.amountTooLow,
      confirmed: confirmed ?? this.confirmed,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RetrieveBtcStatus &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.signing, signing) || other.signing == signing) &&
            (identical(other.sending, sending) || other.sending == sending) &&
            (identical(other.submitted, submitted) || other.submitted == submitted) &&
            (identical(other.amountTooLow, amountTooLow) || other.amountTooLow == amountTooLow) &&
            (identical(other.confirmed, confirmed) || other.confirmed == confirmed));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, unknown, pending, signing, sending, submitted, amountTooLow, confirmed]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [UtxoOutpoint] defined in Candid
/// ```Candid
///   record { txid: vec nat8; vout: nat32 }
/// ```
@immutable
class UtxoOutpoint {
  const UtxoOutpoint({
    /// [txid] defined in Candid: `txid: vec nat8`
    required this.txid,

    /// [vout] defined in Candid: `vout: nat32`
    required this.vout,
  });

  factory UtxoOutpoint.fromJson(Map json) {
    return UtxoOutpoint(
      txid: json['txid'],
      vout: json['vout'],
    );
  }

  /// [txid] defined in Candid: `txid: vec nat8`
  final Uint8List txid;

  /// [vout] defined in Candid: `vout: nat32`
  final int vout;

  Map<String, dynamic> toJson() {
    final txid = this.txid;
    final vout = this.vout;
    return {
      'txid': txid,
      'vout': vout,
    };
  }

  UtxoOutpoint copyWith({
    /// [txid] defined in Candid: `txid: vec nat8`
    Uint8List? txid,

    /// [vout] defined in Candid: `vout: nat32`
    int? vout,
  }) {
    return UtxoOutpoint(
      txid: txid ?? this.txid,
      vout: vout ?? this.vout,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UtxoOutpoint &&
            (identical(other.txid, txid) || other.txid == txid) &&
            (identical(other.vout, vout) || other.vout == vout));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, txid, vout]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Utxo] defined in Candid
/// ```Candid
///   record { outpoint: record { txid: vec nat8; vout: nat32 }; value: nat64; height: nat32 }
/// ```
@immutable
class Utxo {
  const Utxo({
    /// [outpoint] defined in Candid: `outpoint: record { txid: vec nat8; vout: nat32 }`
    required this.outpoint,

    /// [value] defined in Candid: `value: nat64`
    required this.value,

    /// [height] defined in Candid: `height: nat32`
    required this.height,
  });

  factory Utxo.fromJson(Map json) {
    return Utxo(
      outpoint: UtxoOutpoint.fromJson(
        json['outpoint'],
      ),
      value: json['value'] is BigInt ? json['value'] : BigInt.from(json['value']),
      height: json['height'],
    );
  }

  /// [outpoint] defined in Candid: `outpoint: record { txid: vec nat8; vout: nat32 }`
  final UtxoOutpoint outpoint;

  /// [value] defined in Candid: `value: nat64`
  final BigInt value;

  /// [height] defined in Candid: `height: nat32`
  final int height;

  Map<String, dynamic> toJson() {
    final outpoint = this.outpoint;
    final value = this.value;
    final height = this.height;
    return {
      'outpoint': outpoint,
      'value': value,
      'height': height,
    };
  }

  Utxo copyWith({
    /// [outpoint] defined in Candid: `outpoint: record { txid: vec nat8; vout: nat32 }`
    UtxoOutpoint? outpoint,

    /// [value] defined in Candid: `value: nat64`
    BigInt? value,

    /// [height] defined in Candid: `height: nat32`
    int? height,
  }) {
    return Utxo(
      outpoint: outpoint ?? this.outpoint,
      value: value ?? this.value,
      height: height ?? this.height,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Utxo &&
            (identical(other.outpoint, outpoint) || other.outpoint == outpoint) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, outpoint, value, height]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [BitcoinAddress] defined in Candid
/// ```Candid
///   variant { p2wpkh_v0: blob; p2pkh: blob; p2sh: blob }
/// ```
@immutable
class BitcoinAddress {
  const BitcoinAddress({
    /// [p2wpkhV0] defined in Candid: `p2wpkh_v0: blob`
    this.p2wpkhV0,

    /// [p2pkh] defined in Candid: `p2pkh: blob`
    this.p2pkh,

    /// [p2sh] defined in Candid: `p2sh: blob`
    this.p2sh,
  });

  factory BitcoinAddress.fromJson(Map json) {
    return BitcoinAddress(
      p2wpkhV0: json['p2wpkh_v0'] == null
          ? null
          : json['p2wpkh_v0'] is Uint8List
              ? json['p2wpkh_v0']
              : Uint8List.fromList(json['p2wpkh_v0']),
      p2pkh: json['p2pkh'] == null
          ? null
          : json['p2pkh'] is Uint8List
              ? json['p2pkh']
              : Uint8List.fromList(json['p2pkh']),
      p2sh: json['p2sh'] == null
          ? null
          : json['p2sh'] is Uint8List
              ? json['p2sh']
              : Uint8List.fromList(json['p2sh']),
    );
  }

  /// [p2wpkhV0] defined in Candid: `p2wpkh_v0: blob`
  final Uint8List? p2wpkhV0;

  /// [p2pkh] defined in Candid: `p2pkh: blob`
  final Uint8List? p2pkh;

  /// [p2sh] defined in Candid: `p2sh: blob`
  final Uint8List? p2sh;

  Map<String, dynamic> toJson() {
    final p2wpkhV0 = this.p2wpkhV0;
    final p2pkh = this.p2pkh;
    final p2sh = this.p2sh;
    return {
      if (p2wpkhV0 != null) 'p2wpkh_v0': p2wpkhV0,
      if (p2pkh != null) 'p2pkh': p2pkh,
      if (p2sh != null) 'p2sh': p2sh,
    };
  }

  BitcoinAddress copyWith({
    /// [p2wpkhV0] defined in Candid: `p2wpkh_v0: blob`
    Uint8List? p2wpkhV0,

    /// [p2pkh] defined in Candid: `p2pkh: blob`
    Uint8List? p2pkh,

    /// [p2sh] defined in Candid: `p2sh: blob`
    Uint8List? p2sh,
  }) {
    return BitcoinAddress(
      p2wpkhV0: p2wpkhV0 ?? this.p2wpkhV0,
      p2pkh: p2pkh ?? this.p2pkh,
      p2sh: p2sh ?? this.p2sh,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BitcoinAddress &&
            (identical(other.p2wpkhV0, p2wpkhV0) || other.p2wpkhV0 == p2wpkhV0) &&
            (identical(other.p2pkh, p2pkh) || other.p2pkh == p2pkh) &&
            (identical(other.p2sh, p2sh) || other.p2sh == p2sh));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, p2wpkhV0, p2pkh, p2sh]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventReceivedUtxos] defined in Candid
/// ```Candid
///   record { to_account: Account; utxos: vec Utxo }
/// ```
@immutable
class EventReceivedUtxos {
  const EventReceivedUtxos({
    /// [toAccount] defined in Candid: `to_account: Account`
    required this.toAccount,

    /// [utxos] defined in Candid: `utxos: vec Utxo`
    required this.utxos,
  });

  factory EventReceivedUtxos.fromJson(Map json) {
    return EventReceivedUtxos(
      toAccount: Account.fromJson(json['to_account']),
      utxos: (json['utxos'] as List).map((e) {
        return Utxo.fromJson(e);
      }).toList(),
    );
  }

  /// [toAccount] defined in Candid: `to_account: Account`
  final Account toAccount;

  /// [utxos] defined in Candid: `utxos: vec Utxo`
  final List<Utxo> utxos;

  Map<String, dynamic> toJson() {
    final toAccount = this.toAccount;
    final utxos = this.utxos;
    return {
      'to_account': toAccount,
      'utxos': utxos,
    };
  }

  EventReceivedUtxos copyWith({
    /// [toAccount] defined in Candid: `to_account: Account`
    Account? toAccount,

    /// [utxos] defined in Candid: `utxos: vec Utxo`
    List<Utxo>? utxos,
  }) {
    return EventReceivedUtxos(
      toAccount: toAccount ?? this.toAccount,
      utxos: utxos ?? this.utxos,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventReceivedUtxos &&
            (identical(other.toAccount, toAccount) || other.toAccount == toAccount) &&
            const DeepCollectionEquality().equals(other.utxos, utxos));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, toAccount, const DeepCollectionEquality().hash(utxos)]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventAcceptedRetrieveBtcRequest] defined in Candid
/// ```Candid
///   record { amount: nat64; address: BitcoinAddress; block_index: nat64; received_at: nat64; kyt_provider: opt principal }
/// ```
@immutable
class EventAcceptedRetrieveBtcRequest {
  const EventAcceptedRetrieveBtcRequest({
    /// [amount] defined in Candid: `amount: nat64`
    required this.amount,

    /// [address] defined in Candid: `address: BitcoinAddress`
    required this.address,

    /// [blockIndex] defined in Candid: `block_index: nat64`
    required this.blockIndex,

    /// [receivedAt] defined in Candid: `received_at: nat64`
    required this.receivedAt,

    /// [kytProvider] defined in Candid: `kyt_provider: opt principal`
    this.kytProvider,
  });

  factory EventAcceptedRetrieveBtcRequest.fromJson(Map json) {
    return EventAcceptedRetrieveBtcRequest(
      amount: json['amount'] is BigInt ? json['amount'] : BigInt.from(json['amount']),
      address: BitcoinAddress.fromJson(json['address']),
      blockIndex: json['block_index'] is BigInt ? json['block_index'] : BigInt.from(json['block_index']),
      receivedAt: json['received_at'] is BigInt ? json['received_at'] : BigInt.from(json['received_at']),
      kytProvider: (json['kyt_provider'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  /// [amount] defined in Candid: `amount: nat64`
  final BigInt amount;

  /// [address] defined in Candid: `address: BitcoinAddress`
  final BitcoinAddress address;

  /// [blockIndex] defined in Candid: `block_index: nat64`
  final BigInt blockIndex;

  /// [receivedAt] defined in Candid: `received_at: nat64`
  final BigInt receivedAt;

  /// [kytProvider] defined in Candid: `kyt_provider: opt principal`
  final Principal? kytProvider;

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final address = this.address;
    final blockIndex = this.blockIndex;
    final receivedAt = this.receivedAt;
    final kytProvider = this.kytProvider;
    return {
      'amount': amount,
      'address': address,
      'block_index': blockIndex,
      'received_at': receivedAt,
      'kyt_provider': [if (kytProvider != null) kytProvider],
    };
  }

  EventAcceptedRetrieveBtcRequest copyWith({
    /// [amount] defined in Candid: `amount: nat64`
    BigInt? amount,

    /// [address] defined in Candid: `address: BitcoinAddress`
    BitcoinAddress? address,

    /// [blockIndex] defined in Candid: `block_index: nat64`
    BigInt? blockIndex,

    /// [receivedAt] defined in Candid: `received_at: nat64`
    BigInt? receivedAt,

    /// [kytProvider] defined in Candid: `kyt_provider: opt principal`
    Principal? kytProvider,
  }) {
    return EventAcceptedRetrieveBtcRequest(
      amount: amount ?? this.amount,
      address: address ?? this.address,
      blockIndex: blockIndex ?? this.blockIndex,
      receivedAt: receivedAt ?? this.receivedAt,
      kytProvider: kytProvider ?? this.kytProvider,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventAcceptedRetrieveBtcRequest &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.blockIndex, blockIndex) || other.blockIndex == blockIndex) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.kytProvider, kytProvider) || other.kytProvider == kytProvider));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, amount, address, blockIndex, receivedAt, kytProvider]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventSentTransactionChangeOutputOpt] defined in Candid
/// ```Candid
///   record { vout: nat32; value: nat64 }
/// ```
@immutable
class EventSentTransactionChangeOutputOpt {
  const EventSentTransactionChangeOutputOpt({
    /// [vout] defined in Candid: `vout: nat32`
    required this.vout,

    /// [value] defined in Candid: `value: nat64`
    required this.value,
  });

  factory EventSentTransactionChangeOutputOpt.fromJson(Map json) {
    return EventSentTransactionChangeOutputOpt(
      vout: json['vout'],
      value: json['value'] is BigInt ? json['value'] : BigInt.from(json['value']),
    );
  }

  /// [vout] defined in Candid: `vout: nat32`
  final int vout;

  /// [value] defined in Candid: `value: nat64`
  final BigInt value;

  Map<String, dynamic> toJson() {
    final vout = this.vout;
    final value = this.value;
    return {
      'vout': vout,
      'value': value,
    };
  }

  EventSentTransactionChangeOutputOpt copyWith({
    /// [vout] defined in Candid: `vout: nat32`
    int? vout,

    /// [value] defined in Candid: `value: nat64`
    BigInt? value,
  }) {
    return EventSentTransactionChangeOutputOpt(
      vout: vout ?? this.vout,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventSentTransactionChangeOutputOpt &&
            (identical(other.vout, vout) || other.vout == vout) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, vout, value]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventSentTransaction] defined in Candid
/// ```Candid
///   record { requests: vec nat64; txid: blob; utxos: vec Utxo; change_output: opt record { vout: nat32; value: nat64 }; submitted_at: nat64 }
/// ```
@immutable
class EventSentTransaction {
  const EventSentTransaction({
    /// [requests] defined in Candid: `requests: vec nat64`
    required this.requests,

    /// [txid] defined in Candid: `txid: blob`
    required this.txid,

    /// [utxos] defined in Candid: `utxos: vec Utxo`
    required this.utxos,

    /// [changeOutput] defined in Candid: `change_output: opt record { vout: nat32; value: nat64 }`
    this.changeOutput,

    /// [submittedAt] defined in Candid: `submitted_at: nat64`
    required this.submittedAt,
  });

  factory EventSentTransaction.fromJson(Map json) {
    return EventSentTransaction(
      requests: (json['requests'] as List).map((e) {
        return e is BigInt ? e : BigInt.from(e);
      }).toList(),
      txid: json['txid'] is Uint8List ? json['txid'] : Uint8List.fromList(json['txid']),
      utxos: (json['utxos'] as List).map((e) {
        return Utxo.fromJson(e);
      }).toList(),
      changeOutput: (json['change_output'] as List).map((e) {
        return e == null
            ? null
            : EventSentTransactionChangeOutputOpt.fromJson(
                e,
              );
      }).firstOrNull,
      submittedAt: json['submitted_at'] is BigInt ? json['submitted_at'] : BigInt.from(json['submitted_at']),
    );
  }

  /// [requests] defined in Candid: `requests: vec nat64`
  final List<BigInt> requests;

  /// [txid] defined in Candid: `txid: blob`
  final Uint8List txid;

  /// [utxos] defined in Candid: `utxos: vec Utxo`
  final List<Utxo> utxos;

  /// [changeOutput] defined in Candid: `change_output: opt record { vout: nat32; value: nat64 }`
  final EventSentTransactionChangeOutputOpt? changeOutput;

  /// [submittedAt] defined in Candid: `submitted_at: nat64`
  final BigInt submittedAt;

  Map<String, dynamic> toJson() {
    final requests = this.requests;
    final txid = this.txid;
    final utxos = this.utxos;
    final changeOutput = this.changeOutput;
    final submittedAt = this.submittedAt;
    return {
      'requests': requests,
      'txid': txid,
      'utxos': utxos,
      'change_output': [if (changeOutput != null) changeOutput],
      'submitted_at': submittedAt,
    };
  }

  EventSentTransaction copyWith({
    /// [requests] defined in Candid: `requests: vec nat64`
    List<BigInt>? requests,

    /// [txid] defined in Candid: `txid: blob`
    Uint8List? txid,

    /// [utxos] defined in Candid: `utxos: vec Utxo`
    List<Utxo>? utxos,

    /// [changeOutput] defined in Candid: `change_output: opt record { vout: nat32; value: nat64 }`
    EventSentTransactionChangeOutputOpt? changeOutput,

    /// [submittedAt] defined in Candid: `submitted_at: nat64`
    BigInt? submittedAt,
  }) {
    return EventSentTransaction(
      requests: requests ?? this.requests,
      txid: txid ?? this.txid,
      utxos: utxos ?? this.utxos,
      changeOutput: changeOutput ?? this.changeOutput,
      submittedAt: submittedAt ?? this.submittedAt,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventSentTransaction &&
            const DeepCollectionEquality().equals(other.requests, requests) &&
            (identical(other.txid, txid) || other.txid == txid) &&
            const DeepCollectionEquality().equals(other.utxos, utxos) &&
            (identical(other.changeOutput, changeOutput) || other.changeOutput == changeOutput) &&
            (identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(requests),
        txid,
        const DeepCollectionEquality().hash(utxos),
        changeOutput,
        submittedAt
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventCheckedUtxo] defined in Candid
/// ```Candid
///   record { utxo: Utxo; uuid: text; clean: bool; kyt_provider: opt principal }
/// ```
@immutable
class EventCheckedUtxo {
  const EventCheckedUtxo({
    /// [utxo] defined in Candid: `utxo: Utxo`
    required this.utxo,

    /// [uuid] defined in Candid: `uuid: text`
    required this.uuid,

    /// [clean] defined in Candid: `clean: bool`
    required this.clean,

    /// [kytProvider] defined in Candid: `kyt_provider: opt principal`
    this.kytProvider,
  });

  factory EventCheckedUtxo.fromJson(Map json) {
    return EventCheckedUtxo(
      utxo: Utxo.fromJson(json['utxo']),
      uuid: json['uuid'],
      clean: json['clean'],
      kytProvider: (json['kyt_provider'] as List).map((e) {
        return e == null ? null : Principal.from(e);
      }).firstOrNull,
    );
  }

  /// [utxo] defined in Candid: `utxo: Utxo`
  final Utxo utxo;

  /// [uuid] defined in Candid: `uuid: text`
  final String uuid;

  /// [clean] defined in Candid: `clean: bool`
  final bool clean;

  /// [kytProvider] defined in Candid: `kyt_provider: opt principal`
  final Principal? kytProvider;

  Map<String, dynamic> toJson() {
    final utxo = this.utxo;
    final uuid = this.uuid;
    final clean = this.clean;
    final kytProvider = this.kytProvider;
    return {
      'utxo': utxo,
      'uuid': uuid,
      'clean': clean,
      'kyt_provider': [if (kytProvider != null) kytProvider],
    };
  }

  EventCheckedUtxo copyWith({
    /// [utxo] defined in Candid: `utxo: Utxo`
    Utxo? utxo,

    /// [uuid] defined in Candid: `uuid: text`
    String? uuid,

    /// [clean] defined in Candid: `clean: bool`
    bool? clean,

    /// [kytProvider] defined in Candid: `kyt_provider: opt principal`
    Principal? kytProvider,
  }) {
    return EventCheckedUtxo(
      utxo: utxo ?? this.utxo,
      uuid: uuid ?? this.uuid,
      clean: clean ?? this.clean,
      kytProvider: kytProvider ?? this.kytProvider,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventCheckedUtxo &&
            (identical(other.utxo, utxo) || other.utxo == utxo) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.clean, clean) || other.clean == clean) &&
            (identical(other.kytProvider, kytProvider) || other.kytProvider == kytProvider));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, utxo, uuid, clean, kytProvider]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventIgnoredUtxo] defined in Candid
/// ```Candid
///   record { utxo: Utxo }
/// ```
@immutable
class EventIgnoredUtxo {
  const EventIgnoredUtxo(
      {
      /// [utxo] defined in Candid: `utxo: Utxo`
      required this.utxo});

  factory EventIgnoredUtxo.fromJson(Map json) {
    return EventIgnoredUtxo(
      utxo: Utxo.fromJson(json['utxo']),
    );
  }

  /// [utxo] defined in Candid: `utxo: Utxo`
  final Utxo utxo;

  Map<String, dynamic> toJson() {
    final utxo = this.utxo;
    return {
      'utxo': utxo,
    };
  }

  EventIgnoredUtxo copyWith(
      {
      /// [utxo] defined in Candid: `utxo: Utxo`
      Utxo? utxo}) {
    return EventIgnoredUtxo(
      utxo: utxo ?? this.utxo,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EventIgnoredUtxo && (identical(other.utxo, utxo) || other.utxo == utxo));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, utxo]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [EventRetrieveBtcKytFailed] defined in Candid
/// ```Candid
///   record { address: text; amount: nat64; kyt_provider: principal; uuid: text; block_index: nat64 }
/// ```
@immutable
class EventRetrieveBtcKytFailed {
  const EventRetrieveBtcKytFailed({
    /// [address] defined in Candid: `address: text`
    required this.address,

    /// [amount] defined in Candid: `amount: nat64`
    required this.amount,

    /// [kytProvider] defined in Candid: `kyt_provider: principal`
    required this.kytProvider,

    /// [uuid] defined in Candid: `uuid: text`
    required this.uuid,

    /// [blockIndex] defined in Candid: `block_index: nat64`
    required this.blockIndex,
  });

  factory EventRetrieveBtcKytFailed.fromJson(Map json) {
    return EventRetrieveBtcKytFailed(
      address: json['address'],
      amount: json['amount'] is BigInt ? json['amount'] : BigInt.from(json['amount']),
      kytProvider: Principal.from(json['kyt_provider']),
      uuid: json['uuid'],
      blockIndex: json['block_index'] is BigInt ? json['block_index'] : BigInt.from(json['block_index']),
    );
  }

  /// [address] defined in Candid: `address: text`
  final String address;

  /// [amount] defined in Candid: `amount: nat64`
  final BigInt amount;

  /// [kytProvider] defined in Candid: `kyt_provider: principal`
  final Principal kytProvider;

  /// [uuid] defined in Candid: `uuid: text`
  final String uuid;

  /// [blockIndex] defined in Candid: `block_index: nat64`
  final BigInt blockIndex;

  Map<String, dynamic> toJson() {
    final address = this.address;
    final amount = this.amount;
    final kytProvider = this.kytProvider;
    final uuid = this.uuid;
    final blockIndex = this.blockIndex;
    return {
      'address': address,
      'amount': amount,
      'kyt_provider': kytProvider,
      'uuid': uuid,
      'block_index': blockIndex,
    };
  }

  EventRetrieveBtcKytFailed copyWith({
    /// [address] defined in Candid: `address: text`
    String? address,

    /// [amount] defined in Candid: `amount: nat64`
    BigInt? amount,

    /// [kytProvider] defined in Candid: `kyt_provider: principal`
    Principal? kytProvider,

    /// [uuid] defined in Candid: `uuid: text`
    String? uuid,

    /// [blockIndex] defined in Candid: `block_index: nat64`
    BigInt? blockIndex,
  }) {
    return EventRetrieveBtcKytFailed(
      address: address ?? this.address,
      amount: amount ?? this.amount,
      kytProvider: kytProvider ?? this.kytProvider,
      uuid: uuid ?? this.uuid,
      blockIndex: blockIndex ?? this.blockIndex,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventRetrieveBtcKytFailed &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.kytProvider, kytProvider) || other.kytProvider == kytProvider) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.blockIndex, blockIndex) || other.blockIndex == blockIndex));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, address, amount, kytProvider, uuid, blockIndex]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [Event] defined in Candid
/// ```Candid
///   variant { init: InitArgs; upgrade: UpgradeArgs; received_utxos: record { to_account: Account; utxos: vec Utxo }; accepted_retrieve_btc_request: record { amount: nat64; address: BitcoinAddress; block_index: nat64; received_at: nat64; kyt_provider: opt principal }; removed_retrieve_btc_request: record { block_index: nat64 }; sent_transaction: record { requests: vec nat64; txid: blob; utxos: vec Utxo; change_output: opt record { vout: nat32; value: nat64 }; submitted_at: nat64 }; confirmed_transaction: record { txid: blob }; checked_utxo: record { utxo: Utxo; uuid: text; clean: bool; kyt_provider: opt principal }; ignored_utxo: record { utxo: Utxo }; retrieve_btc_kyt_failed: record { address: text; amount: nat64; kyt_provider: principal; uuid: text; block_index: nat64 } }
/// ```
@immutable
class Event {
  const Event({
    /// [init] defined in Candid: `init: InitArgs`
    this.init,

    /// [upgrade] defined in Candid: `upgrade: UpgradeArgs`
    this.upgrade,

    /// [receivedUtxos] defined in Candid: `received_utxos: record { to_account: Account; utxos: vec Utxo }`
    this.receivedUtxos,

    /// [acceptedRetrieveBtcRequest] defined in Candid: `accepted_retrieve_btc_request: record { amount: nat64; address: BitcoinAddress; block_index: nat64; received_at: nat64; kyt_provider: opt principal }`
    this.acceptedRetrieveBtcRequest,

    /// [removedRetrieveBtcRequest] defined in Candid: `removed_retrieve_btc_request: record { block_index: nat64 }`
    this.removedRetrieveBtcRequest,

    /// [sentTransaction] defined in Candid: `sent_transaction: record { requests: vec nat64; txid: blob; utxos: vec Utxo; change_output: opt record { vout: nat32; value: nat64 }; submitted_at: nat64 }`
    this.sentTransaction,

    /// [confirmedTransaction] defined in Candid: `confirmed_transaction: record { txid: blob }`
    this.confirmedTransaction,

    /// [checkedUtxo] defined in Candid: `checked_utxo: record { utxo: Utxo; uuid: text; clean: bool; kyt_provider: opt principal }`
    this.checkedUtxo,

    /// [ignoredUtxo] defined in Candid: `ignored_utxo: record { utxo: Utxo }`
    this.ignoredUtxo,

    /// [retrieveBtcKytFailed] defined in Candid: `retrieve_btc_kyt_failed: record { address: text; amount: nat64; kyt_provider: principal; uuid: text; block_index: nat64 }`
    this.retrieveBtcKytFailed,
  });

  factory Event.fromJson(Map json) {
    return Event(
      init: json['init'] == null ? null : InitArgs.fromJson(json['init']),
      upgrade: json['upgrade'] == null ? null : UpgradeArgs.fromJson(json['upgrade']),
      receivedUtxos: json['received_utxos'] == null
          ? null
          : EventReceivedUtxos.fromJson(
              json['received_utxos'],
            ),
      acceptedRetrieveBtcRequest: json['accepted_retrieve_btc_request'] == null
          ? null
          : EventAcceptedRetrieveBtcRequest.fromJson(
              json['accepted_retrieve_btc_request'],
            ),
      removedRetrieveBtcRequest: json['removed_retrieve_btc_request'] == null
          ? null
          : EventRemovedRetrieveBtcRequest.fromJson(
              json['removed_retrieve_btc_request'],
            ),
      sentTransaction: json['sent_transaction'] == null
          ? null
          : EventSentTransaction.fromJson(
              json['sent_transaction'],
            ),
      confirmedTransaction: json['confirmed_transaction'] == null
          ? null
          : EventConfirmedTransaction.fromJson(
              json['confirmed_transaction'],
            ),
      checkedUtxo: json['checked_utxo'] == null
          ? null
          : EventCheckedUtxo.fromJson(
              json['checked_utxo'],
            ),
      ignoredUtxo: json['ignored_utxo'] == null
          ? null
          : EventIgnoredUtxo.fromJson(
              json['ignored_utxo'],
            ),
      retrieveBtcKytFailed: json['retrieve_btc_kyt_failed'] == null
          ? null
          : EventRetrieveBtcKytFailed.fromJson(
              json['retrieve_btc_kyt_failed'],
            ),
    );
  }

  /// [init] defined in Candid: `init: InitArgs`
  final InitArgs? init;

  /// [upgrade] defined in Candid: `upgrade: UpgradeArgs`
  final UpgradeArgs? upgrade;

  /// [receivedUtxos] defined in Candid: `received_utxos: record { to_account: Account; utxos: vec Utxo }`
  final EventReceivedUtxos? receivedUtxos;

  /// [acceptedRetrieveBtcRequest] defined in Candid: `accepted_retrieve_btc_request: record { amount: nat64; address: BitcoinAddress; block_index: nat64; received_at: nat64; kyt_provider: opt principal }`
  final EventAcceptedRetrieveBtcRequest? acceptedRetrieveBtcRequest;

  /// [removedRetrieveBtcRequest] defined in Candid: `removed_retrieve_btc_request: record { block_index: nat64 }`
  final EventRemovedRetrieveBtcRequest? removedRetrieveBtcRequest;

  /// [sentTransaction] defined in Candid: `sent_transaction: record { requests: vec nat64; txid: blob; utxos: vec Utxo; change_output: opt record { vout: nat32; value: nat64 }; submitted_at: nat64 }`
  final EventSentTransaction? sentTransaction;

  /// [confirmedTransaction] defined in Candid: `confirmed_transaction: record { txid: blob }`
  final EventConfirmedTransaction? confirmedTransaction;

  /// [checkedUtxo] defined in Candid: `checked_utxo: record { utxo: Utxo; uuid: text; clean: bool; kyt_provider: opt principal }`
  final EventCheckedUtxo? checkedUtxo;

  /// [ignoredUtxo] defined in Candid: `ignored_utxo: record { utxo: Utxo }`
  final EventIgnoredUtxo? ignoredUtxo;

  /// [retrieveBtcKytFailed] defined in Candid: `retrieve_btc_kyt_failed: record { address: text; amount: nat64; kyt_provider: principal; uuid: text; block_index: nat64 }`
  final EventRetrieveBtcKytFailed? retrieveBtcKytFailed;

  Map<String, dynamic> toJson() {
    final init = this.init;
    final upgrade = this.upgrade;
    final receivedUtxos = this.receivedUtxos;
    final acceptedRetrieveBtcRequest = this.acceptedRetrieveBtcRequest;
    final removedRetrieveBtcRequest = this.removedRetrieveBtcRequest;
    final sentTransaction = this.sentTransaction;
    final confirmedTransaction = this.confirmedTransaction;
    final checkedUtxo = this.checkedUtxo;
    final ignoredUtxo = this.ignoredUtxo;
    final retrieveBtcKytFailed = this.retrieveBtcKytFailed;
    return {
      if (init != null) 'init': init,
      if (upgrade != null) 'upgrade': upgrade,
      if (receivedUtxos != null) 'received_utxos': receivedUtxos,
      if (acceptedRetrieveBtcRequest != null) 'accepted_retrieve_btc_request': acceptedRetrieveBtcRequest,
      if (removedRetrieveBtcRequest != null) 'removed_retrieve_btc_request': removedRetrieveBtcRequest,
      if (sentTransaction != null) 'sent_transaction': sentTransaction,
      if (confirmedTransaction != null) 'confirmed_transaction': confirmedTransaction,
      if (checkedUtxo != null) 'checked_utxo': checkedUtxo,
      if (ignoredUtxo != null) 'ignored_utxo': ignoredUtxo,
      if (retrieveBtcKytFailed != null) 'retrieve_btc_kyt_failed': retrieveBtcKytFailed,
    };
  }

  Event copyWith({
    /// [init] defined in Candid: `init: InitArgs`
    InitArgs? init,

    /// [upgrade] defined in Candid: `upgrade: UpgradeArgs`
    UpgradeArgs? upgrade,

    /// [receivedUtxos] defined in Candid: `received_utxos: record { to_account: Account; utxos: vec Utxo }`
    EventReceivedUtxos? receivedUtxos,

    /// [acceptedRetrieveBtcRequest] defined in Candid: `accepted_retrieve_btc_request: record { amount: nat64; address: BitcoinAddress; block_index: nat64; received_at: nat64; kyt_provider: opt principal }`
    EventAcceptedRetrieveBtcRequest? acceptedRetrieveBtcRequest,

    /// [removedRetrieveBtcRequest] defined in Candid: `removed_retrieve_btc_request: record { block_index: nat64 }`
    EventRemovedRetrieveBtcRequest? removedRetrieveBtcRequest,

    /// [sentTransaction] defined in Candid: `sent_transaction: record { requests: vec nat64; txid: blob; utxos: vec Utxo; change_output: opt record { vout: nat32; value: nat64 }; submitted_at: nat64 }`
    EventSentTransaction? sentTransaction,

    /// [confirmedTransaction] defined in Candid: `confirmed_transaction: record { txid: blob }`
    EventConfirmedTransaction? confirmedTransaction,

    /// [checkedUtxo] defined in Candid: `checked_utxo: record { utxo: Utxo; uuid: text; clean: bool; kyt_provider: opt principal }`
    EventCheckedUtxo? checkedUtxo,

    /// [ignoredUtxo] defined in Candid: `ignored_utxo: record { utxo: Utxo }`
    EventIgnoredUtxo? ignoredUtxo,

    /// [retrieveBtcKytFailed] defined in Candid: `retrieve_btc_kyt_failed: record { address: text; amount: nat64; kyt_provider: principal; uuid: text; block_index: nat64 }`
    EventRetrieveBtcKytFailed? retrieveBtcKytFailed,
  }) {
    return Event(
      init: init ?? this.init,
      upgrade: upgrade ?? this.upgrade,
      receivedUtxos: receivedUtxos ?? this.receivedUtxos,
      acceptedRetrieveBtcRequest: acceptedRetrieveBtcRequest ?? this.acceptedRetrieveBtcRequest,
      removedRetrieveBtcRequest: removedRetrieveBtcRequest ?? this.removedRetrieveBtcRequest,
      sentTransaction: sentTransaction ?? this.sentTransaction,
      confirmedTransaction: confirmedTransaction ?? this.confirmedTransaction,
      checkedUtxo: checkedUtxo ?? this.checkedUtxo,
      ignoredUtxo: ignoredUtxo ?? this.ignoredUtxo,
      retrieveBtcKytFailed: retrieveBtcKytFailed ?? this.retrieveBtcKytFailed,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event &&
            (identical(other.init, init) || other.init == init) &&
            (identical(other.upgrade, upgrade) || other.upgrade == upgrade) &&
            (identical(other.receivedUtxos, receivedUtxos) || other.receivedUtxos == receivedUtxos) &&
            (identical(other.acceptedRetrieveBtcRequest, acceptedRetrieveBtcRequest) ||
                other.acceptedRetrieveBtcRequest == acceptedRetrieveBtcRequest) &&
            (identical(other.removedRetrieveBtcRequest, removedRetrieveBtcRequest) ||
                other.removedRetrieveBtcRequest == removedRetrieveBtcRequest) &&
            (identical(other.sentTransaction, sentTransaction) || other.sentTransaction == sentTransaction) &&
            (identical(other.confirmedTransaction, confirmedTransaction) || other.confirmedTransaction == confirmedTransaction) &&
            (identical(other.checkedUtxo, checkedUtxo) || other.checkedUtxo == checkedUtxo) &&
            (identical(other.ignoredUtxo, ignoredUtxo) || other.ignoredUtxo == ignoredUtxo) &&
            (identical(other.retrieveBtcKytFailed, retrieveBtcKytFailed) || other.retrieveBtcKytFailed == retrieveBtcKytFailed));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        init,
        upgrade,
        receivedUtxos,
        acceptedRetrieveBtcRequest,
        removedRetrieveBtcRequest,
        sentTransaction,
        confirmedTransaction,
        checkedUtxo,
        ignoredUtxo,
        retrieveBtcKytFailed
      ]);
  @override
  String toString() {
    return toJson().toString();
  }
}

/// [MinterArg] defined in Candid
/// ```Candid
///   variant { Init: InitArgs; Upgrade: opt UpgradeArgs }
/// ```
@immutable
class MinterArg {
  const MinterArg({
    /// [init] defined in Candid: `Init: InitArgs`
    this.init,

    /// [upgrade] defined in Candid: `Upgrade: opt UpgradeArgs`
    this.upgrade,
  });

  factory MinterArg.fromJson(Map json) {
    return MinterArg(
      init: json['Init'] == null ? null : InitArgs.fromJson(json['Init']),
      upgrade: (json['Upgrade'] as List).map((e) {
        return e == null ? null : UpgradeArgs.fromJson(e);
      }).firstOrNull,
    );
  }

  /// [init] defined in Candid: `Init: InitArgs`
  final InitArgs? init;

  /// [upgrade] defined in Candid: `Upgrade: opt UpgradeArgs`
  final UpgradeArgs? upgrade;

  Map<String, dynamic> toJson() {
    final init = this.init;
    final upgrade = this.upgrade;
    return {
      if (init != null) 'Init': init,
      if (upgrade != null) 'Upgrade': [if (upgrade != null) upgrade],
    };
  }

  MinterArg copyWith({
    /// [init] defined in Candid: `Init: InitArgs`
    InitArgs? init,

    /// [upgrade] defined in Candid: `Upgrade: opt UpgradeArgs`
    UpgradeArgs? upgrade,
  }) {
    return MinterArg(
      init: init ?? this.init,
      upgrade: upgrade ?? this.upgrade,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MinterArg &&
            (identical(other.init, init) || other.init == init) &&
            (identical(other.upgrade, upgrade) || other.upgrade == upgrade));
  }

  @override
  int get hashCode => Object.hashAll([runtimeType, init, upgrade]);
  @override
  String toString() {
    return toJson().toString();
  }
}
