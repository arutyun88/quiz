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
import 'package:quiz/features/user/domain/repository/user_repository.dart';
import 'package:quiz/features/subscription/domain/gateway/quiz_plus_purchase_gateway.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';

part 'authentication_provider.freezed.dart';
part 'authentication_state.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) {
    final notifier = AuthenticationNotifier(
      tokenService: getIt<AuthTokenService>(),
      fetchCurrentUserGateway: getIt<FetchCurrentUserGateway>(),
      signInWithEmailGateway: getIt<SignInWithEmailGateway>(),
      signUpWithEmailGateway: getIt<SignUpWithEmailGateway>(),
      userLogoutGateway: getIt<UserLogoutGateway>(),
      userRepository: getIt<UserRepository>(),
      unauthorizedEventService: getIt<UnauthorizedEventService>(),
      quizPlusPurchaseGateway: getIt<QuizPlusPurchaseGateway>(),
      pushNotificationsGateway: getIt<PushNotificationsGateway>(),
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
  final UserRepository _userRepository;
  final UnauthorizedEventService _unauthorizedEventService;
  final QuizPlusPurchaseGateway _quizPlusPurchaseGateway;
  final PushNotificationsGateway _pushNotificationsGateway;
  StreamSubscription<void>? _unauthorizedSubscription;

  AuthenticationNotifier({
    required AuthTokenService tokenService,
    required FetchCurrentUserGateway fetchCurrentUserGateway,
    required SignInWithEmailGateway signInWithEmailGateway,
    required SignUpWithEmailGateway signUpWithEmailGateway,
    required UserLogoutGateway userLogoutGateway,
    required UserRepository userRepository,
    required UnauthorizedEventService unauthorizedEventService,
    required QuizPlusPurchaseGateway quizPlusPurchaseGateway,
    required PushNotificationsGateway pushNotificationsGateway,
  })  : _tokenService = tokenService,
        _fetchCurrentUserGateway = fetchCurrentUserGateway,
        _signInWithEmailGateway = signInWithEmailGateway,
        _signUpWithEmailGateway = signUpWithEmailGateway,
        _userLogoutGateway = userLogoutGateway,
        _userRepository = userRepository,
        _unauthorizedEventService = unauthorizedEventService,
        _quizPlusPurchaseGateway = quizPlusPurchaseGateway,
        _pushNotificationsGateway = pushNotificationsGateway,
        super(const AuthenticationState.unauthenticated()) {
    _unauthorizedSubscription = _unauthorizedEventService.stream.listen(
      (_) {
        unawaited(_clearBillingIdentity());
        unawaited(_pushNotificationsGateway.deactivate());
        state = const AuthenticationState.unauthenticated();
      },
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
        ResultOk(data: final user) =>
          AuthenticationState.authenticated(user: user),
        ResultFailed(error: final failure) =>
          AuthenticationState.unauthenticated(failure: failure),
      };
    }
  }

  /// Accepts a freshly fetched own profile so the auth state stays the single
  /// source of truth for the current user (entitlement, name, subscription).
  void updateUser(UserEntity user) {
    state = AuthenticationState.authenticated(user: user);
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _signInWithEmailGateway.call(email: email, password: password);

    final result = await _fetchCurrentUserGateway.call();

    state = switch (result) {
      ResultOk(data: final user) =>
        AuthenticationState.authenticated(user: user),
      ResultFailed(error: final failure) =>
        AuthenticationState.unauthenticated(failure: failure),
    };
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
    required DateTime birthDate,
    String? name,
  }) async {
    await _signUpWithEmailGateway.call(
      email: email,
      password: password,
      birthDate: birthDate,
      name: name,
    );

    final result = await _fetchCurrentUserGateway.call();

    state = switch (result) {
      ResultOk(data: final user) =>
        AuthenticationState.authenticated(user: user),
      ResultFailed(error: final failure) =>
        AuthenticationState.unauthenticated(failure: failure),
    };
  }

  Future<void> logout() async {
    await _pushNotificationsGateway.unregister();
    await _userLogoutGateway.call();
    await _clearBillingIdentity();
    state = const AuthenticationState.unauthenticated();
  }

  Future<bool> deleteAccount() async {
    await _pushNotificationsGateway.unregister();
    final result = await _userRepository.deleteAccount();

    switch (result) {
      case ResultOk():
        await _userLogoutGateway.call();
        await _clearBillingIdentity();
        state = const AuthenticationState.unauthenticated();
        return true;
      case ResultFailed():
        await _pushNotificationsGateway.activate();
        return false;
    }
  }

  Future<void> _clearBillingIdentity() async {
    try {
      await _quizPlusPurchaseGateway.clearIdentity();
    } catch (_) {
      // Billing cleanup must never keep the user signed in locally.
    }
  }
}
