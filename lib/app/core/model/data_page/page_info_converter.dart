import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/app/core/model/data_page/meta.dart';
import 'package:quiz/app/core/model/data_page/page_info.dart';

typedef PageInfoConverter = DtoConverter<PageInfo, Meta>;

@Singleton(as: PageInfoConverter)
final class PageInfoConverterImpl extends PageInfoConverter {
  @override
  PageInfo convert(Meta dto) {
    return PageInfo(
      page: dto.offset,
      limit: dto.limit,
      hasNextPage: dto.total > dto.offset,
    );
  }
}
