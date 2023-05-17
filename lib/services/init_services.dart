import 'package:agent_dart/agent/auth.dart';
import 'package:arth_app/common/constants/constants.dart';
import 'package:arth_app/common/did/ckbtc.idl.dart';
import 'package:arth_app/services/auth/authentication_service.dart';
import 'package:arth_app/services/bitcoin/bitcoin_service.dart';
import 'package:arth_app/services/qr/qr_service.dart';
import 'package:get_it/get_it.dart';
import '../common/did/minter.idl.dart';

class InitServices {
  static final GetIt _getIt = GetIt.I;

  static registerServices() {
    _getIt.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
    _getIt.registerLazySingleton<QrService>(() => QrService());
    _getIt.registerLazySingleton<BitcoinService>(() => BitcoinService());
  }

  static registerAuthenticatedService(Identity i) async {
    _getIt.registerLazySingleton<MinterIDLService>(() => MinterIDLService(
          canisterId: Constants.ckBtcMinter,
          uri: Uri.parse(Constants.icp),
          debug: false,
          identity: i,
        ));
    _getIt.registerLazySingleton<CkbtcIDLService>(() => CkbtcIDLService(
          canisterId: Constants.ckBtcLedger,
          uri: Uri.parse(Constants.icp),
          debug: false,
          identity: i,
        ));
  }
}
