import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

abstract interface class UserRepository {
  Future<Result<void, Failure>> createUser(UserEntity user);

  Future<Result<UserEntity, Failure>> fetchById(String id);
}
