import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/dto/question_state_dto.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';

typedef QuestionStateDtoConverter = DtoConverter<QuestionStateEntity, DataDto<QuestionStateDto>>;

@Injectable(as: QuestionStateDtoConverter)
final class QuestionStateDtoConverterImpl extends QuestionStateDtoConverter {
  @override
  QuestionStateEntity convert(DataDto<QuestionStateDto> dto) {
    return QuestionStateEntity(
      questionId: dto.data.questionId,
      isAnswered: dto.data.isAnswered,
    );
  }
}
