// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataPageDtoImpl<T> _$$DataPageDtoImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$DataPageDtoImpl<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataPageDtoImplToJson<T>(
  _$DataPageDtoImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'meta': instance.meta,
    };
