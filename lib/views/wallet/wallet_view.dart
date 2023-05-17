import 'package:agent_dart/agent_dart.dart';
import 'package:arth_app/common/assets/assets.dart';
import 'package:arth_app/common/utils/amount_utils.dart';
import 'package:arth_app/common/utils/snack_bar_utils.dart';
import 'package:arth_app/providers/auth_provider/auth_provider.dart';
import 'package:arth_app/providers/ckbtc_provider/ckbtc_provider.dart';
import 'package:arth_app/routes/routes.dart';
import 'package:arth_app/services/qr/qr_service.dart';
import 'package:arth_app/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class WalletView extends ConsumerWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(identityProvider);
    final ck = ref.watch(ckBtcProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              const SettingsRoute().go(context);
                            },
                            icon: const Icon(Icons.settings),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(Assets.ckBtc),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            ck.balanceString ?? "-.--------",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 30,
                                ),
                          ),
                          IconButton(
                              onPressed: () async {
                                Snack.show(context, "Refreshing Balance");
                                await ref.read(ckBtcProvider.notifier).voidGetbalance();
                                Snack.show(context, "Updated");
                              },
                              icon: const Icon(Icons.refresh)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CoolButton(
                            width: 0.3,
                            onTapUp: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Container(
                                    height: 230,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GetIt.I.get<QrService>().showQr(
                                            ref.read(identityProvider)!.getPrincipal().toString(),
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Receive",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          CoolButton(
                            width: 0.3,
                            onTapUp: () => const SendRoute().go(context),
                            child: Text(
                              "Send",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: id.getPrincipal().toString()));
                        Snack.show(context, "Principal Copied");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Principal: ${AmountUtils.formatPrincipal(principal: id!.getPrincipal().toString())}"),
                            const SizedBox(width: 8),
                            const Icon(Icons.copy, size: 12)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: id.getPrincipal().toAccountId().toHex().toString()));
                        Snack.show(context, "AccountId Copied");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Account: ${AmountUtils.formatAccount(account: id.getPrincipal().toAccountId().toHex())}"),
                            const SizedBox(width: 8),
                            const Icon(Icons.copy, size: 12)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
