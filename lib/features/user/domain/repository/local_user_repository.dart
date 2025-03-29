import 'package:quiz/features/user/domain/entity/user_entity.dart';

abstract interface class LocalUserRepository {
  Future<UserEntity?> fetchUser();

  Future<void> saveUser(UserEntity user);
}
