// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acquisition_attribution_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcquisitionAttributionRequestDtoImpl
    _$$AcquisitionAttributionRequestDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$AcquisitionAttributionRequestDtoImpl(
          clientEventId: json['client_event_id'] as String,
          provider: json['provider'] as String,
          providerAttributionId: json['provider_attribution_id'] as String,
          source: json['source'] as String?,
          campaign: json['campaign'] as String?,
          adGroup: json['ad_group'] as String?,
          creative: json['creative'] as String?,
          attributionModel: json['attribution_model'] as String?,
          attributedAt: json['attributed_at'] == null
              ? null
              : DateTime.parse(json['attributed_at'] as String),
        );

Map<String, dynamic> _$$AcquisitionAttributionRequestDtoImplToJson(
        _$AcquisitionAttributionRequestDtoImpl instance) =>
    <String, dynamic>{
      'client_event_id': instance.clientEventId,
      'provider': instance.provider,
      'provider_attribution_id': instance.providerAttributionId,
      if (instance.source case final value?) 'source': value,
      if (instance.campaign case final value?) 'campaign': value,
      if (instance.adGroup case final value?) 'ad_group': value,
      if (instance.creative case final value?) 'creative': value,
      if (instance.attributionModel case final value?)
        'attribution_model': value,
      if (instance.attributedAt?.toIso8601String() case final value?)
        'attributed_at': value,
    };

_$AcquisitionAttributionReceiptDtoImpl
    _$$AcquisitionAttributionReceiptDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$AcquisitionAttributionReceiptDtoImpl(
          attributionId: json['attribution_id'] as String,
          clientEventId: json['client_event_id'] as String,
        );

Map<String, dynamic> _$$AcquisitionAttributionReceiptDtoImplToJson(
        _$AcquisitionAttributionReceiptDtoImpl instance) =>
    <String, dynamic>{
      'attribution_id': instance.attributionId,
      'client_event_id': instance.clientEventId,
    };
