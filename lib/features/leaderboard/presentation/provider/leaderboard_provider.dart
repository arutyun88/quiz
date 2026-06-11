import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';
import 'package:quiz/features/leaderboard/presentation/provider/leaderboard_state.dart';

export 'leaderboard_state.dart';

final leaderboardProvider = StateNotifierProvider<LeaderboardNotifier, LeaderboardState>(
  (ref) => LeaderboardNotifier(
    repository: getIt<LeaderboardRepository>(),
  ),
);

class LeaderboardNotifier extends StateNotifier<LeaderboardState> {
  final LeaderboardRepository _repository;

  LeaderboardNotifier({required LeaderboardRepository repository})
      : _repository = repository,
        super(LeaderboardState.initial()) {
    fetch(LeaderboardPeriod.daily);
    _preloadAdjacent(LeaderboardPeriod.daily);
  }

  Future<void> fetch(LeaderboardPeriod period) async {
    state = state.updatePeriod(period, BaseState.loading());

    final results = await Future.wait([
      _repository.fetchBoard(period),
      _repository.fetchMyEntry(period),
    ]);

    final boardResult = results[0] as Result;
    final myResult = results[1] as Result;

    switch (boardResult) {
      case ResultOk(data: final page):
        state = state.updatePeriod(
          period,
          BaseState.data(
            LeaderboardData(
              period: period,
              entries: page.items,
              myEntry: switch (myResult) {
                ResultOk(data: final entry) => entry,
                ResultFailed() => null,
              },
            ),
          ),
        );
      case ResultFailed(error: final failure):
        state = state.updatePeriod(period, BaseState.failed(failure));
    }
  }

  void changePeriod(LeaderboardPeriod period) {
    state = state.copyWith(currentPeriod: period);

    final periodState = state.periodStates[period];
    final shouldFetch = periodState == null || periodState is BaseFailedState<LeaderboardData>;

    if (shouldFetch) fetch(period);

    _preloadAdjacent(period);
  }

  void _preloadAdjacent(LeaderboardPeriod period) {
    final index = LeaderboardPeriod.values.indexOf(period);
    final previousIndex = index - 1;
    final nextIndex = index + 1;

    if (previousIndex >= 0) {
      _fetchIfMissing(LeaderboardPeriod.values[previousIndex]);
    }
    if (nextIndex < LeaderboardPeriod.values.length) {
      _fetchIfMissing(LeaderboardPeriod.values[nextIndex]);
    }
  }

  void _fetchIfMissing(LeaderboardPeriod period) {
    if (state.periodStates.containsKey(period)) return;
    fetch(period);
  }
}
