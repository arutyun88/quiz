import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/data_page/page_info_converter.dart';
import 'package:quiz/features/question/data/converter/answered_statistics_dto_converter.dart';
import 'package:quiz/features/question/data/converter/question_converter.dart';
import 'package:quiz/features/question/data/repository/remote_answer_repository.dart';
import 'package:quiz/features/question/data/repository/remote_question_repository.dart';
import 'package:quiz/features/question/domain/repository/answer_repository.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

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

  @lazySingleton
  QuestionRepository questionRepository({
    required ApiClient client,
    required QuestionPageConverter questionpageConverter,
  }) =>
      RemoteQuestionRepository(
        client: client,
        questionPageConverter: questionpageConverter,
      );

  @lazySingleton
  AnswerRepository answerRepository({
    required ApiClient client,
    required AnsweredStatisticsDtoConverter answerConverter,
  }) =>
      RemoteAnswerRepository(
        client: client,
        answerConverter: answerConverter,
      );
}
