import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/dto/answered_today_dto.dart';
import 'package:quiz/features/question/domain/entity/answered_today_entity.dart';

typedef AnsweredTodayDtoConverter = DtoConverter<AnsweredTodayEntity, DataDto<AnsweredTodayDto>>;

@Injectable(as: AnsweredTodayDtoConverter)
final class AnsweredTodayDtoConverterImpl extends AnsweredTodayDtoConverter {
  @override
  AnsweredTodayEntity convert(DataDto<AnsweredTodayDto> dto) => AnsweredTodayEntity(
        answeredQuestionCount: dto.data.answeredQuestionCount,
      );
}
