import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/review/domain/entity/review_queue_entity.dart';

abstract interface class ReviewRepository {
  Future<Result<ReviewQueueEntity, Failure>> fetch();
}
