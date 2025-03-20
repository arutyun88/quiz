import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/firestore_doc_service.dart';
import 'package:quiz/features/authentication/data/converter/user_converter.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirestoreDocService _firestore;
  final UserConverter _userConverter;

  const FirebaseUserRepository({
    required FirestoreDocService firestore,
    required UserConverter userConverter,
  })  : _firestore = firestore,
        _userConverter = userConverter;

  @override
  Future<Result<void, Failure>> createUser(UserEntity user) async {
    final fUser = await _firestore.user(user.id).get();

    if (fUser.exists) {
      return const Result.failed(
        Failure.authentication(AuthenticationFailureType.alreadyExist),
      );
    }

    await _firestore.user(user.id).set(
          _userConverter.revert(user).toJson()
            ..['created_at'] = FieldValue.serverTimestamp()
            ..['updated_at'] = FieldValue.serverTimestamp(),
        );

    return const Result.ok(null);
  }
}
