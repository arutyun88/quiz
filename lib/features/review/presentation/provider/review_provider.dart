import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/question_report/domain/entity/question_report_status.dart';
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
  ReviewPracticeStatus? _practiceStatus;
  int _requestRevision = 0;

  Future<bool> fetch() {
    final pending = _pendingFetch;
    if (pending != null) return pending;
    return _startFetch();
  }

  Future<bool> refresh() {
    if (state case ReviewDataState(isLoadingMore: true)) {
      return Future.value(true);
    }
    return fetch();
  }

  Future<bool> setPracticeStatus(ReviewPracticeStatus? practiceStatus) async {
    if (_practiceStatus == practiceStatus) return true;

    final previous = _practiceStatus;
    _practiceStatus = practiceStatus;
    _requestRevision += 1;
    _pendingFetch = null;
    final loaded = await _startFetch();
    if (!loaded && _practiceStatus == practiceStatus) {
      _practiceStatus = previous;
    }
    return loaded;
  }

  Future<bool> _startFetch() {
    final revision = ++_requestRevision;
    final status = _practiceStatus;
    late final Future<bool> request;
    request = _fetch(revision, status).whenComplete(() {
      if (identical(_pendingFetch, request)) _pendingFetch = null;
    });
    _pendingFetch = request;
    return request;
  }

  Future<bool> _fetch(
    int revision,
    ReviewPracticeStatus? practiceStatus,
  ) async {
    final previousState = state;
    final result = await _fetchPage(
      limit: _pageSize,
      offset: 0,
      practiceStatus: practiceStatus,
    );
    if (revision != _requestRevision) return true;
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
    final revision = _requestRevision;
    final result = await _fetchPage(
      limit: _pageSize,
      offset: current.items.length,
      practiceStatus: _practiceStatus,
    );
    if (revision != _requestRevision) return;
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
                      ? item.copyWith(
                          practiceRequested: true,
                          practiceStatus: ReviewPracticeStatus.queued,
                        )
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

  void markReportSubmitted(String attemptId) {
    final current = state;
    if (current is! ReviewDataState) return;
    state = ReviewDataState(
      items: current.items
          .map(
            (item) => item.attemptId == attemptId
                ? item.copyWith(
                    reportSubmitted: true,
                    reportStatus: QuestionReportStatus.pending,
                  )
                : item,
          )
          .toList(),
      total: current.total,
      isLoadingMore: current.isLoadingMore,
      failure: current.failure,
    );
  }

  Future<Result<ReviewHistoryEntity, Failure>> _fetchPage({
    required int limit,
    required int offset,
    required ReviewPracticeStatus? practiceStatus,
  }) =>
      practiceStatus == null
          ? _reviewRepository.fetch(limit: limit, offset: offset)
          : _reviewRepository.fetch(
              limit: limit,
              offset: offset,
              practiceStatuses: {practiceStatus},
            );
}
