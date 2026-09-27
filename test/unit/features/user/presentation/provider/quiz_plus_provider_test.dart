import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';
import 'package:quiz/features/user/presentation/provider/quiz_plus_provider.dart';

void main() {
  test('uses only the server entitlement flag for Quiz+ access', () {
    final container = ProviderContainer(
      overrides: [
        currentSubscriptionProvider.overrideWithValue(
          SubscriptionEntity(
            status: SubscriptionStatus.expired,
            entitlementActive: true,
            willRenew: false,
            currentPeriodEndsAt: DateTime.utc(2020),
            purchaseAvailability: PurchaseAvailability.temporarilyUnavailable,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(quizPlusProvider), isTrue);
  });

  test('pending store state cannot grant Quiz+ without server entitlement', () {
    final container = ProviderContainer(
      overrides: [
        currentSubscriptionProvider.overrideWithValue(
          const SubscriptionEntity(
            status: SubscriptionStatus.pending,
            entitlementActive: false,
            willRenew: false,
            purchaseAvailability: PurchaseAvailability.available,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(quizPlusProvider), isFalse);
  });
}
