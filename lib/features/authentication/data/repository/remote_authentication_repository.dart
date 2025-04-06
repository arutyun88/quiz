import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/authentication/data/converter/token_converter.dart';
import 'package:quiz/features/authentication/data/dto/token_dto.dart';
import 'package:quiz/features/authentication/domain/entity/token_entity.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

class RemoteAuthenticationRepository implements AuthenticationRepository {
  const RemoteAuthenticationRepository({
    required ApiClient client,
    required TokenConverter tokenConverter,
  })  : _client = client,
        _tokenConverter = tokenConverter;

  final ApiClient _client;
  final TokenConverter _tokenConverter;

  @override
  Future<Result<TokenEntity, Failure>> registerWithEmail({
    required String email,
    required String password,
  }) async =>
      await _client.post(
        '/auth/register',
        body: {
          "email": email,
          'password': password,
        },
        mapper: TokenDto.fromJson,
        converter: _tokenConverter.convert,
      );

  @override
  Future<Result<TokenEntity, Failure>> signInWithEmail({
    required String email,
    required String password,
  }) async =>
      await _client.post(
        '/auth/login',
        body: {
          "email": email,
          'password': password,
        },
        mapper: TokenDto.fromJson,
        converter: _tokenConverter.convert,
      );

  @override
  Future<void> logout() async {
    // await _auth.signOut();
  }

  @override
  Future<Result<void, Failure>> sendPasswordResetEmail(String email) async {
    // try {
    //   await _auth.sendPasswordResetEmail(
    //     email: email,
    //   );

    return const Result.ok(null);
    // } on FirebaseAuthException catch (e) {
    //   return Result.failed(Failure.authentication(_mapAuthenticationExceptionCode(e.code)));
    // }
  }

  _mapAuthenticationExceptionCode(String code) {
    return switch (code) {
      'invalid-credential' => AuthenticationFailureType.credentials,
      'too-many-requests' => AuthenticationFailureType.tooManyRequests,
      'email-already-in-use' => AuthenticationFailureType.alreadyExist,
      _ => AuthenticationFailureType.data,
    };
  }
}
