// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionDtoImpl _$$SubscriptionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionDtoImpl(
      active: json['active'] as bool,
      plan: json['plan'] as String,
      renewsAt: json['renews_at'] == null
          ? null
          : DateTime.parse(json['renews_at'] as String),
    );

Map<String, dynamic> _$$SubscriptionDtoImplToJson(
        _$SubscriptionDtoImpl instance) =>
    <String, dynamic>{
      'active': instance.active,
      'plan': instance.plan,
      'renews_at': instance.renewsAt?.toIso8601String(),
    };
