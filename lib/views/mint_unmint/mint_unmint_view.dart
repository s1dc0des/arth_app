import 'package:arth_app/providers/mint/mint_provider.dart';
import 'package:arth_app/providers/unmint/unmint_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../common/assets/assets.dart';

class MintUnmintView extends ConsumerWidget {
  const MintUnmintView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minter = ref.watch(minterProvider);
    final unmint = ref.watch(unmintProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.8.sw,
              height: 80.h,
              child: GestureDetector(
                onTap: () => context.go('/mint'),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(Assets.btcIcon),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 17,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(Assets.ckBtc),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 0.8.sw,
              height: 80.h,
              child: GestureDetector(
                onTap: () {
                  context.go('/unmint');
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(Assets.ckBtc),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 17,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(Assets.btcIcon),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: SizedBox(
            //     height: 100,
            //     child: Column(
            //       children: [
            //         if (minter.minterInfo != null) ...[
            //           Text(minter.minterInfo!.kytFee.toInt().toString()),
            //           Text(minter.minterInfo!.minConfirmations.toInt().toString()),
            //           Text(minter.minterInfo!.retrieveBtcMinAmount.toInt().toString()),
            //         ],
            //         if (minter.minterInfo == null) ...[
            //           const SizedBox(
            //             height: 20,
            //             width: 20,
            //             child: CircularProgressIndicator(),
            //           ),
            //         ],
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
