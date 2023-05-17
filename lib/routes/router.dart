import 'package:arth_app/routes/router_notifier.dart';
import 'package:arth_app/routes/router_observer.dart';
import 'package:arth_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavKey');
// final _shellNavKey = GlobalKey<NavigatorState>(debugLabel: 'shellNavKey');

@riverpod
GoRouter router(RouterRef ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    routes: notifier.routes,
    navigatorKey: _rootNavKey,
    errorBuilder: (context, state) => Scaffold(body: Text(state.error.toString())),
    redirect: notifier.redirect,
    refreshListenable: notifier,
    initialLocation: StartupRoute.path,
    observers: [AppNavObserver()],
    debugLogDiagnostics: true,
  );
}
