import 'package:quiz/app/data/api_util.dart';
import 'package:quiz/app/domain/model/quiz_item_model.dart';
import 'package:quiz/app/domain/model/quiz_video_model.dart';
import 'package:quiz/app/domain/repository/quiz_repository.dart';

class QuizDataRepository extends QuizRepository {
  final ApiUtil _apiUtil;

  QuizDataRepository(this._apiUtil);

  @override
  Future<List<QuizItemModel>> getSimpleQuiz(int id) async {
    return await _apiUtil.getSimpleQuiz(id);
  }

  @override
  Future<QuizVideoModel> getVideoQuiz(int id) async {
    return await _apiUtil.getVideoQuiz(id);
  }
}
