import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:quiz/features/observability/domain/app_error_reporter.dart';

class ErrorReportingNavigatorObserver extends NavigatorObserver {
  ErrorReportingNavigatorObserver(this._reporter);

  final AppErrorReporter _reporter;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _record(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _record(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) _record(previousRoute);
  }

  void _record(Route<dynamic> route) {
    final routeName = route.settings.name;
    if (routeName != null) {
      unawaited(_reporter.addNavigationBreadcrumb(routeName));
    }
  }
}
