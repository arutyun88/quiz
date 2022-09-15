import 'package:quiz/app/domain/model/quiz_video_question_model.dart';

class QuizVideoModel {
  final int id;
  final String videoUrl;
  final List<QuizVideoQuestionModel> questions;

  const QuizVideoModel({
    required this.id,
    required this.videoUrl,
    required this.questions,
  });
}
