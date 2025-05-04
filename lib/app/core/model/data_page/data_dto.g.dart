// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataDtoImpl<T> _$$DataDtoImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$DataDtoImpl<T>(
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$$DataDtoImplToJson<T>(
  _$DataDtoImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
