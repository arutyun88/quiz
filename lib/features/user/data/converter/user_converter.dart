import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/user/data/dto/user_dto.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

typedef UserConverter = DtoConverter<UserEntity, UserDto>;

@Injectable(as: UserConverter)
final class UserConverterImpl extends UserConverter {
  @override
  UserEntity convert(UserDto dto) {
    return UserEntity(
      id: dto.id,
      email: dto.email,
      name: dto.name,
      birthDate: dto.birthDate,
    );
  }

  @override
  UserDto revert(UserEntity entity) {
    DateTime? birthDate;
    if (entity.birthDate case DateTime birthDate) {
      birthDate = DateTime.utc(birthDate.year, birthDate.month, birthDate.day);
    }
    return UserDto(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      birthDate: birthDate,
    );
  }
}
