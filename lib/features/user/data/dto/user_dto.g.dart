// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAuthenticatedEntityImpl _$$UserAuthenticatedEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAuthenticatedEntityImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
    );

Map<String, dynamic> _$$UserAuthenticatedEntityImplToJson(
        _$UserAuthenticatedEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'birth_date': instance.birthDate?.toIso8601String(),
    };
