import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:quiz/features/observability/data/sentry_bootstrap.dart';

void main() {
  test('configures crash reporting without PII or overlapping products', () {
    final options = SentryFlutterOptions();

    SentryBootstrap.configure(options);

    expect(options.sendDefaultPii, isFalse);
    expect(options.captureFailedRequests, isFalse);
    expect(options.captureNativeFailedRequests, isFalse);
    expect(options.maxRequestBodySize, MaxRequestBodySize.never);
    expect(options.attachScreenshot, isFalse);
    expect(options.enableUserInteractionTracing, isFalse);
    expect(options.enableUserInteractionBreadcrumbs, isFalse);
    expect(options.tracesSampleRate, 0);
    expect(options.replay.sessionSampleRate, 0);
    expect(options.replay.onErrorSampleRate, 0);
  });

  test('removes request, host, and non-id user data before sending', () {
    final event = SentryEvent(
      serverName: 'private-device-name',
      request: SentryRequest(
        url: 'https://example.test/private?token=secret',
      ),
      user: SentryUser(
        id: '019c9f74-d3f0-7a5b-8f35-6ecb9a642488',
        email: 'person@example.com',
        username: 'private-name',
        ipAddress: '127.0.0.1',
        data: {'age_access': 'enabled'},
      ),
    );

    final scrubbed = SentryBootstrap.scrubEvent(event, Hint());

    expect(scrubbed.request, isNull);
    expect(scrubbed.serverName, isNull);
    expect(scrubbed.user?.id, event.user?.id);
    expect(scrubbed.user?.email, isNull);
    expect(scrubbed.user?.username, isNull);
    expect(scrubbed.user?.ipAddress, isNull);
    expect(scrubbed.user?.data, isNull);
  });

  test('drops network and console breadcrumbs but keeps safe navigation', () {
    expect(
      SentryBootstrap.scrubBreadcrumb(
        Breadcrumb(category: 'http.client', message: 'private-url'),
        Hint(),
      ),
      isNull,
    );
    expect(
      SentryBootstrap.scrubBreadcrumb(
        Breadcrumb(category: 'console', message: 'private-value'),
        Hint(),
      ),
      isNull,
    );
    expect(
      SentryBootstrap.scrubBreadcrumb(
        Breadcrumb(category: 'navigation', message: 'home'),
        Hint(),
      ),
      isNotNull,
    );
  });
}
