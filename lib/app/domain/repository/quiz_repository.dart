import 'package:quiz/app/domain/model/quiz_item_model.dart';
import 'package:quiz/app/domain/model/quiz_video_model.dart';

abstract class QuizRepository {
  Future<List<QuizItemModel>> getSimpleQuiz(int id);

  Future<QuizVideoModel> getVideoQuiz(int id);
}
