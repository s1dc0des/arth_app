import 'package:arth_app/providers/theme_provider/theme_provider.dart';
import 'package:arth_app/routes/router.dart';
import 'package:arth_app/services/init_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  InitServices.registerServices();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeN = ref.read(appThemeProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final router = ref.watch(routerProvider);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Arth',
          theme: themeN.lightThemeData,
          darkTheme: themeN.darkThemeData,
          themeMode: theme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
