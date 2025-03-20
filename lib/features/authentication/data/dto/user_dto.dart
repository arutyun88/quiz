// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/timestamp_converter.dart';
import 'package:quiz/features/user/domain/entity/gender.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    String? name,
    String? email,
    Gender? gender,
    @JsonKey(name: 'birth_date') @TimestampConverter() DateTime? birthDate,
  }) = _UserAuthenticatedEntity;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
