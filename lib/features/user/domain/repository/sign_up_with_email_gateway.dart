import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/auth_tokens.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

@LazySingleton()
class SignUpWithEmailGateway {
  final AuthenticationRepository _authenticationRepository;
  final AuthTokenService _tokenService;

  SignUpWithEmailGateway({
    required AuthenticationRepository authenticationRepository,
    required AuthTokenService tokenService,
  })  : _authenticationRepository = authenticationRepository,
        _tokenService = tokenService;

  Future<Result<void, Failure>> call({
    required String email,
    required String password,
    required DateTime birthDate,
    String? name,
  }) async {
    final result = await _authenticationRepository.registerWithEmail(
      email: email,
      password: password,
      birthDate: birthDate,
      name: name,
    );

    switch (result) {
      case ResultOk(data: final tokens):
        await _tokenService.save(
          AuthTokens(
            accessToken: tokens.accessToken,
          ),
        );
        return const Result.ok(null);
      case ResultFailed(error: final failure):
        return Result.failed(failure);
    }
  }
}
