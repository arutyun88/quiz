import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/dto/answer_result_dto.dart';
import 'package:quiz/features/question/domain/entity/answer_result_entity.dart';

typedef AnswerResultConverter = DtoConverter<AnswerResultEntity, DataDto<AnswerResultDto>>;

@Injectable(as: AnswerResultConverter)
final class AnswerResultConverterImpl extends AnswerResultConverter {
  @override
  AnswerResultEntity convert(DataDto<AnswerResultDto> dto) {
    return AnswerResultEntity(
      answerId: dto.data.userAnswerId,
      correctAnswerId: dto.data.correctAnswerId,
      description: dto.data.description,
      isCorrect: dto.data.isCorrect,
    );
  }
}
