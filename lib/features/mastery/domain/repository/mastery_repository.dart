import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';

abstract interface class MasteryRepository {
  Future<Result<MasteryEntity, Failure>> fetch();
}
