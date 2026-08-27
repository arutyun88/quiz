import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/leaderboard/domain/entity/season_history_entity.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

final seasonHistoryProvider = StateNotifierProvider.autoDispose<
    SeasonHistoryNotifier, SeasonHistoryState>(
  (ref) => SeasonHistoryNotifier(
    repository: getIt<LeaderboardRepository>(),
  ),
);

sealed class SeasonHistoryState {
  const SeasonHistoryState();
}

final class SeasonHistoryLoadingState extends SeasonHistoryState {
  const SeasonHistoryLoadingState();
}

final class SeasonHistoryDataState extends SeasonHistoryState {
  const SeasonHistoryDataState({
    required this.items,
    required this.total,
    this.isLoadingMore = false,
    this.failure,
  });

  final List<SeasonHistoryEntity> items;
  final int total;
  final bool isLoadingMore;
  final Failure? failure;

  bool get hasMore => items.length < total;
}

final class SeasonHistoryFailedState extends SeasonHistoryState {
  const SeasonHistoryFailedState(this.failure);

  final Failure failure;
}

class SeasonHistoryNotifier extends StateNotifier<SeasonHistoryState> {
  SeasonHistoryNotifier({required LeaderboardRepository repository})
      : _repository = repository,
        super(const SeasonHistoryLoadingState()) {
    fetch();
  }

  static const _pageSize = 20;
  final LeaderboardRepository _repository;

  Future<void> fetch() async {
    state = const SeasonHistoryLoadingState();
    final result = await _repository.fetchSeasonHistory(
      limit: _pageSize,
      offset: 0,
    );
    switch (result) {
      case ResultOk(data: final page):
        state = SeasonHistoryDataState(items: page.items, total: page.total);
      case ResultFailed(error: final failure):
        state = SeasonHistoryFailedState(failure);
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! SeasonHistoryDataState ||
        current.isLoadingMore ||
        !current.hasMore) {
      return;
    }
    state = SeasonHistoryDataState(
      items: current.items,
      total: current.total,
      isLoadingMore: true,
    );
    final result = await _repository.fetchSeasonHistory(
      limit: _pageSize,
      offset: current.items.length,
    );
    switch (result) {
      case ResultOk(data: final page):
        state = SeasonHistoryDataState(
          items: [...current.items, ...page.items],
          total: page.total,
        );
      case ResultFailed(error: final failure):
        state = SeasonHistoryDataState(
          items: current.items,
          total: current.total,
          failure: failure,
        );
    }
  }
}
