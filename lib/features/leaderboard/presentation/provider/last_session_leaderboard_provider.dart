import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

final lastSessionLeaderboardProvider =
    StateNotifierProvider<LastSessionLeaderboardNotifier, BaseState<LeaderboardEntity?>>(
  (ref) => LastSessionLeaderboardNotifier(
    repository: getIt<LeaderboardRepository>(),
  ),
);

class LastSessionLeaderboardNotifier extends StateNotifier<BaseState<LeaderboardEntity?>> {
  final LeaderboardRepository _repository;

  LastSessionLeaderboardNotifier({
    required LeaderboardRepository repository,
  })  : _repository = repository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    final result = await _repository.fetchMyLastPeriodEntry(LeaderboardPeriod.daily);

    switch (result) {
      case ResultOk(data: final entry):
        state = BaseState.data(entry);

      case ResultFailed():
        state = BaseState.data(null);
    }
  }
}
