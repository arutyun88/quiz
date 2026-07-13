import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/domain/repository/user_achievement_repository.dart';

final achievementsProvider = StateNotifierProvider<AchievementsNotifier, BaseState<PageEntity<UserAchievementEntity>>>(
  (ref) => AchievementsNotifier(
    userAchievementRepository: getIt<UserAchievementRepository>(),
  ),
);

class AchievementsNotifier extends StateNotifier<BaseState<PageEntity<UserAchievementEntity>>> {
  final UserAchievementRepository _userAchievementRepository;

  AchievementsNotifier({
    required UserAchievementRepository userAchievementRepository,
  })  : _userAchievementRepository = userAchievementRepository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    final previousState = state;

    final result = await _userAchievementRepository.fetch();

    switch (result) {
      case ResultOk(data: final achievements):
        state = BaseState.data(achievements);

      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);

        if (previousState is BaseDataState) {
          state = previousState;
        }
    }
  }
}

final publicAchievementsProvider = StateNotifierProvider.autoDispose
    .family<PublicAchievementsNotifier, BaseState<PageEntity<UserAchievementEntity>>, String>(
  (ref, userId) => PublicAchievementsNotifier(
    userAchievementRepository: getIt<UserAchievementRepository>(),
    userId: userId,
  ),
);

class PublicAchievementsNotifier extends StateNotifier<BaseState<PageEntity<UserAchievementEntity>>> {
  final UserAchievementRepository _userAchievementRepository;
  final String _userId;

  PublicAchievementsNotifier({
    required UserAchievementRepository userAchievementRepository,
    required String userId,
  })  : _userAchievementRepository = userAchievementRepository,
        _userId = userId,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = BaseState.loading();

    final result = await _userAchievementRepository.fetchByUserId(_userId);

    switch (result) {
      case ResultOk(data: final achievements):
        state = BaseState.data(achievements);
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }
}
