import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, BaseState<UserEntity>>(
  (ref) => ProfileNotifier(
    repository: getIt<UserRepository>(),
    onProfileLoaded: (profile) => ref.read(authenticationProvider.notifier).updateUser(profile),
  ),
);

class ProfileNotifier extends StateNotifier<BaseState<UserEntity>> {
  final UserRepository _repository;
  final void Function(UserEntity profile)? _onProfileLoaded;

  ProfileNotifier({
    required UserRepository repository,
    void Function(UserEntity profile)? onProfileLoaded,
  })  : _repository = repository,
        _onProfileLoaded = onProfileLoaded,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = BaseState.loading();
    await refresh();
  }

  Future<void> refresh() async {
    final result = await _repository.fetch();

    switch (result) {
      case ResultOk(data: final profile):
        state = BaseState.data(profile);
        _onProfileLoaded?.call(profile);
      case ResultFailed(error: final failure):
        if (state is! BaseDataState<UserEntity>) {
          state = BaseState.failed(failure);
        }
    }
  }
}

/// Another user's public profile (Б5), by userId.
final publicProfileProvider =
    StateNotifierProvider.autoDispose.family<PublicProfileNotifier, BaseState<UserEntity>, String>(
  (ref, userId) => PublicProfileNotifier(
    repository: getIt<UserRepository>(),
    userId: userId,
  ),
);

class PublicProfileNotifier extends StateNotifier<BaseState<UserEntity>> {
  final UserRepository _repository;
  final String _userId;

  PublicProfileNotifier({
    required UserRepository repository,
    required String userId,
  })  : _repository = repository,
        _userId = userId,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = BaseState.loading();

    final result = await _repository.fetchUser(_userId);

    switch (result) {
      case ResultOk(data: final profile):
        state = BaseState.data(profile);
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }
}
