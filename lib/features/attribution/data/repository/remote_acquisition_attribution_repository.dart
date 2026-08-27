import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/attribution/data/converter/acquisition_attribution_converter.dart';
import 'package:quiz/features/attribution/data/dto/acquisition_attribution_dto.dart';
import 'package:quiz/features/attribution/domain/entity/acquisition_attribution_entity.dart';
import 'package:quiz/features/attribution/domain/repository/acquisition_attribution_repository.dart';

@LazySingleton(as: AcquisitionAttributionRepository)
class RemoteAcquisitionAttributionRepository
    implements AcquisitionAttributionRepository {
  const RemoteAcquisitionAttributionRepository({required ApiClient client})
      : _client = client;

  final ApiClient _client;

  @override
  Future<Result<AcquisitionAttributionReceiptEntity, Failure>> record(
    AcquisitionAttributionSignalEntity signal,
  ) async =>
      await _client.post(
        '/acquisition-attributions',
        body: signal.toDto().toJson(),
        mapper: (json) => DataDto.fromJson(
          json,
          (data) => AcquisitionAttributionReceiptDto.fromJson(data as Json),
        ),
        converter: (dto) => dto.data.toEntity(),
      );
}
