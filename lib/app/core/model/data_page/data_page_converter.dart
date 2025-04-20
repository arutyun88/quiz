import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/app/core/model/data_page/page_info_converter.dart';

final class DataPageConverter<TEntity, TDto> extends DtoConverter<PageEntity<TEntity>, DataPageDto<TDto>> {
  final PageInfoConverter _pageInfoConverter;
  final DtoConverter<TEntity, TDto> _dataConverter;

  DataPageConverter({
    required PageInfoConverter pageInfoConverter,
    required DtoConverter<TEntity, TDto> dataConverter,
  })  : _pageInfoConverter = pageInfoConverter,
        _dataConverter = dataConverter;

  @override
  PageEntity<TEntity> convert(DataPageDto<TDto> dto) {
    return PageEntity(
      items: _dataConverter.convertMultiple(dto.data).toList(),
      info: _pageInfoConverter.convert(dto.meta),
    );
  }
}
