import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';

final reviewProvider =
    StateNotifierProvider.autoDispose<ReviewNotifier, ReviewState>(
  (ref) => ReviewNotifier(reviewRepository: getIt<ReviewRepository>()),
);

sealed class ReviewState {
  const ReviewState();
}

final class ReviewLoadingState extends ReviewState {
  const ReviewLoadingState();
}

final class ReviewDataState extends ReviewState {
  const ReviewDataState({
    required this.items,
    required this.total,
    this.isLoadingMore = false,
    this.failure,
  });

  final List<ReviewHistoryItemEntity> items;
  final int total;
  final bool isLoadingMore;
  final Failure? failure;

  bool get hasMore => items.length < total;
}

final class ReviewFailedState extends ReviewState {
  const ReviewFailedState(this.failure);

  final Failure failure;
}

class ReviewNotifier extends StateNotifier<ReviewState> {
  ReviewNotifier({required ReviewRepository reviewRepository})
      : _reviewRepository = reviewRepository,
        super(const ReviewLoadingState()) {
    fetch();
  }

  static const _pageSize = 20;
  final ReviewRepository _reviewRepository;

  Future<void> fetch() async {
    state = const ReviewLoadingState();
    final result = await _reviewRepository.fetch(limit: _pageSize, offset: 0);
    switch (result) {
      case ResultOk(data: final history):
        state = ReviewDataState(
          items: history.items,
          total: history.total,
        );
      case ResultFailed(error: final failure):
        state = ReviewFailedState(failure);
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! ReviewDataState ||
        current.isLoadingMore ||
        !current.hasMore) {
      return;
    }
    state = ReviewDataState(
      items: current.items,
      total: current.total,
      isLoadingMore: true,
    );
    final result = await _reviewRepository.fetch(
      limit: _pageSize,
      offset: current.items.length,
    );
    switch (result) {
      case ResultOk(data: final history):
        state = ReviewDataState(
          items: [...current.items, ...history.items],
          total: history.total,
        );
      case ResultFailed(error: final failure):
        state = ReviewDataState(
          items: current.items,
          total: current.total,
          failure: failure,
        );
    }
  }
}
