import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider/auth_provider.dart';
import '../home/home_view.dart';
import '../login/login_view.dart';

class StartupView extends ConsumerWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartUp = ref.watch(appStartupProvider);
    return appStartUp.when(
      initializing: () => const LoadingScaffold(message: ""),
      needsIdentity: () => const LoginView(),
      authenticating: (m) => LoadingScaffold(message: m),
      authenticated: (i) => const HomeView(),
      error: (e) => LoginErrorScaffold(error: e),
    );
  }
}

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 40,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}

class LoginErrorScaffold extends ConsumerWidget {
  const LoginErrorScaffold({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error),
            const SizedBox(
              height: 16,
            ),
            IconButton(
              onPressed: () {
                ref.read(appStartupProvider.notifier).resetLogin();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
