import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

final leaderboardProvider = StateNotifierProvider<LeaderboardNotifier,
    BaseState<LeaderboardOverviewEntity>>(
  (ref) => LeaderboardNotifier(
    repository: getIt<LeaderboardRepository>(),
  ),
);

class LeaderboardNotifier
    extends StateNotifier<BaseState<LeaderboardOverviewEntity>> {
  final LeaderboardRepository _repository;

  LeaderboardNotifier({required LeaderboardRepository repository})
      : _repository = repository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = BaseState.loading();

    final result = await _repository.fetchCurrentSeason();

    switch (result) {
      case ResultOk(data: final overview):
        state = BaseState.data(overview);
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }
}
