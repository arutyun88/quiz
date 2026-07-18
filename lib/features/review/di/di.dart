import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/features/review/data/converter/review_queue_converter.dart';
import 'package:quiz/features/review/data/repository/remote_review_repository.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';

@module
abstract class ReviewModule {
  @lazySingleton
  ReviewRepository reviewRepository({
    required ApiClient client,
    required ReviewQueueConverter reviewQueueConverter,
  }) =>
      RemoteReviewRepository(
        client: client,
        reviewQueueConverter: reviewQueueConverter,
      );
}
