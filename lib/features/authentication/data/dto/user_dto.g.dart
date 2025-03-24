// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAuthenticatedEntityImpl _$$UserAuthenticatedEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAuthenticatedEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      birthDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['birth_date'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$UserAuthenticatedEntityImplToJson(
        _$UserAuthenticatedEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'birth_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.birthDate, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
