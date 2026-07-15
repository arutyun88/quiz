import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/authentication/domain/entity/token_entity.dart';

abstract interface class AuthenticationRepository {
  Future<Result<TokenEntity, Failure>> registerWithEmail({
    required String email,
    required String password,
    required DateTime birthDate,
    String? name,
  });

  Future<Result<TokenEntity, Failure>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<Result<void, Failure>> sendPasswordResetEmail(String email);
}
