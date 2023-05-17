import 'package:arth_app/common/enums/scan_type.dart';
import 'package:arth_app/views/mint_unmint/mint_view.dart';
import 'package:arth_app/views/scanner/scanner.dart';
import 'package:arth_app/views/wallet/send_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/home/home_view.dart';
import '../views/settings/settings_view.dart';
import '../views/mint_unmint/unmint_view.dart';
import '../views/startup/startup_view.dart';
part 'routes.g.dart';

@TypedGoRoute<StartupRoute>(
  path: '/',
  routes: [
    TypedGoRoute<HomeRoute>(path: 'home'),
    TypedGoRoute<MintRoute>(path: 'mint'),
    TypedGoRoute<UnMintRoute>(path: 'unmint'),
    TypedGoRoute<SettingsRoute>(path: 'settings'),
    TypedGoRoute<SendRoute>(path: 'send'),
    TypedGoRoute<ScanRoute>(path: 'scan'),
  ],
)
@immutable
class StartupRoute extends GoRouteData {
  const StartupRoute();
  static const path = '/';

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const StartupView();
  }
}

@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const HomeView();
  }
}

@immutable
class MintRoute extends GoRouteData {
  const MintRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const MintView();
  }
}

@immutable
class UnMintRoute extends GoRouteData {
  const UnMintRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const UnMintView();
  }
}

@immutable
class SendRoute extends GoRouteData {
  const SendRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SendView();
  }
}

@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SettingsView();
  }
}

@immutable
class ScanRoute extends GoRouteData {
  const ScanRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return QrScanner(
      scanType: state.extra as ScanType,
    );
  }
}
