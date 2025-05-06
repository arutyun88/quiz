import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/converter/db_converter.dart';
import 'package:quiz/features/question/data/table/question_answer.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';

typedef AnswerDbConverter = DbConverter<QuestionAnswer, Answer>;

@Injectable(as: AnswerDbConverter)
final class AnswerDbConverterImpl extends AnswerDbConverter {
  @override
  Answer toDao(QuestionAnswer entity) {
    return Answer(
      id: entity.answer.id,
      isCorrect: entity.answer.isCorrect,
      answer: entity.answer.text,
      questionId: entity.question,
    );
  }

  @override
  QuestionAnswer toEntity(Answer dao) {
    return QuestionAnswer(
      answer: AnswerEntity(
        id: dao.id,
        isCorrect: dao.isCorrect,
        text: dao.answer,
      ),
      question: dao.questionId,
    );
  }
}
