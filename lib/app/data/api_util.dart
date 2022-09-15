import 'package:quiz/app/data/api/quiz/quiz_api.dart';
import 'package:quiz/app/data/mapper/quiz_mapper.dart';
import 'package:quiz/app/domain/model/quiz_item_model.dart';
import 'package:quiz/app/domain/model/quiz_video_model.dart';

/// Единая точка входа в API
class ApiUtil {
  final QuizApi _quizApi;

  ApiUtil({
    required QuizApi quizApi,
  }) : _quizApi = quizApi;

  Future<List<QuizItemModel>> getSimpleQuiz(int id) async {
    final result = await _quizApi.getSimpleQuiz(id);
    return result.map((e) => QuizMapper.fromApi(e)).toList();
  }

  Future<QuizVideoModel> getVideoQuiz(int id) async {
    return QuizVideoMapper.fromApi(await _quizApi.getVideoQuiz(id));
  }
}
