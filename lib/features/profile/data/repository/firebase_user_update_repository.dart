import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/profile/domain/repository/user_update_repository.dart';

class FirebaseUserUpdateRepository implements UserUpdateRepository {
  const FirebaseUserUpdateRepository({
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;
  @override
  Future<Result<void, Failure>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user case User user) {
        if (user.email case String email) {
          await user.reauthenticateWithCredential(
            EmailAuthProvider.credential(email: email, password: oldPassword),
          );
          await _auth.currentUser?.updatePassword(newPassword);
          return const Result.ok(null);
        }
      }

      return const Result.failed(AuthenticationFailure(AuthenticationFailureType.data));
    } on FirebaseAuthException catch (e) {
      return Result.failed(Failure.authentication(_mapAuthenticationExceptionCode(e.code)));
    }
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
