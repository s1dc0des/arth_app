import 'package:arth_app/providers/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider/auth_provider.dart';
import '../widgets/buttons.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CoolButton(
                onTapUp: () => ref.read(appThemeProvider.notifier).toggleThemeMode(),
                width: 0.9,
                child: Icon(
                  theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          CoolButton(
            onTapDown: () {
              HapticFeedback.lightImpact();
            },
            onTapUp: () async {
              await ref.read(appStartupProvider.notifier).logout();
            },
            color: Theme.of(context).colorScheme.error,
            width: 0.9,
            child: Text(
              "Logout",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
