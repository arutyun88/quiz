import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/user/data/dto/user_statistics_dto.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

typedef UserStatisticsConverter = DtoConverter<UserStatisticsEntity, DataDto<UserStatisticsDto>>;

@Injectable(as: UserStatisticsConverter)
final class UserStatisticsConverterImpl extends UserStatisticsConverter {
  @override
  UserStatisticsEntity convert(DataDto<UserStatisticsDto> dto) {
    return UserStatisticsEntity(
      rightCount: dto.data.rightCount,
      wrongCount: dto.data.wrongCount,
    );
  }
}
