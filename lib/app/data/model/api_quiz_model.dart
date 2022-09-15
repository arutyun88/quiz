import 'package:json_annotation/json_annotation.dart';
import 'package:quiz/app/domain/model/quiz_model.dart';

class ApiQuizModel {
  final int id;
  final String targetQuiz;
  final String description;
  final String photo;
  final ApiQuizType type;

  ApiQuizModel.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        targetQuiz = map['targetQuiz'],
        description = map['description'],
        photo = map['photo'],
        type = $enumDecode(_quizTypes, map['type']);
}

/// SQ - SIMPLE QUIZ
///
/// VPQ - VIDEO PREDICTION QUIZ
enum ApiQuizType { SQ, VPQ }

const Map<ApiQuizType, String> _quizTypes = {
  ApiQuizType.SQ: 'SQ',
  ApiQuizType.VPQ: 'VPQ',
};

// TODO вынести в общий слой
QuizType mapQuizType(ApiQuizType quizType) {
  switch (quizType) {
    case ApiQuizType.SQ:
      return QuizType.simple;
    case ApiQuizType.VPQ:
      return QuizType.video;
  }
}