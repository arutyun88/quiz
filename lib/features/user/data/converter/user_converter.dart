import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/user/data/converter/age_access_converter.dart';
import 'package:quiz/features/user/data/dto/subscription_dto.dart';
import 'package:quiz/features/user/data/dto/user_dto.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

typedef UserConverter = DtoConverter<UserEntity, DataDto<UserDto>>;

@Injectable(as: UserConverter)
final class UserConverterImpl extends UserConverter {
  @override
  UserEntity convert(DataDto<UserDto> dto) {
    return UserEntity(
      id: dto.data.id,
      email: dto.data.email,
      name: dto.data.name,
      ageAccess: dto.data.ageAccess?.toEntity(),
      timezoneId: dto.data.timezoneId,
      level: dto.data.level,
      experienceInLevel: dto.data.experienceInLevel,
      levelExperience: dto.data.levelExperience,
      streakDays: dto.data.streakDays,
      bestStreakDays: dto.data.bestStreakDays,
      questionsAnswered: dto.data.questionsAnswered,
      correctAnswers: dto.data.correctAnswers,
      accuracy: dto.data.accuracy,
      totalPoints: dto.data.totalPoints,
      memberSince: dto.data.memberSince,
      achievementsUnlocked: dto.data.achievementsUnlocked,
      achievementsTotal: dto.data.achievementsTotal,
      rating: dto.data.rating,
      bestRating: dto.data.bestRating,
      ratingOfficialAnswers: dto.data.ratingOfficialAnswers,
      ratingProvisional: dto.data.ratingProvisional,
      subscription: _convertSubscription(dto.data.subscription),
    );
  }

  SubscriptionEntity? _convertSubscription(SubscriptionDto? dto) {
    if (dto == null) return null;

    return SubscriptionEntity(
      status: _subscriptionStatus(dto.status),
      entitlementActive: dto.entitlementActive,
      willRenew: dto.willRenew,
      currentPeriodEndsAt: dto.currentPeriodEndsAt,
      provider: dto.provider,
      managementUrl: dto.managementUrl,
      purchaseAvailability: _purchaseAvailability(dto.purchaseAvailability),
      accessReason:
          dto.accessReason == null ? null : _accessReason(dto.accessReason!),
    );
  }

  SubscriptionStatus _subscriptionStatus(String value) => switch (value) {
        'NOT_SUBSCRIBED' => SubscriptionStatus.notSubscribed,
        'ACTIVE_RENEWING' => SubscriptionStatus.activeRenewing,
        'CANCELED_ACTIVE' => SubscriptionStatus.canceledActive,
        'EXPIRED' => SubscriptionStatus.expired,
        'PENDING' => SubscriptionStatus.pending,
        'GRACE_PERIOD' => SubscriptionStatus.gracePeriod,
        'REVOKED' => SubscriptionStatus.revoked,
        _ => SubscriptionStatus.unknown,
      };

  PurchaseAvailability _purchaseAvailability(String value) => switch (value) {
        'AVAILABLE' => PurchaseAvailability.available,
        'COMING_SOON' => PurchaseAvailability.comingSoon,
        'TEMPORARILY_UNAVAILABLE' =>
          PurchaseAvailability.temporarilyUnavailable,
        _ => PurchaseAvailability.unknown,
      };

  SubscriptionAccessReason _accessReason(String value) => switch (value) {
        'SUBSCRIPTION' => SubscriptionAccessReason.subscription,
        'MARKET_PREVIEW' => SubscriptionAccessReason.marketPreview,
        'PROMOTION' => SubscriptionAccessReason.promotion,
        'ADMIN_GRANT' => SubscriptionAccessReason.adminGrant,
        _ => SubscriptionAccessReason.unknown,
      };
}
