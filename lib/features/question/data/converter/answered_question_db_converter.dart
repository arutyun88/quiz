import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/converter/db_converter.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';

typedef AnsweredQuestionDbConverter = DbConverter<AnsweredQuestionEntity, AnsweredQuestion>;

@Injectable(as: AnsweredQuestionDbConverter)
final class AnsweredQuestionDbConverterImpl extends AnsweredQuestionDbConverter {
  const AnsweredQuestionDbConverterImpl();

  @override
  AnsweredQuestion toDao(AnsweredQuestionEntity entity) {
    return AnsweredQuestion(
      questionId: entity.questionId,
      question: entity.question,
      answerId: entity.answerId,
      answer: entity.answer,
      isCorrect: entity.isCorrect,
      answeredAt: entity.answeredAt,
    );
  }

  @override
  AnsweredQuestionEntity toEntity(AnsweredQuestion dao) {
    return AnsweredQuestionEntity(
      questionId: dao.questionId,
      question: dao.question,
      answerId: dao.answerId,
      answer: dao.answer,
      isCorrect: dao.isCorrect,
      answeredAt: dao.answeredAt,
    );
  }
}
