import 'package:flutter_test/flutter_test.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:quiz/features/analytics/data/posthog_product_analytics.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';

void main() {
  test('blank project token keeps analytics disabled', () async {
    final sdk = _FakePostHogSdk();
    final analytics = PostHogProductAnalytics.forTesting(
      projectToken: ' ',
      sdk: sdk,
    );

    await analytics.initialize();
    await analytics.identify('019c9f74-d3f0-7a5b-8f35-6ecb9a642488');
    await analytics.screen('home');
    await analytics.capture(ProductAnalyticsEvent.dailyEditionOpened);

    expect(analytics.enabled, isFalse);
    expect(sdk.config, isNull);
    expect(sdk.events, isEmpty);
  });

  test('uses EU ingestion and disables overlapping PostHog products', () async {
    final sdk = _FakePostHogSdk();
    final analytics = PostHogProductAnalytics.forTesting(
      projectToken: 'phc_test',
      sdk: sdk,
    );

    await analytics.initialize();

    final config = sdk.config!;
    expect(config.host, PostHogProductAnalytics.host);
    expect(config.preloadFeatureFlags, isFalse);
    expect(config.sendFeatureFlagEvents, isFalse);
    expect(config.sessionReplay, isFalse);
    expect(config.surveys, isFalse);
    expect(config.capturePushNotificationSubscriptions, isFalse);
    expect(config.capturePushNotificationOpened, isFalse);
    expect(config.personProfiles, PostHogPersonProfiles.identifiedOnly);
  });

  test('identifies only UUID accounts and resets once on logout', () async {
    final sdk = _FakePostHogSdk();
    final analytics = PostHogProductAnalytics.forTesting(
      projectToken: 'phc_test',
      sdk: sdk,
    );
    const userId = '019c9f74-d3f0-7a5b-8f35-6ecb9a642488';

    await analytics.identify('person@example.com');
    await analytics.identify(userId);
    await analytics.identify(userId);
    await analytics.resetIdentity();
    await analytics.resetIdentity();

    expect(sdk.identifiedUsers, [userId]);
    expect(sdk.resetCount, 1);
  });

  test('clears a persisted SDK identity on an unauthenticated cold start',
      () async {
    final sdk = _FakePostHogSdk();
    final analytics = PostHogProductAnalytics.forTesting(
      projectToken: 'phc_test',
      sdk: sdk,
    );

    await analytics.resetIdentity();
    await analytics.resetIdentity();

    expect(sdk.resetCount, 1);
  });

  test('captures only safe route names and the fixed event wire name',
      () async {
    final sdk = _FakePostHogSdk();
    final analytics = PostHogProductAnalytics.forTesting(
      projectToken: 'phc_test',
      sdk: sdk,
    );

    await analytics.screen('daily-result');
    await analytics
        .screen('/profile/user/019c9f74-d3f0-7a5b-8f35-6ecb9a642488');
    await analytics.capture(
      ProductAnalyticsEvent.rewardedAdFinished,
      properties: const {'server_confirmed': true},
    );

    expect(sdk.screens, ['daily-result']);
    expect(sdk.events.single.$1, 'rewarded ad finished');
    expect(sdk.events.single.$2, {'server_confirmed': true});
  });
}

class _FakePostHogSdk implements PostHogSdk {
  PostHogConfig? config;
  final identifiedUsers = <String>[];
  final screens = <String>[];
  final events = <(String, Map<String, Object>)>[];
  int resetCount = 0;

  @override
  Future<void> setup(PostHogConfig config) async => this.config = config;

  @override
  Future<void> identify(String userId) async => identifiedUsers.add(userId);

  @override
  Future<void> reset() async => resetCount++;

  @override
  Future<void> screen(String screenName) async => screens.add(screenName);

  @override
  Future<void> capture(
    String eventName,
    Map<String, Object> properties,
  ) async =>
      events.add((eventName, properties));
}
