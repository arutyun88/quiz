import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/user/data/dto/subscription_dto.dart';

void main() {
  test('decodes the server-owned subscription lifecycle contract', () {
    final dto = SubscriptionDto.fromJson({
      'status': 'CANCELED_ACTIVE',
      'entitlement_active': true,
      'will_renew': false,
      'current_period_ends_at': '2026-10-12T12:00:00Z',
      'provider': 'APP_STORE',
      'management_url': 'https://apps.apple.com/account/subscriptions',
      'purchase_availability': 'AVAILABLE',
      'access_reason': 'SUBSCRIPTION',
    });

    expect(dto.status, 'CANCELED_ACTIVE');
    expect(dto.entitlementActive, isTrue);
    expect(dto.willRenew, isFalse);
    expect(dto.currentPeriodEndsAt, DateTime.utc(2026, 10, 12, 12));
    expect(dto.provider, 'APP_STORE');
    expect(
      dto.managementUrl,
      'https://apps.apple.com/account/subscriptions',
    );
    expect(dto.purchaseAvailability, 'AVAILABLE');
    expect(dto.accessReason, 'SUBSCRIPTION');
  });
}
