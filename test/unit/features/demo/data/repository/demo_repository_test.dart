import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/data_page/page_info.dart';
import 'package:quiz/app/core/model/data_page/page_info_converter.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/demo/data/dto/demo_answer_dto.dart';
import 'package:quiz/features/demo/data/repository/remote_demo_repository.dart';
import 'package:quiz/features/demo/domain/entity/demo_answer_entity.dart';
import 'package:quiz/features/demo/domain/repository/demo_repository.dart';
import 'package:quiz/features/question/data/converter/answer_converter.dart';
import 'package:quiz/features/question/data/converter/question_converter.dart';
import 'package:quiz/features/question/data/converter/topic_converter.dart';
import 'package:quiz/features/question/data/dto/question_dto.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late DemoRepository repository;

  setUpAll(() => registerFallbackValue(<String, dynamic>{}));

  setUp(() {
    client = MockApiClient();
    final questionConverter = QuestionConverterImpl(
      topicConverter: TopicConverterImpl(),
      answerConverter: AnswerConverterImpl(),
    );
    repository = RemoteDemoRepository(
      client: client,
      questionPageConverter: DataPageConverter<QuestionEntity, QuestionDto>(
        pageInfoConverter: PageInfoConverterImpl(),
        dataConverter: questionConverter,
      ),
    );
  });

  test('fetches a localized bounded public question set', () async {
    final page = PageEntity<QuestionEntity>(
      items: const [],
      info: PageInfo(page: 0, limit: 3, hasNextPage: false),
    );
    when(
      () => client.get<PageEntity<QuestionEntity>, DataPageDto<QuestionDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => Result.ok(page));

    await repository.fetchQuestions(limit: 3);

    final headers = verify(
      () => client.get<PageEntity<QuestionEntity>, DataPageDto<QuestionDto>>(
        '/questions',
        queryParameters: any(named: 'queryParameters'),
        headers: captureAny(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: true,
      ),
    ).captured.single as Map<String, dynamic>;
    expect(headers, {'X-Limit': 3});
  });

  test('checks an answer through the stateless localized endpoint', () async {
    const answer = DemoAnswerEntity(
      isCorrect: false,
      answerId: 'answer-1',
      correctAnswerId: 'answer-2',
      description: 'Explanation',
    );
    when(
      () => client.post<DemoAnswerEntity, DataDto<DemoAnswerDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(answer));

    await repository.checkAnswer(
      questionId: 'question-1',
      answerId: 'answer-1',
    );

    final body = verify(
      () => client.post<DemoAnswerEntity, DataDto<DemoAnswerDto>>(
        '/questions/answer/check',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: true,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single as Map<String, dynamic>;
    expect(body, {
      'question_id': 'question-1',
      'answer_id': 'answer-1',
    });
  });
}
