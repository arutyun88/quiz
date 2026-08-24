import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';
import 'package:quiz/features/user/domain/repository/user_logout_gateway.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockAuthTokenService extends Mock implements AuthTokenService {}

class _MockLocalUserRepository extends Mock implements LocalUserRepository {}

void main() {
  late _MockAuthenticationRepository authenticationRepository;
  late _MockAuthTokenService tokenService;
  late _MockLocalUserRepository localUserRepository;
  late UserLogoutGateway gateway;

  setUp(() {
    authenticationRepository = _MockAuthenticationRepository();
    tokenService = _MockAuthTokenService();
    localUserRepository = _MockLocalUserRepository();
    gateway = UserLogoutGateway(
      authenticationRepository: authenticationRepository,
      tokenService: tokenService,
      localUserRepository: localUserRepository,
    );

    when(() => authenticationRepository.logout()).thenAnswer((_) async {});
    when(() => tokenService.clean()).thenAnswer((_) async {});
    when(() => localUserRepository.clearUser()).thenAnswer((_) async {});
  });

  test('logout clears both credentials and the private cached profile',
      () async {
    await gateway.call();

    verify(() => authenticationRepository.logout()).called(1);
    verify(() => tokenService.clean()).called(1);
    verify(() => localUserRepository.clearUser()).called(1);
  });

  test('local credentials and profile are cleared when remote logout fails',
      () async {
    when(() => authenticationRepository.logout())
        .thenThrow(StateError('offline'));

    await expectLater(gateway.call(), throwsStateError);

    verify(() => tokenService.clean()).called(1);
    verify(() => localUserRepository.clearUser()).called(1);
  });
}
