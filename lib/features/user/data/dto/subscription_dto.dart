import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_dto.freezed.dart';
part 'subscription_dto.g.dart';

@freezed
class SubscriptionDto with _$SubscriptionDto {
  const factory SubscriptionDto({
    required String status,
    @JsonKey(name: 'entitlement_active') required bool entitlementActive,
    @JsonKey(name: 'will_renew') required bool willRenew,
    @JsonKey(name: 'current_period_ends_at') DateTime? currentPeriodEndsAt,
    String? provider,
    @JsonKey(name: 'management_url') String? managementUrl,
    @JsonKey(name: 'purchase_availability')
    required String purchaseAvailability,
    @JsonKey(name: 'access_reason') String? accessReason,
  }) = _SubscriptionDto;

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoFromJson(json);
}
