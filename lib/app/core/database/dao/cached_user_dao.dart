// import 'package:drift/drift.dart';
// import 'package:quiz/app/core/database/app_database.dart';
// import 'package:quiz/app/core/database/schema/cached_user.dart';
// import 'package:quiz/features/user/domain/entity/user_entity.dart';

// part 'cached_user_dao.g.dart';

// @DriftAccessor(tables: [CachedUser])
// class CachedUserDao extends DatabaseAccessor<AppDatabase> with _$CachedUserDaoMixin {
//   CachedUserDao(super.attachedDatabase);

//   Future<void> saveUser(UserEntity user) async {
//     _userEntityToCompanion(user);
//     print(user);
//   }

//   CachedUserCompanion _userEntityToCompanion(UserEntity entity) {
//     return CachedUserCompanion(
//       id: Value(entity.id),
//       email: Value(entity.email),
//     );
//   }

//   UserEntity _userDataToEntity(CachedUserData data) {
//     return UserEntity(
//       id: data.id,
//       email: data.email,
//       name: data.name,
//       birthDate: data.birthDate,
//     );
//   }
// }
