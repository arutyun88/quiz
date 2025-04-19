import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/dto/answer_dto.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';

typedef AnswerConverter = DtoConverter<AnswerEntity, AnswerDto>;

@Injectable(as: AnswerConverter)
final class AnswerConverterImpl extends AnswerConverter {
  @override
  AnswerEntity convert(AnswerDto dto) {
    return AnswerEntity(
      id: dto.id,
      isCorrect: dto.isCorrect,
      text: dto.answer,
    );
  }
}
