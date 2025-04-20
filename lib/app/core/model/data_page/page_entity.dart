import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/data_page/page_info.dart';

part 'page_entity.freezed.dart';

@freezed
class PageEntity<T> with _$PageEntity<T> {
  const factory PageEntity({
    required List<T> items,
    required PageInfo info,
  }) = _PageEntity;
}
