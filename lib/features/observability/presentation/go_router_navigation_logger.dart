import 'package:go_router/go_router.dart';
import 'package:quiz/features/observability/domain/logger.dart';

final class GoRouterNavigationLogger {
  GoRouterNavigationLogger(this._router) {
    _router.routerDelegate.addListener(_recordCurrentRoute);
    _recordCurrentRoute();
  }

  final GoRouter _router;
  String? _currentRoute;

  void dispose() {
    _router.routerDelegate.removeListener(_recordCurrentRoute);
  }

  void _recordCurrentRoute() {
    final configuration = _router.routerDelegate.currentConfiguration;
    if (configuration.isEmpty) return;

    final nextRoute = _router.routerDelegate.state.fullPath;
    if (nextRoute == null || nextRoute.isEmpty || nextRoute == _currentRoute) {
      return;
    }

    final previousRoute = _currentRoute;
    final message = previousRoute == null
        ? 'OPEN $nextRoute'
        : 'NAVIGATE $previousRoute → $nextRoute';
    logger('Navigation').info(
      message.attach({
        'action': previousRoute == null ? 'open' : 'navigate',
        if (previousRoute != null) 'from': previousRoute,
        'to': nextRoute,
      }),
    );
    _currentRoute = nextRoute;
  }
}
