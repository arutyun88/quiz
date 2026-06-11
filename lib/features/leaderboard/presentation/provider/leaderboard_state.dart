import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardData with _$LeaderboardData {
  const factory LeaderboardData({
    required LeaderboardPeriod period,
    required List<LeaderboardEntity> entries,
    LeaderboardEntity? myEntry,
  }) = _LeaderboardData;
}

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
  final Map<LeaderboardPeriod, BaseState<LeaderboardData>> periodStates;

  BaseState<LeaderboardData> stateFor(LeaderboardPeriod period) {
    return periodStates[period] ?? BaseState.loading();
  }

  LeaderboardState copyWith({
    LeaderboardPeriod? currentPeriod,
    Map<LeaderboardPeriod, BaseState<LeaderboardData>>? periodStates,
  }) {
    return LeaderboardState(
      currentPeriod: currentPeriod ?? this.currentPeriod,
      periodStates: periodStates ?? this.periodStates,
    );
  }

  LeaderboardState updatePeriod(
    LeaderboardPeriod period,
    BaseState<LeaderboardData> periodState,
  ) {
    return copyWith(
      periodStates: {
        ...periodStates,
        period: periodState,
      },
    );
  }
}
