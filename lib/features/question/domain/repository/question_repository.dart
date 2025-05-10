import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';

abstract interface class QuestionRepository {
  Future<Result<PageEntity<QuestionEntity>, Failure>> fetch({
    int limit = 1,
  });

  Future<Result<QuestionStateEntity, Failure>> checkQuestionStateById(String id);
}
