import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract final class SentryBootstrap {
  static const dsn = String.fromEnvironment('SENTRY_DSN');
  static const configuredEnvironment = String.fromEnvironment(
    'SENTRY_ENVIRONMENT',
  );

  static bool get enabled => dsn.trim().isNotEmpty;

  static Future<void> run(FutureOr<void> Function() appRunner) async {
    if (!enabled) {
      await appRunner();
      return;
    }

    var appStarted = false;
    try {
      await SentryFlutter.init(
        configure,
        appRunner: () {
          appStarted = true;
          return appRunner();
        },
      );
    } catch (_) {
      if (appStarted) rethrow;
      await appRunner();
    }
  }

  @visibleForTesting
  static void configure(SentryFlutterOptions options) {
    options
      ..dsn = dsn.trim()
      ..environment = _environment
      ..sendDefaultPii = false
      ..captureFailedRequests = false
      ..captureNativeFailedRequests = false
      ..maxRequestBodySize = MaxRequestBodySize.never
      ..attachScreenshot = false
      ..enableUserInteractionTracing = false
      ..enableUserInteractionBreadcrumbs = false
      ..tracesSampleRate = 0
      ..beforeSend = scrubEvent
      ..beforeBreadcrumb = scrubBreadcrumb;
    options.replay
      ..sessionSampleRate = 0
      ..onErrorSampleRate = 0;
  }

  static String get _environment {
    final value = configuredEnvironment.trim();
    if (RegExp(r'^[a-zA-Z0-9_-]{1,32}$').hasMatch(value)) return value;
    return kReleaseMode ? 'production' : 'development';
  }

  @visibleForTesting
  static SentryEvent scrubEvent(SentryEvent event, Hint hint) {
    event
      ..request = null
      ..serverName = null;
    final userId = event.user?.id;
    event.user = userId == null ? null : SentryUser(id: userId);
    return event;
  }

  @visibleForTesting
  static Breadcrumb? scrubBreadcrumb(Breadcrumb? breadcrumb, Hint hint) {
    final category = breadcrumb?.category?.toLowerCase();
    if (category == null) return breadcrumb;
    if (category.contains('http') ||
        category.contains('network') ||
        category.contains('console')) {
      return null;
    }
    return breadcrumb;
  }
}
