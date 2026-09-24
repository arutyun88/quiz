import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, BaseState<UserEntity>>(
  (ref) {
    final notifier = ProfileNotifier(
      repository: getIt<UserRepository>(),
      onProfileLoaded: (profile) =>
          ref.read(authenticationProvider.notifier).updateUser(profile),
    );
    ref.listen(
      gamificationProvider,
      (_, state) => notifier.updateGamification(
        state.whenOrNull(data: (data) => data),
      ),
      fireImmediately: true,
    );
    return notifier;
  },
);

class ProfileNotifier extends StateNotifier<BaseState<UserEntity>> {
  final UserRepository _repository;
  final void Function(UserEntity profile)? _onProfileLoaded;
  UserLevelEntity? _gamification;
  Future<void>? _pendingFetch;

  ProfileNotifier({
    required UserRepository repository,
    void Function(UserEntity profile)? onProfileLoaded,
  })  : _repository = repository,
        _onProfileLoaded = onProfileLoaded,
        super(BaseState.loading());

  Future<void> fetch() {
    final pendingFetch = _pendingFetch;
    if (pendingFetch != null) return pendingFetch;
    if (state is! BaseFailedState<UserEntity>) {
      state = BaseState.loading();
    }
    return _startFetch();
  }

  Future<void> refresh() => _startFetch();

  Future<void> _startFetch() => _pendingFetch ??= _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<void> _fetch() async {
    final result = await _repository.fetch();

    switch (result) {
      case ResultOk(data: final profile):
        _setProfile(profile);
      case ResultFailed(error: final failure):
        if (state is! BaseDataState<UserEntity>) {
          state = BaseState.failed(failure);
        }
    }
  }

  void updateGamification(UserLevelEntity? gamification) {
    if (gamification == null) return;
    _gamification = gamification;
    if (state case BaseDataState<UserEntity>(:final data)) {
      _setProfile(data);
    }
  }

  void _setProfile(UserEntity profile) {
    final gamification = _gamification;
    final merged = gamification == null
        ? profile
        : profile.copyWith(
            level: gamification.level,
            experienceInLevel:
                gamification.experienceInLevel ?? profile.experienceInLevel,
            levelExperience:
                gamification.levelExperience ?? profile.levelExperience,
            streakDays: gamification.streakDays,
            bestStreakDays:
                gamification.bestStreakDays ?? profile.bestStreakDays,
            questionsAnswered: gamification.questionsAnswered,
            correctAnswers: gamification.correctAnswers,
            accuracy: gamification.accuracy,
            totalPoints: gamification.totalPoints,
          );
    state = BaseState.data(merged);
    _onProfileLoaded?.call(merged);
  }
}

/// Another user's public profile (Б5), by userId.
final publicProfileProvider = StateNotifierProvider.autoDispose
    .family<PublicProfileNotifier, BaseState<UserEntity>, String>(
  (ref, userId) => PublicProfileNotifier(
    repository: getIt<UserRepository>(),
    userId: userId,
  ),
);

class PublicProfileNotifier extends StateNotifier<BaseState<UserEntity>> {
  final UserRepository _repository;
  final String _userId;
  Future<void>? _pendingFetch;

  PublicProfileNotifier({
    required UserRepository repository,
    required String userId,
  })  : _repository = repository,
        _userId = userId,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() {
    final pendingFetch = _pendingFetch;
    if (pendingFetch != null) return pendingFetch;
    if (state is! BaseFailedState<UserEntity>) {
      state = BaseState.loading();
    }
    return _pendingFetch ??= _fetch().whenComplete(
      () => _pendingFetch = null,
    );
  }

  Future<void> _fetch() async {
    final result = await _repository.fetchUser(_userId);

    switch (result) {
      case ResultOk(data: final profile):
        state = BaseState.data(profile);
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }
}
