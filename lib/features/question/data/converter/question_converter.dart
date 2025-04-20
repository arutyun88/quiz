import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/converter/answer_converter.dart';
import 'package:quiz/features/question/data/converter/topic_converter.dart';
import 'package:quiz/features/question/data/dto/question_dto.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';

typedef QuestionPageConverter = DataPageConverter<QuestionEntity, QuestionDto>;
typedef QuestionConverter = DtoConverter<QuestionEntity, QuestionDto>;

@Injectable(as: QuestionConverter)
final class QuestionConverterImpl extends QuestionConverter {
  final TopicConverter _topicConverter;
  final AnswerConverter _answerConverter;

  const QuestionConverterImpl({
    required TopicConverter topicConverter,
    required AnswerConverter answerConverter,
  })  : _topicConverter = topicConverter,
        _answerConverter = answerConverter;

  @override
  QuestionEntity convert(QuestionDto dto) {
    return QuestionEntity(
      id: dto.id,
      question: dto.question,
      description: dto.description,
      hint: dto.hint,
      topic: _topicConverter.convert(dto.topic),
      answers: _answerConverter.convertMultiple(dto.answers).toList(),
    );
  }
}
