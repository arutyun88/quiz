import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/fetch_current_user_gateway.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

part 'authentication_state.dart';
part 'authentication_provider.freezed.dart';

final authenticationProvider = StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) => AuthenticationNotifier(
    authenticationRepository: getIt<AuthenticationRepository>(),
    userRepository: getIt<UserRepository>(),
    fetchCurrentUserGateway: getIt<FetchCurrentUserGateway>(),
  ),
);

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  final FetchCurrentUserGateway _fetchCurrentUserGateway;

  AuthenticationNotifier({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
    required FetchCurrentUserGateway fetchCurrentUserGateway,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        _fetchCurrentUserGateway = fetchCurrentUserGateway,
        super(const AuthenticationState.unauthenticated());

  Future<void> reload() async {
    final aResult = _authenticationRepository.reload();
    final aState = switch (aResult) {
      ResultOk(data: final id) => AuthenticationState.authenticated(id: id),
      ResultFailed(error: final failure) => AuthenticationState.unauthenticated(failure: failure),
    };

    if (aState case _UserAuthenticatedState authState) {
      final userResult = await _fetchCurrentUserGateway.call(authState.id);

      if (userResult case ResultOk(data: final user)) {
        state = authState.copyWith(user: user);
        return;
      }
    }
    state = aState;
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final aResult = await _authenticationRepository.signInWithEmail(email: email, password: password);
    final aState = switch (aResult) {
      ResultOk(data: final id) => AuthenticationState.authenticated(id: id),
      ResultFailed(error: final failure) => AuthenticationState.unauthenticated(failure: failure),
    };

    if (aState case _UserAuthenticatedState authState) {
      final userResult = await _fetchCurrentUserGateway.call(authState.id);

      if (userResult case ResultOk(data: final user)) {
        state = authState.copyWith(user: user);
        return;
      }
    }
    state = aState;
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
  }) async {
    final aResult = await _authenticationRepository.registerWithEmail(email: email, password: password);
    final aState = switch (aResult) {
      ResultOk(data: final id) => AuthenticationState.authenticated(id: id),
      ResultFailed(error: final failure) => AuthenticationState.unauthenticated(failure: failure),
    };

    if (aState case _UserAuthenticatedState authState) {
      await _userRepository.createUser(UserEntity(id: authState.id, email: email, name: null, birthDate: null));

      final userResult = await _fetchCurrentUserGateway.call(authState.id);

      if (userResult case ResultOk(data: final user)) {
        state = authState.copyWith(user: user);
        return;
      }
    }
    state = aState;
  }

  void logout() {
    _authenticationRepository.logout();
    state = const AuthenticationState.unauthenticated();
  }
}
