import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

abstract interface class UserRepository {
  Future<Result<UserEntity, Failure>> fetch();

  Future<Result<UserEntity, Failure>> update({
    String? name,
    DateTime? birthDate,
  });
}
