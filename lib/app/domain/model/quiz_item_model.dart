import 'package:quiz/app/domain/model/quiz_answer_model.dart';

class QuizItemModel {
  final int id;
  final int time;
  final String description;
  final QuizItemType gameType;
  final String? url;
  final List<QuizAnswerModel> answers;

  const QuizItemModel({
    required this.id,
    required this.time,
    required this.description,
    required this.gameType,
    this.url,
    required this.answers,
  });
}

enum QuizItemType { video, image, text }

