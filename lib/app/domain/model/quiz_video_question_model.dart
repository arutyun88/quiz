import 'package:quiz/app/domain/model/quiz_item_model.dart';

class QuizVideoQuestionModel {
  final int id;
  final int timestamp;
  final QuizItemModel question;

  const QuizVideoQuestionModel({
    required this.id,
    required this.timestamp,
    required this.question,
  });
}
