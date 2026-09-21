import 'package:quiz/features/observability/data/sentry_bootstrap.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract final class SentryUserContext {
  static final _uuidPattern = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    caseSensitive: false,
  );

  static Future<void> set(String? userId) async {
    if (!SentryBootstrap.enabled) return;
    final user = userId != null && _uuidPattern.hasMatch(userId) ? SentryUser(id: userId) : null;
    await Sentry.configureScope((scope) => scope.setUser(user));
  }
}
