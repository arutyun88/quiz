import 'package:flutter/widgets.dart';
import 'package:quiz/features/observability/domain/logger.dart';

class ErrorReportingNavigatorObserver extends NavigatorObserver {
  ErrorReportingNavigatorObserver();

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
      logger('Navigation').info(
        'Route changed'.attach({'route': routeName}),
      );
    }
  }
}
