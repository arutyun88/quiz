import 'package:json_annotation/json_annotation.dart';
import 'package:quiz/app/domain/model/quiz_item_model.dart';

class ApiQuizQuestionModel {
  final int id;
  final int time;
  final String description;
  final String? url;
  final List<ApiQuizAnswerModel> answers;
  final ApiQuizQuestionType gameType;

  ApiQuizQuestionModel.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        time = map['time'],
        description = map['description'],
        url = map['url'],
        answers = (map['answers'] as List)
            .map((e) => ApiQuizAnswerModel.fromApi(e))
            .toList(),
        gameType = $enumDecode(_gameTypes, map['gameType']);
}

class ApiQuizAnswerModel {
  final int id;
  final String variant;
  final String value;
  final bool isCorrect;

  ApiQuizAnswerModel.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        variant = map['variant'],
        value = map['value'],
        isCorrect = map['isCorrect'];
}

enum ApiQuizQuestionType { video, image, text }

const Map<ApiQuizQuestionType, String> _gameTypes = {
  ApiQuizQuestionType.video: 'video',
  ApiQuizQuestionType.image: 'image',
  ApiQuizQuestionType.text: 'text',
};

// TODO вынести в общий слой
QuizItemType mapQuizItemType(ApiQuizQuestionType quizType) {
  switch (quizType) {
    case ApiQuizQuestionType.video:
      return QuizItemType.video;
    case ApiQuizQuestionType.image:
      return QuizItemType.image;
    case ApiQuizQuestionType.text:
      return QuizItemType.text;
  }
}
