import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';

class LeaderboardState {
  const LeaderboardState({
    required this.currentPeriod,
    required this.periodStates,
  });

  factory LeaderboardState.initial() => LeaderboardState(
        currentPeriod: LeaderboardPeriod.daily,
        periodStates: {
          LeaderboardPeriod.daily: BaseState.loading(),
        },
      );

  final LeaderboardPeriod currentPeriod;
  final Map<LeaderboardPeriod, BaseState<LeaderboardOverviewEntity>> periodStates;

  BaseState<LeaderboardOverviewEntity> stateFor(LeaderboardPeriod period) {
    return periodStates[period] ?? BaseState.loading();
  }

  LeaderboardState copyWith({
    LeaderboardPeriod? currentPeriod,
    Map<LeaderboardPeriod, BaseState<LeaderboardOverviewEntity>>? periodStates,
  }) {
    return LeaderboardState(
      currentPeriod: currentPeriod ?? this.currentPeriod,
      periodStates: periodStates ?? this.periodStates,
    );
  }

  LeaderboardState updatePeriod(
    LeaderboardPeriod period,
    BaseState<LeaderboardOverviewEntity> periodState,
  ) {
    return copyWith(
      periodStates: {
        ...periodStates,
        period: periodState,
      },
    );
  }
}
