import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/dto/answered_today_dto.dart';

typedef AnsweredTodayDtoConverter = DtoConverter<bool, DataDto<AnsweredTodayDto>>;

@Injectable(as: AnsweredTodayDtoConverter)
final class AnsweredTodayDtoConverterImpl extends AnsweredTodayDtoConverter {
  @override
  bool convert(DataDto<AnsweredTodayDto> dto) => dto.data.answeredToday;
}
