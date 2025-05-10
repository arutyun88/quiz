import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/dto/answered_statistics_dto.dart';
import 'package:quiz/features/question/domain/entity/answered_statistics_entity.dart';
import 'package:quiz/features/user/data/converter/user_statistics_converter.dart';

typedef AnsweredStatisticsDtoConverter = DtoConverter<AnsweredStatisticsEntity, DataDto<AnsweredStatisticsDto>>;

@Injectable(as: AnsweredStatisticsDtoConverter)
final class AnsweredStatisticsDtoConverterImpl extends AnsweredStatisticsDtoConverter {
  final UserStatisticsConverter _userStatisticsConverter;

  const AnsweredStatisticsDtoConverterImpl({
    required UserStatisticsConverter userStatisticsConverter,
  }) : _userStatisticsConverter = userStatisticsConverter;

  @override
  AnsweredStatisticsEntity convert(DataDto<AnsweredStatisticsDto> dto) {
    return AnsweredStatisticsEntity(
      lastIsCorrect: dto.data.lastIsCorrect,
      statistics: _userStatisticsConverter.convert(DataDto(data: dto.data.statistics)),
    );
  }
}
