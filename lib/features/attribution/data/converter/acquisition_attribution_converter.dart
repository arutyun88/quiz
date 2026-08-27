import 'package:quiz/features/attribution/data/dto/acquisition_attribution_dto.dart';
import 'package:quiz/features/attribution/domain/entity/acquisition_attribution_entity.dart';

extension AcquisitionAttributionSignalConverter
    on AcquisitionAttributionSignalEntity {
  AcquisitionAttributionRequestDto toDto() => AcquisitionAttributionRequestDto(
        clientEventId: clientEventId,
        provider: provider,
        providerAttributionId: providerAttributionId,
        source: source,
        campaign: campaign,
        adGroup: adGroup,
        creative: creative,
        attributionModel: attributionModel,
        attributedAt: attributedAt?.toUtc(),
      );
}

extension AcquisitionAttributionReceiptConverter
    on AcquisitionAttributionReceiptDto {
  AcquisitionAttributionReceiptEntity toEntity() =>
      AcquisitionAttributionReceiptEntity(
        attributionId: attributionId,
        clientEventId: clientEventId,
      );
}
