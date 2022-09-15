import 'package:quiz/app/data/model/api_quiz_question_model.dart';
import 'package:quiz/app/data/model/api_quiz_video_model.dart';
import 'package:quiz/app/domain/model/quiz_answer_model.dart';
import 'package:quiz/app/domain/model/quiz_item_model.dart';
import 'package:quiz/app/domain/model/quiz_video_model.dart';
import 'package:quiz/app/domain/model/quiz_video_question_model.dart';

abstract class QuizMapper {
  static QuizItemModel fromApi(ApiQuizQuestionModel question) {
    return QuizItemModel(
      id: question.id,
      time: question.time,
      url: question.url,
      description: question.description,
      gameType: mapQuizItemType(question.gameType),
      answers: question.answers.map((e) => _AnswerMapper.fromApi(e)).toList(),
    );
  }
}

abstract class QuizVideoMapper {
  static QuizVideoModel fromApi(ApiQuizVideoModel video) {
    return QuizVideoModel(
      id: video.id,
      videoUrl: video.url,
      questions:
          video.questions.map((e) => _VideoQuestionMapper.fromApi(e)).toList(),
    );
  }
}

abstract class _VideoQuestionMapper {
  static QuizVideoQuestionModel fromApi(ApiQuizVideoQuestionModel question) {
    return QuizVideoQuestionModel(
      id: question.id,
      timestamp: question.timestamp,
      question: QuizMapper.fromApi(question.question),
    );
  }
}

abstract class _AnswerMapper {
  static QuizAnswerModel fromApi(ApiQuizAnswerModel answer) {
    return QuizAnswerModel(
      id: answer.id,
      variant: answer.variant,
      value: answer.value,
      isCorrect: answer.isCorrect,
    );
  }
}
