import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/gamification/domain/repository/gamification_repository.dart';

final gamificationProvider = StateNotifierProvider<GamificationNotifier, BaseState<UserLevelEntity>>(
  (ref) => GamificationNotifier(
    gamificationRepository: getIt<GamificationRepository>(),
  ),
);

class GamificationNotifier extends StateNotifier<BaseState<UserLevelEntity>> {
  final GamificationRepository _gamificationRepository;

  GamificationNotifier({
    required GamificationRepository gamificationRepository,
  })  : _gamificationRepository = gamificationRepository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    final previousState = state;

    final result = await _gamificationRepository.fetchLevel();

    switch (result) {
      case ResultOk(data: final level):
        state = BaseState.data(level);

      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);

        if (previousState is BaseDataState) {
          state = previousState;
        }
    }
  }
}
