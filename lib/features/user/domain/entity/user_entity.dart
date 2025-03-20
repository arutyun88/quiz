import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/user/domain/entity/gender.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String? email,
    required String? name,
    required Gender? gender,
    required DateTime? birthDate,
  }) = _UserEntity;
}
