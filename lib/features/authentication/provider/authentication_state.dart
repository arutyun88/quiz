part of 'authentication_provider.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  const factory AuthenticationState.authenticated({
    required String id,
  }) = _UserAuthenticatedState;

  const factory AuthenticationState.unauthenticated({
    Failure? failure,
  }) = _UserUnauthenticatedState;

  bool get isAuthenticated => this is _UserAuthenticatedState;
}
