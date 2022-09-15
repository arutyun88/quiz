import 'package:quiz/app/data/model/api_quiz_question_model.dart';

class ApiQuizVideoModel {
  final int id;
  final String url;
  final List<ApiQuizVideoQuestionModel> questions;

  ApiQuizVideoModel.fromApi(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        url = map['url'],
        questions = (map['questions'] as List)
            .map((e) => ApiQuizVideoQuestionModel.fromApi(e))
            .toList();
}

class ApiQuizVideoQuestionModel {
  final int id;
  final int timestamp;
  final ApiQuizQuestionModel question;

  ApiQuizVideoQuestionModel.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        timestamp = map['timestamp'],
        question = ApiQuizQuestionModel.fromApi(map['question']);
}
