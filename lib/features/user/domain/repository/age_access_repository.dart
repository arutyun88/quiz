import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';

abstract interface class AgeAccessRepository {
  Future<Result<AgeAccessEntity, Failure>> fetch();

  Future<Result<AgeAccessEntity, Failure>> confirm({
    required String policyVersion,
  });

  Future<Result<AgeAccessEntity, Failure>> revoke();
}
