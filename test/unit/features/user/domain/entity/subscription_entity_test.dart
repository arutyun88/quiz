import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';

void main() {
  test('keeps entitlement independent from lifecycle and local time', () {
    final subscription = SubscriptionEntity(
      status: SubscriptionStatus.canceledActive,
      entitlementActive: true,
      willRenew: false,
      currentPeriodEndsAt: DateTime.utc(2020),
      provider: 'APP_STORE',
      managementUrl: 'https://apps.apple.com/account/subscriptions',
      purchaseAvailability: PurchaseAvailability.available,
      accessReason: SubscriptionAccessReason.subscription,
    );

    expect(subscription.entitlementActive, isTrue);
    expect(subscription.status, SubscriptionStatus.canceledActive);
    expect(subscription.willRenew, isFalse);
  });
}
