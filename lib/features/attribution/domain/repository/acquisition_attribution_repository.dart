import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/attribution/domain/entity/acquisition_attribution_entity.dart';

abstract interface class AcquisitionAttributionRepository {
  Future<Result<AcquisitionAttributionReceiptEntity, Failure>> record(
    AcquisitionAttributionSignalEntity signal,
  );
}
