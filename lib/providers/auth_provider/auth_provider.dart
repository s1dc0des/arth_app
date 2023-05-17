import 'package:agent_dart/agent/auth.dart';
import 'package:arth_app/services/init_services.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../services/auth/authentication_service.dart';
import 'auth_state.dart';

part 'auth_provider.g.dart';

final identityProvider = Provider<Identity?>(
  (ref) {
    final startup = ref.watch(appStartupProvider);
    return startup.when(
      initializing: () => null,
      needsIdentity: () => null,
      authenticating: (s) => null,
      authenticated: (i) => i,
      error: (e) => null,
    );
  },
);

@Riverpod(keepAlive: true)
class AppStartup extends _$AppStartup {
  @override
  AuthState build() {
    init();
    return const AuthState.initializing();
  }

  final _authService = GetIt.I.get<AuthenticationService>();

  resetLogin() async {
    state = const AuthState.needsIdentity();
  }

  logout() async {
    await _authService.deleteIdentityJson();
    state = const AuthState.needsIdentity();
  }

  init() async {
    try {
      state = const AuthState.authenticating("Fetching identity");
      Identity? id = await _authService.isAuthenticated();
      if (id != null) {
        state = AuthState.authenticated(id);
        InitServices.registerAuthenticatedService(id);
      } else {
        state = const AuthState.needsIdentity();
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  authenticate(AuthProvider authProvider) async {
    try {
      Identity? id = await _authService.authenticate(authProvider);
      state = const AuthState.authenticating("Authenticating...");
      if (id != null) {
        print(id.getPrincipal());
        state = AuthState.authenticated(id);
        InitServices.registerAuthenticatedService(id);
      } else {
        state = const AuthState.needsIdentity();
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}
