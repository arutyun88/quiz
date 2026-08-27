import 'package:freezed_annotation/freezed_annotation.dart';

part 'acquisition_attribution_dto.freezed.dart';
part 'acquisition_attribution_dto.g.dart';

@freezed
class AcquisitionAttributionRequestDto with _$AcquisitionAttributionRequestDto {
  const factory AcquisitionAttributionRequestDto({
    @JsonKey(name: 'client_event_id') required String clientEventId,
    required String provider,
    @JsonKey(name: 'provider_attribution_id')
    required String providerAttributionId,
    @JsonKey(includeIfNull: false) String? source,
    @JsonKey(includeIfNull: false) String? campaign,
    @JsonKey(name: 'ad_group', includeIfNull: false) String? adGroup,
    @JsonKey(includeIfNull: false) String? creative,
    @JsonKey(name: 'attribution_model', includeIfNull: false)
    String? attributionModel,
    @JsonKey(name: 'attributed_at', includeIfNull: false)
    DateTime? attributedAt,
  }) = _AcquisitionAttributionRequestDto;

  factory AcquisitionAttributionRequestDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AcquisitionAttributionRequestDtoFromJson(json);
}

@freezed
class AcquisitionAttributionReceiptDto with _$AcquisitionAttributionReceiptDto {
  const factory AcquisitionAttributionReceiptDto({
    @JsonKey(name: 'attribution_id') required String attributionId,
    @JsonKey(name: 'client_event_id') required String clientEventId,
  }) = _AcquisitionAttributionReceiptDto;

  factory AcquisitionAttributionReceiptDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AcquisitionAttributionReceiptDtoFromJson(json);
}
