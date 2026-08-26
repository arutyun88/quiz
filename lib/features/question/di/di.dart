import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/data_page/page_info_converter.dart';
import 'package:quiz/features/question/data/converter/question_converter.dart';

@module
abstract class QuestionModule {
  @Injectable()
  QuestionPageConverter questionpageConverter(
    QuestionConverter questionConverter,
    PageInfoConverter pageInfoConverter,
  ) {
    return DataPageConverter(
      pageInfoConverter: pageInfoConverter,
      dataConverter: questionConverter,
    );
  }
}
