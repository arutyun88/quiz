import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

part 'authentication_state.dart';
part 'authentication_provider.freezed.dart';

final authenticationProvider = StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) => AuthenticationNotifier(
    authenticationRepository: getIt<AuthenticationRepository>(),
  ),
);

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationNotifier({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unauthenticated());

  void reload() {
    final result = _authenticationRepository.reload();

    state = switch (result) {
      ResultOk(data: final id) => AuthenticationState.authenticated(id: id),
      ResultFailed() => const AuthenticationState.unauthenticated(),
    };
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async =>
      _handleResult(
        await _authenticationRepository.signInWithEmail(email: email, password: password),
      );

  Future<void> registerWithEmail({
    required String email,
    required String password,
  }) async =>
      _handleResult(
        await _authenticationRepository.registerWithEmail(email: email, password: password),
      );

  void logout() {
    _authenticationRepository.logout();
    state = const AuthenticationState.unauthenticated();
  }

  void _handleResult(Result<String, Failure> result) {
    state = switch (result) {
      ResultOk(data: final id) => AuthenticationState.authenticated(id: id),
      ResultFailed(error: final failure) => AuthenticationState.unauthenticated(failure: failure),
    };
  }
}
