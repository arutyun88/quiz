import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dao/dao_converter.dart';
import 'package:quiz/features/user/data/dao/user_dao.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

typedef UserDaoConverter = DaoConverter<UserEntity, UserDao>;

@Injectable(as: UserDaoConverter)
final class UserDaoConverterImpl extends UserDaoConverter {
  @override
  UserEntity toEntity(UserDao dao) {
    return UserEntity(
      id: dao.id,
      email: dao.email,
      name: dao.name,
      birthDate: dao.birthDate,
    );
  }

  @override
  UserDao toDao(UserEntity entity) {
    return UserDao(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      birthDateIso: entity.birthDate?.toIso8601String(),
    );
  }
}
