import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/data_page/meta.dart';

part 'data_page_dto.freezed.dart';
part 'data_page_dto.g.dart';

@Freezed(genericArgumentFactories: true)
class DataPageDto<T> with _$DataPageDto<T> {
  const factory DataPageDto({
    required List<T> data,
    required Meta meta,
  }) = _DataPageDto;

  factory DataPageDto.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataPageDtoFromJson(json, fromJsonT);
}
