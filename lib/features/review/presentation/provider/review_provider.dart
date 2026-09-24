import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';

final reviewProvider = StateNotifierProvider<ReviewNotifier, ReviewState>(
  (ref) {
    final userId = ref.watch(
      authenticationProvider.select(
        (state) => state.mapOrNull(
          authenticated: (state) => state.user?.id,
        ),
      ),
    );
    return ReviewNotifier(
      reviewRepository: getIt<ReviewRepository>(),
      autoFetch: userId != null,
    );
  },
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
  ReviewNotifier({
    required ReviewRepository reviewRepository,
    bool autoFetch = true,
  })  : _reviewRepository = reviewRepository,
        super(const ReviewLoadingState()) {
    if (autoFetch) fetch();
  }

  static const _pageSize = 20;
  final ReviewRepository _reviewRepository;
  Future<bool>? _pendingFetch;

  Future<bool> fetch() => _pendingFetch ??= _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<bool> refresh() {
    if (state case ReviewDataState(isLoadingMore: true)) {
      return Future.value(true);
    }
    return fetch();
  }

  Future<bool> _fetch() async {
    final previousState = state;
    final result = await _reviewRepository.fetch(limit: _pageSize, offset: 0);
    switch (result) {
      case ResultOk(data: final history):
        state = ReviewDataState(
          items: history.items,
          total: history.total,
        );
        return true;
      case ResultFailed(error: final failure):
        if (previousState is! ReviewDataState) {
          state = ReviewFailedState(failure);
        }
        return false;
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (_pendingFetch != null ||
        current is! ReviewDataState ||
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

  Future<bool> requestPractice(String attemptId) async {
    final result = await _reviewRepository.requestPractice(attemptId);
    switch (result) {
      case ResultOk():
        final current = state;
        if (current is ReviewDataState) {
          state = ReviewDataState(
            items: current.items
                .map(
                  (item) => item.attemptId == attemptId
                      ? item.copyWith(practiceRequested: true)
                      : item,
                )
                .toList(),
            total: current.total,
            isLoadingMore: current.isLoadingMore,
            failure: current.failure,
          );
        }
        return true;
      case ResultFailed():
        return false;
    }
  }
}
