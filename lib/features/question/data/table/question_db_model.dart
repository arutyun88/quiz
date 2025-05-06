import 'package:quiz/app/core/database/app_database.dart';

class QuestionDbModel {
  final Question question;
  final List<Answer> answers;
  final Topic topic;

  QuestionDbModel({
    required this.question,
    required this.topic,
    required this.answers,
  });
}
