import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/converter/db_converter.dart';
import 'package:quiz/features/question/data/converter/answer_db_converter.dart';
import 'package:quiz/features/question/data/converter/topic_db_converter.dart';
import 'package:quiz/features/question/data/table/question_answer.dart';
import 'package:quiz/features/question/data/table/question_db_model.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';

typedef QuestionDbConverter = DbConverter<QuestionEntity, QuestionDbModel>;

@Injectable(as: QuestionDbConverter)
final class QuestionDbConverterImpl extends QuestionDbConverter {
  final AnswerDbConverter _answerConverter;
  final TopicDbConverter _topicConverter;

  QuestionDbConverterImpl({
    required AnswerDbConverter answerConverter,
    required TopicDbConverter topicConverter,
  })  : _answerConverter = answerConverter,
        _topicConverter = topicConverter;

  @override
  QuestionDbModel toDao(QuestionEntity entity) {
    return QuestionDbModel(
      question: Question(
        id: entity.id,
        question: entity.question,
        description: entity.description,
        hint: entity.hint,
        topicId: entity.topic.id,
      ),
      answers: _answerConverter
          .toDaoMultiple(entity.answers.map((answer) => QuestionAnswer(answer: answer, question: entity.id)))
          .toList(),
      topic: _topicConverter.toDao(entity.topic),
    );
  }

  @override
  QuestionEntity toEntity(QuestionDbModel dao) {
    return QuestionEntity(
      id: dao.question.id,
      question: dao.question.question,
      description: dao.question.description,
      hint: dao.question.hint,
      topic: _topicConverter.toEntity(dao.topic),
      answers: _answerConverter.toEntityMultiple(dao.answers).map((answer) => answer.answer).toList(),
    );
  }
}
