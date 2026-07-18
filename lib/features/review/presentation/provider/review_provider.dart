import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/review/domain/entity/review_queue_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';

final reviewProvider = StateNotifierProvider.autoDispose<ReviewNotifier, BaseState<ReviewQueueEntity>>(
  (ref) => ReviewNotifier(reviewRepository: getIt<ReviewRepository>()),
);

class ReviewNotifier extends StateNotifier<BaseState<ReviewQueueEntity>> {
  final ReviewRepository _reviewRepository;

  ReviewNotifier({
    required ReviewRepository reviewRepository,
  })  : _reviewRepository = reviewRepository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = BaseState.loading();

    final result = await _reviewRepository.fetch();

    switch (result) {
      case ResultOk(data: final queue):
        state = BaseState.data(queue);
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }
}
