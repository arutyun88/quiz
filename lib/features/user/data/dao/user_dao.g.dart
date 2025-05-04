// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDaoImpl _$$UserDaoImplFromJson(Map<String, dynamic> json) =>
    _$UserDaoImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      birthDateIso: json['birthDateIso'] as String?,
    );

Map<String, dynamic> _$$UserDaoImplToJson(_$UserDaoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'birthDateIso': instance.birthDateIso,
    };
