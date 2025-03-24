import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/firestore_doc_service.dart';
import 'package:quiz/features/authentication/data/dto/user_dto.dart';
import 'package:quiz/features/profile/domain/repository/user_update_repository.dart';

class FirebaseUserUpdateRepository implements UserUpdateRepository {
  const FirebaseUserUpdateRepository({
    required FirebaseAuth auth,
    required FirestoreDocService firestore,
  })  : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirestoreDocService _firestore;

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

  @override
  Future<Result<void, Failure>> changeInfo({
    String? name,
    DateTime? birthDate,
  }) async {
    final id = _auth.currentUser?.uid;
    if (id case String id) {
      final userRef = _firestore.user(id);
      try {
        final user = await userRef.get();

        if (user.exists) {
          if (user.data() case Json json) {
            final dto = UserDto.fromJson(json);
            await userRef.update(
              dto
                  .copyWith(
                    name: name ?? dto.name,
                    birthDate: birthDate ?? dto.birthDate,
                  )
                  .toJson() //
                ..['updated_at'] = FieldValue.serverTimestamp(),
            );
          }
        } else {
          await userRef.set(
            UserDto(id: id, name: name, birthDate: birthDate).toJson()
              ..['created_at'] = FieldValue.serverTimestamp()
              ..['updated_at'] = FieldValue.serverTimestamp(),
          );
        }
        return const Result.ok(null);
      } catch (_) {
        return const Result.failed(Failure.authentication(AuthenticationFailureType.data));
      }
    }

    return const Result.failed(Failure.authentication(AuthenticationFailureType.unauthenticated));
  }
}
