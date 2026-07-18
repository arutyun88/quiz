import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_entity.freezed.dart';

@freezed
class SubscriptionEntity with _$SubscriptionEntity {
  const factory SubscriptionEntity({
    required bool active,
    required SubscriptionPlan plan,
    DateTime? renewsAt,
  }) = _SubscriptionEntity;
}

enum SubscriptionPlan { monthly, yearly }
