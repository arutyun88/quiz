// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionDtoImpl _$$SubscriptionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionDtoImpl(
      status: json['status'] as String,
      entitlementActive: json['entitlement_active'] as bool,
      willRenew: json['will_renew'] as bool,
      currentPeriodEndsAt: json['current_period_ends_at'] == null
          ? null
          : DateTime.parse(json['current_period_ends_at'] as String),
      provider: json['provider'] as String?,
      managementUrl: json['management_url'] as String?,
      purchaseAvailability: json['purchase_availability'] as String,
      accessReason: json['access_reason'] as String?,
    );

Map<String, dynamic> _$$SubscriptionDtoImplToJson(
        _$SubscriptionDtoImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'entitlement_active': instance.entitlementActive,
      'will_renew': instance.willRenew,
      'current_period_ends_at': instance.currentPeriodEndsAt?.toIso8601String(),
      'provider': instance.provider,
      'management_url': instance.managementUrl,
      'purchase_availability': instance.purchaseAvailability,
      'access_reason': instance.accessReason,
    };
