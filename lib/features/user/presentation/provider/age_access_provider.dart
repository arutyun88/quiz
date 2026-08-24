import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/age_access_repository.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';

final ageAccessProvider =
    StateNotifierProvider<AgeAccessNotifier, AgeAccessState>((ref) {
  UserEntity? currentUser() => ref
      .read(authenticationProvider)
      .mapOrNull(authenticated: (state) => state.user);

  return AgeAccessNotifier(
    repository: getIt<AgeAccessRepository>(),
    localUserRepository: getIt<LocalUserRepository>(),
    currentUser: currentUser,
    updateUser: ref.read(authenticationProvider.notifier).updateUser,
  )..refresh();
});

final class AgeAccessState {
  const AgeAccessState({
    this.status,
    this.isLoading = false,
    this.isFresh = false,
    this.failure,
  });

  final AgeAccessEntity? status;
  final bool isLoading;

  /// True only after this process has received the status from the server.
  /// A cached status is informational and must not authorize adult content.
  final bool isFresh;
  final Failure? failure;
}

class AgeAccessNotifier extends StateNotifier<AgeAccessState> {
  AgeAccessNotifier({
    required AgeAccessRepository repository,
    required LocalUserRepository localUserRepository,
    required UserEntity? Function() currentUser,
    required void Function(UserEntity user) updateUser,
  })  : _repository = repository,
        _localUserRepository = localUserRepository,
        _currentUser = currentUser,
        _updateUser = updateUser,
        super(AgeAccessState(status: currentUser()?.ageAccess));

  final AgeAccessRepository _repository;
  final LocalUserRepository _localUserRepository;
  final UserEntity? Function() _currentUser;
  final void Function(UserEntity user) _updateUser;

  Future<bool> refresh() => _refresh();

  Future<void> confirm() async {
    if (!await _refresh()) return;

    final status = state.status;
    if (status == null || status.currentPolicyVersion.isEmpty) return;

    final result = await _repository.confirm(
      policyVersion: status.currentPolicyVersion,
    );
    await _handleMutationResult(result);
  }

  Future<void> revoke() async {
    if (_currentUser() == null) {
      state = const AgeAccessState();
      return;
    }

    final result = await _repository.revoke();
    await _handleMutationResult(result);
  }

  Future<bool> _refresh({Failure? mutationFailure}) async {
    final user = _currentUser();
    if (user == null) {
      state = const AgeAccessState();
      return false;
    }

    state = AgeAccessState(
      status: state.status ?? user.ageAccess,
      isLoading: true,
      isFresh: false,
      failure: mutationFailure,
    );

    final result = await _repository.fetch();
    return switch (result) {
      ResultOk(data: final status) => await _applyServerStatus(
          status,
          failure: mutationFailure,
        ),
      ResultFailed(error: final failure) => _setRefreshFailure(
          mutationFailure ?? failure,
        ),
    };
  }

  Future<void> _handleMutationResult(
    Result<AgeAccessEntity, Failure> result,
  ) async {
    switch (result) {
      case ResultOk(data: final status):
        await _applyServerStatus(status);
      case ResultFailed(error: final failure):
        if (_requiresStatusRefresh(failure)) {
          await _refresh(mutationFailure: failure);
        } else {
          state = AgeAccessState(
            status: state.status,
            isFresh: state.isFresh,
            failure: failure,
          );
        }
    }
  }

  Future<bool> _applyServerStatus(
    AgeAccessEntity status, {
    Failure? failure,
  }) async {
    final user = _currentUser();
    if (user == null) {
      state = const AgeAccessState();
      return false;
    }

    final updatedUser = user.copyWith(ageAccess: status);
    try {
      await _localUserRepository.saveUser(updatedUser);
    } on Object catch (error) {
      state = AgeAccessState(
        status: state.status,
        failure: Failure.unknown(error),
      );
      return false;
    }

    if (_currentUser()?.id != user.id) {
      state = const AgeAccessState();
      return false;
    }

    _updateUser(updatedUser);
    state = AgeAccessState(
      status: status,
      isFresh: true,
      failure: failure,
    );
    return true;
  }

  bool _setRefreshFailure(Failure failure) {
    state = AgeAccessState(
      status: state.status,
      failure: failure,
    );
    return false;
  }
}

bool _requiresStatusRefresh(Failure failure) => switch (failure) {
      NetworkFailure(
        reason: NetworkFailureBadResponseReason(statusCode: final statusCode),
      )
          when statusCode == 403 || statusCode == 409 =>
        true,
      _ => false,
    };
