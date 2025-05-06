import 'package:quiz/features/question/domain/entity/answer_entity.dart';

class QuestionAnswer {
  final AnswerEntity answer;
  final String question;

  QuestionAnswer({
    required this.answer,
    required this.question,
  });
}
