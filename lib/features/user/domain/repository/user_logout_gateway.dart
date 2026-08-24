import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';

@LazySingleton()
class UserLogoutGateway {
  final AuthenticationRepository _authenticationRepository;
  final AuthTokenService _tokenService;
  final LocalUserRepository _localUserRepository;

  UserLogoutGateway({
    required AuthenticationRepository authenticationRepository,
    required AuthTokenService tokenService,
    required LocalUserRepository localUserRepository,
  })  : _authenticationRepository = authenticationRepository,
        _tokenService = tokenService,
        _localUserRepository = localUserRepository;

  Future<void> call() async {
    try {
      await _authenticationRepository.logout();
    } finally {
      await _tokenService.clean();
      await _localUserRepository.clearUser();
    }
  }
}
