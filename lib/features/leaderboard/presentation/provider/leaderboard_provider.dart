import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';
import 'package:quiz/features/leaderboard/presentation/provider/leaderboard_state.dart';

export 'leaderboard_state.dart';

final leaderboardProvider = StateNotifierProvider<LeaderboardNotifier, BaseState<LeaderboardData>>(
  (ref) => LeaderboardNotifier(
    repository: getIt<LeaderboardRepository>(),
  ),
);

class LeaderboardNotifier extends StateNotifier<BaseState<LeaderboardData>> {
  final LeaderboardRepository _repository;

  LeaderboardNotifier({required LeaderboardRepository repository})
      : _repository = repository,
        super(BaseState.loading()) {
    fetch(LeaderboardPeriod.daily);
  }

  Future<void> fetch(LeaderboardPeriod period) async {
    state = BaseState.loading();

    final results = await Future.wait([
      _repository.fetchBoard(period),
      _repository.fetchMyEntry(period),
    ]);

    final boardResult = results[0] as Result;
    final myResult = results[1] as Result;

    switch (boardResult) {
      case ResultOk(data: final page):
        state = BaseState.data(
          LeaderboardData(
            period: period,
            entries: page.items,
            myEntry: switch (myResult) {
              ResultOk(data: final entry) => entry,
              ResultFailed() => null,
            },
          ),
        );
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }

  void changePeriod(LeaderboardPeriod period) {
    final current = state;
    if (current is BaseDataState<LeaderboardData> && current.data.period == period) {
      return;
    }
    fetch(period);
  }
}
