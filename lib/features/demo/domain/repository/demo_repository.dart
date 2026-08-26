import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/demo/domain/entity/demo_answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';

abstract interface class DemoRepository {
  Future<Result<PageEntity<QuestionEntity>, Failure>> fetchQuestions({
    required int limit,
  });

  Future<Result<DemoAnswerEntity, Failure>> checkAnswer({
    required String questionId,
    required String answerId,
  });
}
