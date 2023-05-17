import 'package:arth_app/common/assets/assets.dart';
import 'package:arth_app/views/mint_unmint/mint_unmint_view.dart';
import 'package:arth_app/views/wallet/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/home_provider/home_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(homeProvider);
    return Scaffold(
      body: PageView(
        controller: ref.read(homeProvider.notifier).pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MintUnmintView(),
          WalletView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) => ref.read(homeProvider.notifier).changePage(value),
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "Mint",
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset(
                Assets.anvilIcon,
                height: 25,
                width: 25,
                color: currentPage == 0 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Wallet",
            icon: Icon(
              Icons.wallet,
              color: currentPage == 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
