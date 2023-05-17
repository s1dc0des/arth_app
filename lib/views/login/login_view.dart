import 'package:arth_app/common/constants/ui_constants.dart';
import 'package:arth_app/services/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import '../../providers/auth_provider/auth_provider.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(appStartupProvider);
    final authN = ref.read(appStartupProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIConstants.screenEdgePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 70,
                      ),
                      Text("ARTH", style: Theme.of(context).textTheme.bodyLarge),
                      auth.when(
                        initializing: () => const SizedBox(
                          child: CircularProgressIndicator(),
                        ),
                        needsIdentity: () => const Text("needs identity"),
                        authenticating: (s) => Text(s),
                        authenticated: (i) => Text(
                          i.getPrincipal().toString(),
                          textAlign: TextAlign.center,
                        ),
                        error: (e) => Text(e),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                NeoPopButton(
                  onTapDown: () {
                    HapticFeedback.lightImpact();
                  },
                  onTapUp: () async {
                    await authN.authenticate(AuthProvider.ii);
                    // print(Theme.of(context).colorScheme.primary);
                    // print(Theme.of(context).colorScheme.background);
                  },
                  forwardDuration: const Duration(milliseconds: 100),
                  reverseDuration: const Duration(milliseconds: 500),
                  color: Theme.of(context).colorScheme.primary,
                  child: SizedBox(
                    width: 0.8.sw,
                    height: 35,
                    child: Center(
                      child: Text(
                        "Login Via Internet Identity",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                NeoPopButton(
                  onTapDown: () {
                    HapticFeedback.lightImpact();
                  },
                  onTapUp: () async {
                    await authN.authenticate(AuthProvider.nfid);
                  },
                  forwardDuration: const Duration(milliseconds: 100),
                  reverseDuration: const Duration(milliseconds: 500),
                  color: Theme.of(context).colorScheme.primary,
                  child: SizedBox(
                    width: 0.8.sw,
                    height: 35,
                    child: Center(
                      child: Text(
                        "Login Via NFID",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
