import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/analytics/data/analytics_consent_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('distinguishes an unanswered consent request from a refusal', () async {
    SharedPreferences.setMockInitialValues({});
    final store = AnalyticsConsentStore(await SharedPreferences.getInstance());

    expect(store.decided, isFalse);
    expect(store.granted, isFalse);

    await store.setGranted(false);

    expect(store.decided, isTrue);
    expect(store.granted, isFalse);
  });
}
