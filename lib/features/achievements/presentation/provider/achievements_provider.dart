import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/domain/repository/user_achievement_repository.dart';

final achievementsProvider = StateNotifierProvider<AchievementsNotifier,
    BaseState<PageEntity<UserAchievementEntity>>>(
  (ref) => AchievementsNotifier(
    userAchievementRepository: getIt<UserAchievementRepository>(),
  ),
);

class AchievementsNotifier
    extends StateNotifier<BaseState<PageEntity<UserAchievementEntity>>> {
  final UserAchievementRepository _userAchievementRepository;
  Future<bool>? _pendingFetch;

  AchievementsNotifier({
    required UserAchievementRepository userAchievementRepository,
  })  : _userAchievementRepository = userAchievementRepository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<bool> fetch() => _pendingFetch ??= _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<bool> refresh() => fetch();

  Future<bool> _fetch() async {
    final previousState = state;

    final result = await _userAchievementRepository.fetch();

    switch (result) {
      case ResultOk(data: final achievements):
        state = BaseState.data(achievements);
        return true;

      case ResultFailed(error: final failure):
        if (previousState is! BaseDataState) {
          state = BaseState.failed(failure);
        }
        return false;
    }
  }
}

final publicAchievementsProvider = StateNotifierProvider.autoDispose.family<
    PublicAchievementsNotifier,
    BaseState<PageEntity<UserAchievementEntity>>,
    String>(
  (ref, userId) => PublicAchievementsNotifier(
    userAchievementRepository: getIt<UserAchievementRepository>(),
    userId: userId,
  ),
);

class PublicAchievementsNotifier
    extends StateNotifier<BaseState<PageEntity<UserAchievementEntity>>> {
  final UserAchievementRepository _userAchievementRepository;
  final String _userId;
  Future<bool>? _pendingFetch;

  PublicAchievementsNotifier({
    required UserAchievementRepository userAchievementRepository,
    required String userId,
  })  : _userAchievementRepository = userAchievementRepository,
        _userId = userId,
        super(BaseState.loading()) {
    fetch();
  }

  Future<bool> fetch() {
    final pendingFetch = _pendingFetch;
    if (pendingFetch != null) return pendingFetch;
    return _startFetch();
  }

  Future<bool> _startFetch() => _pendingFetch = _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<bool> _fetch() async {
    final previousState = state;

    final result = await _userAchievementRepository.fetchByUserId(_userId);

    switch (result) {
      case ResultOk(data: final achievements):
        state = BaseState.data(achievements);
        return true;
      case ResultFailed(error: final failure):
        if (previousState is! BaseDataState) {
          state = BaseState.failed(failure);
        }
        return false;
    }
  }
}
