import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:quiz/features/observability/data/sentry_bootstrap.dart';
import 'package:quiz/features/observability/domain/app_error_reporter.dart';

@LazySingleton(as: AppErrorReporter)
class SentryErrorReporter implements AppErrorReporter {
  static final _uuidPattern = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    caseSensitive: false,
  );
  static final _routeNamePattern = RegExp(r'^[a-z0-9-]{1,64}$');

  @override
  bool get enabled => SentryBootstrap.enabled;

  @override
  Future<void> setUser(String userId) async {
    if (!enabled || !_uuidPattern.hasMatch(userId)) return;
    await Sentry.configureScope(
        (scope) => scope.setUser(SentryUser(id: userId)));
  }

  @override
  Future<void> clearUser() async {
    if (!enabled) return;
    await Sentry.configureScope((scope) => scope.setUser(null));
  }

  @override
  Future<void> captureException(
    Object error,
    StackTrace stackTrace, {
    required String operation,
  }) async {
    if (!enabled) return;
    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
      withScope: (scope) => scope.setTag('operation', operation),
    );
  }

  @override
  Future<void> addNavigationBreadcrumb(String routeName) async {
    if (!enabled || !_routeNamePattern.hasMatch(routeName)) return;
    await Sentry.addBreadcrumb(
      Breadcrumb(
        category: 'navigation',
        type: 'navigation',
        message: routeName,
        level: SentryLevel.info,
      ),
    );
  }
}
