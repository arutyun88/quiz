import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';

class ProductAnalyticsNavigatorObserver extends NavigatorObserver {
  ProductAnalyticsNavigatorObserver(this._analytics);

  final ProductAnalytics _analytics;

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
    if (routeName != null) unawaited(_analytics.screen(routeName));
  }
}
