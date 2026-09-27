import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_entity.freezed.dart';

@freezed
class SubscriptionEntity with _$SubscriptionEntity {
  const factory SubscriptionEntity({
    required SubscriptionStatus status,
    required bool entitlementActive,
    required bool willRenew,
    DateTime? currentPeriodEndsAt,
    String? provider,
    String? managementUrl,
    required PurchaseAvailability purchaseAvailability,
    SubscriptionAccessReason? accessReason,
  }) = _SubscriptionEntity;
}

enum SubscriptionStatus {
  notSubscribed,
  activeRenewing,
  canceledActive,
  expired,
  pending,
  gracePeriod,
  revoked,
  unknown,
}

enum PurchaseAvailability {
  available,
  comingSoon,
  temporarilyUnavailable,
  unknown,
}

enum SubscriptionAccessReason {
  subscription,
  marketPreview,
  promotion,
  adminGrant,
  unknown,
}
