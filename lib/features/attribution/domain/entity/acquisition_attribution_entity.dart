import 'package:freezed_annotation/freezed_annotation.dart';

part 'acquisition_attribution_entity.freezed.dart';

@freezed
class AcquisitionAttributionSignalEntity
    with _$AcquisitionAttributionSignalEntity {
  const factory AcquisitionAttributionSignalEntity({
    required String clientEventId,
    required String provider,
    required String providerAttributionId,
    String? source,
    String? campaign,
    String? adGroup,
    String? creative,
    String? attributionModel,
    DateTime? attributedAt,
  }) = _AcquisitionAttributionSignalEntity;
}

@freezed
class AcquisitionAttributionReceiptEntity
    with _$AcquisitionAttributionReceiptEntity {
  const factory AcquisitionAttributionReceiptEntity({
    required String attributionId,
    required String clientEventId,
  }) = _AcquisitionAttributionReceiptEntity;
}
