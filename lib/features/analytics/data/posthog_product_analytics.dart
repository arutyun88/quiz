import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';

abstract interface class PostHogSdk {
  Future<void> setup(PostHogConfig config);

  Future<void> identify(String userId);

  Future<void> reset();

  Future<void> screen(String screenName);

  Future<void> capture(String eventName, Map<String, Object> properties);
}

final class NativePostHogSdk implements PostHogSdk {
  const NativePostHogSdk();

  @override
  Future<void> setup(PostHogConfig config) => Posthog().setup(config);

  @override
  Future<void> identify(String userId) => Posthog().identify(userId: userId);

  @override
  Future<void> reset() => Posthog().reset();

  @override
  Future<void> screen(String screenName) =>
      Posthog().screen(screenName: screenName);

  @override
  Future<void> capture(
    String eventName,
    Map<String, Object> properties,
  ) =>
      Posthog().capture(eventName: eventName, properties: properties);
}

@LazySingleton(as: ProductAnalytics)
class PostHogProductAnalytics implements ProductAnalytics {
  PostHogProductAnalytics()
      : this.forTesting(
          projectToken: const String.fromEnvironment('POSTHOG_PROJECT_TOKEN'),
          sdk: const NativePostHogSdk(),
        );

  @visibleForTesting
  PostHogProductAnalytics.forTesting({
    required String projectToken,
    required PostHogSdk sdk,
  })  : _projectToken = projectToken.trim(),
        _sdk = sdk;

  static const host = 'https://eu.i.posthog.com';
  static final _uuidPattern = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    caseSensitive: false,
  );
  static final _routeNamePattern = RegExp(r'^[a-z0-9-]{1,64}$');

  final String _projectToken;
  final PostHogSdk _sdk;
  Future<void>? _initialization;
  String? _identifiedUserId;
  bool _identitySynchronized = false;

  @override
  bool get enabled => _projectToken.isNotEmpty;

  @override
  Future<void> initialize() => _initialization ??= _initialize();

  Future<void> _initialize() async {
    if (!enabled) return;
    final config = PostHogConfig(_projectToken)
      ..host = host
      ..debug = false
      ..preloadFeatureFlags = false
      ..sendFeatureFlagEvents = false
      ..sessionReplay = false
      ..surveys = false
      ..captureApplicationLifecycleEvents = true
      ..capturePushNotificationSubscriptions = false
      ..capturePushNotificationOpened = false
      ..personProfiles = PostHogPersonProfiles.identifiedOnly;
    try {
      await _sdk.setup(config);
    } catch (_) {
      // Product analytics must never prevent the app from starting.
    }
  }

  @override
  Future<void> identify(String userId) async {
    if (!enabled ||
        !_uuidPattern.hasMatch(userId) ||
        (_identitySynchronized && _identifiedUserId == userId)) {
      return;
    }
    await initialize();
    try {
      await _sdk.identify(userId);
      _identifiedUserId = userId;
      _identitySynchronized = true;
    } catch (_) {
      // Identity is analytics-only and cannot affect authentication.
    }
  }

  @override
  Future<void> resetIdentity() async {
    if (!enabled || (_identitySynchronized && _identifiedUserId == null)) {
      return;
    }
    await initialize();
    try {
      await _sdk.reset();
      _identifiedUserId = null;
      _identitySynchronized = true;
    } catch (_) {
      // Local logout remains authoritative even if analytics cleanup fails.
    }
  }

  @override
  Future<void> screen(String routeName) async {
    if (!enabled || !_routeNamePattern.hasMatch(routeName)) return;
    await initialize();
    try {
      await _sdk.screen(routeName);
    } catch (_) {
      // Navigation must not depend on analytics delivery.
    }
  }

  @override
  Future<void> capture(
    ProductAnalyticsEvent event, {
    Map<String, Object> properties = const {},
  }) async {
    if (!enabled) return;
    await initialize();
    try {
      await _sdk.capture(event.wireName, Map.unmodifiable(properties));
    } catch (_) {
      // Product events are best-effort and never drive application state.
    }
  }
}
