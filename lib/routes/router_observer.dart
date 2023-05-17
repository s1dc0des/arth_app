import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

class AppNavObserver extends NavigatorObserver {
  // The right way to set up a log listener for modular
  // components of the app that always includes:
  //  - a named logger
  //  - recording the log events via the named logger
  //  - logging specifics via named logger log levels

  /// The logged message.
  final Logger navLog = Logger('AppNavObserver');

  AppNavObserver() {
    navLog.onRecord.listen((LogRecord rec) {
      if (rec.error != null && rec.stackTrace != null) {
        log(
          'level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message} error: ${rec.error} exception: ${rec.stackTrace}',
        );
      } else if (rec.error != null) {
        log('level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message} error: ${rec.error}');
      } else {
        log('level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message}');
      }
    });
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      navLog.info('didPush: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      navLog.info('didPop: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      navLog.info('didRemove: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      navLog.info('didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}');

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      navLog.info('didStartUserGesture: ${route.str}, '
          'previousRoute= ${previousRoute?.str}');

  @override
  void didStopUserGesture() => navLog.info('didStopUserGesture');
}

extension on Route<dynamic> {
  // ignore: prefer-correct-identifier-length
  String get str => 'route(${settings.name}: ${settings.arguments})';
}
