import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_dto.freezed.dart';
part 'data_dto.g.dart';

@Freezed(genericArgumentFactories: true)
class DataDto<T> with _$DataDto<T> {
  const factory DataDto({
    required T data,
  }) = _DataDto;

  factory DataDto.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataDtoFromJson(json, fromJsonT);
}
