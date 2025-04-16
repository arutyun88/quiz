import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

@LazySingleton()
class UserLogoutGateway {
  final AuthenticationRepository _authenticationRepository;
  final AuthTokenService _tokenService;

  UserLogoutGateway({
    required AuthenticationRepository authenticationRepository,
    required AuthTokenService tokenService,
  })  : _authenticationRepository = authenticationRepository,
        _tokenService = tokenService;

  Future<void> call() async {
    await _tokenService.clean();
    _authenticationRepository.logout();
  }
}
