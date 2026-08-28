import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';

void main() {
  test('accepts only the fixed destination allowlist', () {
    expect(
      parsePushDestination({'destination': 'DAILY_EDITION'}),
      PushDestination.dailyEdition,
    );
    expect(
      parsePushDestination({'destination': 'RATING'}),
      PushDestination.rating,
    );
  });

  test('ignores arbitrary routes, urls, and entity identifiers', () {
    expect(parsePushDestination({'destination': '/profile'}), isNull);
    expect(
        parsePushDestination({'destination': 'https://example.com'}), isNull);
    expect(
      parsePushDestination({
        'destination': 'PUBLIC_PROFILE',
        'user_id': 'another-user',
      }),
      isNull,
    );
  });
}
