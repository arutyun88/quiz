import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';

abstract interface class ReviewRepository {
  Future<Result<ReviewHistoryEntity, Failure>> fetch({
    required int limit,
    required int offset,
  });
}
