import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_timeline_entity.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

const timelineDays = 14;

final leaderboardTimelineProvider =
    StateNotifierProvider.autoDispose<LeaderboardTimelineNotifier, BaseState<LeaderboardTimelineEntity>>(
  (ref) => LeaderboardTimelineNotifier(leaderboardRepository: getIt<LeaderboardRepository>()),
);

class LeaderboardTimelineNotifier extends StateNotifier<BaseState<LeaderboardTimelineEntity>> {
  final LeaderboardRepository _leaderboardRepository;

  LeaderboardTimelineNotifier({
    required LeaderboardRepository leaderboardRepository,
  })  : _leaderboardRepository = leaderboardRepository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = BaseState.loading();

    final result = await _leaderboardRepository.fetchTimeline(days: timelineDays);

    switch (result) {
      case ResultOk(data: final timeline):
        state = BaseState.data(timeline);
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }
}
