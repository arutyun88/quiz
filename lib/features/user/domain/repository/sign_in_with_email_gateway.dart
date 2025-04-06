import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/auth_tokens.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

@LazySingleton()
class SignInWithEmailGateway {
  final AuthenticationRepository _authenticationRepository;
  final AuthTokenService _tokenService;

  SignInWithEmailGateway({
    required AuthenticationRepository authenticationRepository,
    required AuthTokenService tokenService,
  })  : _authenticationRepository = authenticationRepository,
        _tokenService = tokenService;

  Future<Result<void, Failure>> call({
    required String email,
    required String password,
  }) async {
    final result = await _authenticationRepository.signInWithEmail(
      email: email,
      password: password,
    );

    switch (result) {
      case ResultOk(data: final tokens):
        await _tokenService.save(
          AuthTokens(
            accessToken: tokens.accessToken,
            refreshToken: tokens.refreshToken,
          ),
        );
        return const Result.ok(null);
      case ResultFailed(error: final failure):
        return Result.failed(failure);
    }
  }
}
