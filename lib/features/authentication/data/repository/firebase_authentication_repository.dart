import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  const FirebaseAuthenticationRepository({
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  @override
  Result<String, Failure> reload() {
    if (_auth.currentUser case User user) {
      return Result.ok(user.uid);
    }
    return const Result.failed(AuthenticationFailure(AuthenticationFailureType.data));
  }

  @override
  Future<Result<String, Failure>> registerWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_auth.currentUser case User user) {
        return Result.ok(user.uid);
      }

      return const Result.failed(
        Failure.authentication(AuthenticationFailureType.data),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Result.failed(
          Failure.authentication(AuthenticationFailureType.alreadyExist),
        );
      }
      return const Result.failed(
        Failure.authentication(AuthenticationFailureType.credentials),
      );
    }
  }

  @override
  Future<Result<String, Failure>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user case User user) {
        return Result.ok(user.uid);
      }

      return const Result.failed(Failure.authentication(AuthenticationFailureType.data));
    } on FirebaseAuthException {
      return const Result.failed(Failure.authentication(AuthenticationFailureType.credentials));
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
