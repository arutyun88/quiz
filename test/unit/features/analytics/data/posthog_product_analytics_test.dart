import 'package:flutter_test/flutter_test.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:quiz/features/analytics/data/analytics_consent_store.dart';
import 'package:quiz/features/analytics/data/posthog_product_analytics.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('blank project token keeps analytics disabled', () async {
    final sdk = _FakePostHogSdk();
    final analytics = await _analytics(
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
    final analytics = await _analytics(
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
    expect(config.captureApplicationLifecycleEvents, isFalse);
    expect(config.capturePushNotificationSubscriptions, isFalse);
    expect(config.capturePushNotificationOpened, isFalse);
    expect(config.personProfiles, PostHogPersonProfiles.never);
    expect(config.optOut, isFalse);
  });

  test('defaults to opt-out and sends nothing before consent', () async {
    final sdk = _FakePostHogSdk();
    final analytics = await _analytics(
      projectToken: 'phc_test',
      sdk: sdk,
      consentGranted: false,
    );

    await analytics.initialize();
    await analytics.capture(ProductAnalyticsEvent.dailyEditionOpened);

    expect(analytics.enabled, isFalse);
    expect(analytics.consentGranted, isFalse);
    expect(sdk.config?.optOut, isTrue);
    expect(sdk.events, isEmpty);
  });

  test('grant enables capture and revoke disables and resets identity',
      () async {
    final sdk = _FakePostHogSdk();
    final analytics = await _analytics(
      projectToken: 'phc_test',
      sdk: sdk,
      consentGranted: false,
    );

    await analytics.setConsent(true);
    await analytics.identify('019c9f74-d3f0-7a5b-8f35-6ecb9a642488');
    await analytics.capture(ProductAnalyticsEvent.dailyEditionOpened);
    await analytics.setConsent(false);
    await analytics.capture(ProductAnalyticsEvent.dailyEditionOpened);

    expect(sdk.enableCount, 1);
    expect(sdk.disableCount, 1);
    expect(sdk.resetCount, 1);
    expect(sdk.events, hasLength(1));
    expect(analytics.consentGranted, isFalse);
    expect(analytics.enabled, isFalse);
  });

  test('identifies only UUID accounts and resets once on logout', () async {
    final sdk = _FakePostHogSdk();
    final analytics = await _analytics(
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
    final analytics = await _analytics(
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
    final analytics = await _analytics(
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

  test('keeps only allowlisted non-sensitive event properties', () async {
    final sdk = _FakePostHogSdk();
    final analytics = await _analytics(
      projectToken: 'phc_test',
      sdk: sdk,
    );

    await analytics.capture(
      ProductAnalyticsEvent.quizPlusPurchaseFinished,
      properties: const {
        'action': 'purchase',
        'outcome': 'completed',
        'package_id': 'com.eruday.quiz.plus.monthly',
        'email': 'person@example.com',
        'question_text': 'A private free-form value',
        'server_confirmed': true,
      },
    );

    expect(sdk.events.single.$2, {
      'action': 'purchase',
      'outcome': 'completed',
      'package_id': 'com.eruday.quiz.plus.monthly',
    });
  });

  test('drops unsafe values even for allowlisted property names', () async {
    final sanitized = PostHogProductAnalytics.sanitizeProperties(
      ProductAnalyticsEvent.dailyAttemptAccepted,
      {
        r'$insert_id': 'person@example.com',
        'action': 'answer with private text',
        'correct': true,
        'rating_delta': double.infinity,
      },
    );

    expect(sanitized, {'correct': true});
  });
}

Future<PostHogProductAnalytics> _analytics({
  required String projectToken,
  required PostHogSdk sdk,
  bool consentGranted = true,
}) async {
  SharedPreferences.setMockInitialValues({
    AnalyticsConsentStore.preferenceKey: consentGranted,
  });
  return PostHogProductAnalytics.forTesting(
    projectToken: projectToken,
    sdk: sdk,
    consentStore: AnalyticsConsentStore(
      await SharedPreferences.getInstance(),
    ),
  );
}

class _FakePostHogSdk implements PostHogSdk {
  PostHogConfig? config;
  final identifiedUsers = <String>[];
  final screens = <String>[];
  final events = <(String, Map<String, Object>)>[];
  int resetCount = 0;
  int enableCount = 0;
  int disableCount = 0;

  @override
  Future<void> setup(PostHogConfig config) async => this.config = config;

  @override
  Future<void> enable() async => enableCount++;

  @override
  Future<void> disable() async => disableCount++;

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
