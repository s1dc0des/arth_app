// import 'package:agent_dart/agent_dart.dart';
// import 'package:cig_social_ui/common/constants.dart';
// import 'package:cig_social_ui/common/identity.dart';
// import 'package:cig_social_ui/services/auth/cig_auth_client.dart' as cig;
// import 'package:cig_social_ui/ui/views/startup/app_startup_state.dart';
import 'package:agent_dart/agent/auth.dart';
import 'package:arth_app/common/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'arth_auth_client.dart';
import 'auth_agent_service.dart';
// import 'auth/auth_agent_service.dart';

enum AuthProvider { ii, nfid }

class AuthenticationService {
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  Future<void> storeIdetityJson(String identityJsonString) async {
    return await _flutterSecureStorage.write(key: "identity", value: identityJsonString);
  }

  Future<String?> getIdentityJson() async {
    return await _flutterSecureStorage.read(key: "identity");
  }

  Future<void> deleteIdentityJson() async {
    return await _flutterSecureStorage.delete(key: "identity");
  }

  Future<Identity?> isAuthenticated() async {
    String? iiJson = await getIdentityJson();
    if (iiJson != null) {
      var authClient = AuthClient.fromStorage(iiJson);
      return authClient.delegationIdentity;
    }
    return null;
  }

  Future<Identity?> authenticate(AuthProvider authProvider) async {
    Uri uri = Uri.parse("${Constants.authenticatorUrl}${authProvider == AuthProvider.ii ? "?provider=II" : "?provider=NFID"}");
    AuthClientLoginOptions options = AuthClientLoginOptions(
      canisterId: Constants.authenticatorCanister,
      identityProvider: uri,
      maxTimeToLive: BigInt.from(604800000000000),
      onError: (error) {
        print("Error: $error");
      }, // 7 days in nanoseconds = 604800000000000
      onSuccess: () {
        print("Success");
      },
    );

    try {
      var authClient = WebAuthProvider(
        scheme: "arthauth",
        path: '',
        authUri: uri,
        useLocalPage: false,
      );
      final String p = authProvider == AuthProvider.ii ? "II" : "NFID";
      await authClient.start(options, p);
      String save = authClient.toStorage();
      await storeIdetityJson(save);
      return authClient.getIdentity();
    } on PlatformException catch (e) {
      print('Got error: $e');
      rethrow;
    }
  }
}
