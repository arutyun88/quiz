import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/unauthorized_event_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/fetch_current_user_gateway.dart';
import 'package:quiz/features/user/domain/repository/sign_in_with_email_gateway.dart';
import 'package:quiz/features/user/domain/repository/sign_up_with_email_gateway.dart';
import 'package:quiz/features/user/domain/repository/user_logout_gateway.dart';

part 'authentication_state.dart';
part 'authentication_provider.freezed.dart';

final authenticationProvider = StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) {
    final notifier = AuthenticationNotifier(
      tokenService: getIt<AuthTokenService>(),
      fetchCurrentUserGateway: getIt<FetchCurrentUserGateway>(),
      signInWithEmailGateway: getIt<SignInWithEmailGateway>(),
      signUpWithEmailGateway: getIt<SignUpWithEmailGateway>(),
      userLogoutGateway: getIt<UserLogoutGateway>(),
      unauthorizedEventService: getIt<UnauthorizedEventService>(),
    );
    ref.onDispose(() => notifier.dispose());
    return notifier;
  },
);

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  final AuthTokenService _tokenService;
  final FetchCurrentUserGateway _fetchCurrentUserGateway;
  final SignInWithEmailGateway _signInWithEmailGateway;
  final SignUpWithEmailGateway _signUpWithEmailGateway;
  final UserLogoutGateway _userLogoutGateway;
  final UnauthorizedEventService _unauthorizedEventService;
  StreamSubscription<void>? _unauthorizedSubscription;

  AuthenticationNotifier({
    required AuthTokenService tokenService,
    required FetchCurrentUserGateway fetchCurrentUserGateway,
    required SignInWithEmailGateway signInWithEmailGateway,
    required SignUpWithEmailGateway signUpWithEmailGateway,
    required UserLogoutGateway userLogoutGateway,
    required UnauthorizedEventService unauthorizedEventService,
  })  : _tokenService = tokenService,
        _fetchCurrentUserGateway = fetchCurrentUserGateway,
        _signInWithEmailGateway = signInWithEmailGateway,
        _signUpWithEmailGateway = signUpWithEmailGateway,
        _userLogoutGateway = userLogoutGateway,
        _unauthorizedEventService = unauthorizedEventService,
        super(const AuthenticationState.unauthenticated()) {
    _unauthorizedSubscription = _unauthorizedEventService.stream.listen(
      (_) => state = const AuthenticationState.unauthenticated(),
    );
  }

  @override
  void dispose() {
    _unauthorizedSubscription?.cancel();
    super.dispose();
  }

  Future<void> reload() async {
    if (_tokenService.accessToken != null) {
      final result = await _fetchCurrentUserGateway.call();

      state = switch (result) {
        ResultOk(data: final user) => AuthenticationState.authenticated(user: user),
        ResultFailed(error: final failure) => AuthenticationState.unauthenticated(failure: failure),
      };
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _signInWithEmailGateway.call(email: email, password: password);

    final result = await _fetchCurrentUserGateway.call();

    state = switch (result) {
      ResultOk(data: final user) => AuthenticationState.authenticated(user: user),
      ResultFailed(error: final failure) => AuthenticationState.unauthenticated(failure: failure),
    };
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
  }) async {
    await _signUpWithEmailGateway.call(email: email, password: password);

    final result = await _fetchCurrentUserGateway.call();

    state = switch (result) {
      ResultOk(data: final user) => AuthenticationState.authenticated(user: user),
      ResultFailed(error: final failure) => AuthenticationState.unauthenticated(failure: failure),
    };
  }

  void logout() async {
    await _userLogoutGateway.call();
    state = const AuthenticationState.unauthenticated();
  }
}
