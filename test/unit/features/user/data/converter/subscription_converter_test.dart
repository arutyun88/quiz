import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/features/user/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/dto/user_dto.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';

void main() {
  test('maps known server lifecycle values without deriving entitlement', () {
    final user = UserConverterImpl().convert(
      DataDto(
        data: UserDto.fromJson({
          ..._userJson,
          'subscription': {
            'status': 'CANCELED_ACTIVE',
            'entitlement_active': true,
            'will_renew': false,
            'current_period_ends_at': '2026-10-12T12:00:00Z',
            'provider': 'GOOGLE_PLAY',
            'management_url':
                'https://play.google.com/store/account/subscriptions',
            'purchase_availability': 'AVAILABLE',
            'access_reason': 'SUBSCRIPTION',
          },
        }),
      ),
    );

    expect(user.subscription?.status, SubscriptionStatus.canceledActive);
    expect(user.subscription?.entitlementActive, isTrue);
    expect(user.subscription?.willRenew, isFalse);
    expect(
      user.subscription?.purchaseAvailability,
      PurchaseAvailability.available,
    );
    expect(
      user.subscription?.accessReason,
      SubscriptionAccessReason.subscription,
    );
  });

  test('unknown server values fail closed while preserving server entitlement',
      () {
    final user = UserConverterImpl().convert(
      DataDto(
        data: UserDto.fromJson({
          ..._userJson,
          'subscription': {
            'status': 'FUTURE_STATE',
            'entitlement_active': false,
            'will_renew': false,
            'current_period_ends_at': null,
            'provider': null,
            'management_url': null,
            'purchase_availability': 'FUTURE_AVAILABILITY',
            'access_reason': 'FUTURE_REASON',
          },
        }),
      ),
    );

    expect(user.subscription?.status, SubscriptionStatus.unknown);
    expect(user.subscription?.entitlementActive, isFalse);
    expect(
      user.subscription?.purchaseAvailability,
      PurchaseAvailability.unknown,
    );
    expect(user.subscription?.accessReason, SubscriptionAccessReason.unknown);
  });
}

final _userJson = <String, Object?>{
  'id': 'user-1',
  'email': 'user@example.test',
  'name': 'User',
  'level': 1,
  'experience_in_level': 0,
  'level_experience': 100,
  'streak_days': 0,
  'best_streak_days': 0,
  'questions_answered': 0,
  'correct_answers': 0,
  'accuracy': 0.0,
  'total_points': 0,
  'member_since': '2026-01-01T00:00:00Z',
  'achievements_unlocked': 0,
  'achievements_total': 10,
};
