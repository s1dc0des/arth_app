// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $startupRoute,
    ];

RouteBase get $startupRoute => GoRouteData.$route(
      path: '/',
      factory: $StartupRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'home',
          factory: $HomeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'mint',
          factory: $MintRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'unmint',
          factory: $UnMintRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings',
          factory: $SettingsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'send',
          factory: $SendRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'scan',
          factory: $ScanRouteExtension._fromState,
        ),
      ],
    );

extension $StartupRouteExtension on StartupRoute {
  static StartupRoute _fromState(GoRouterState state) => const StartupRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MintRouteExtension on MintRoute {
  static MintRoute _fromState(GoRouterState state) => const MintRoute();

  String get location => GoRouteData.$location(
        '/mint',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UnMintRouteExtension on UnMintRoute {
  static UnMintRoute _fromState(GoRouterState state) => const UnMintRoute();

  String get location => GoRouteData.$location(
        '/unmint',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SendRouteExtension on SendRoute {
  static SendRoute _fromState(GoRouterState state) => const SendRoute();

  String get location => GoRouteData.$location(
        '/send',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ScanRouteExtension on ScanRoute {
  static ScanRoute _fromState(GoRouterState state) => const ScanRoute();

  String get location => GoRouteData.$location(
        '/scan',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
