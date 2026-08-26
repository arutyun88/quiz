import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/demo/data/dto/demo_answer_dto.dart';
import 'package:quiz/features/demo/domain/entity/demo_answer_entity.dart';
import 'package:quiz/features/demo/domain/repository/demo_repository.dart';
import 'package:quiz/features/question/data/converter/question_converter.dart';
import 'package:quiz/features/question/data/dto/question_dto.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';

@LazySingleton(as: DemoRepository)
final class RemoteDemoRepository implements DemoRepository {
  final ApiClient _client;
  final QuestionPageConverter _questionPageConverter;

  const RemoteDemoRepository({
    required ApiClient client,
    required QuestionPageConverter questionPageConverter,
  })  : _client = client,
        _questionPageConverter = questionPageConverter;

  @override
  Future<Result<PageEntity<QuestionEntity>, Failure>> fetchQuestions({
    required int limit,
  }) =>
      _client.get(
        '/questions',
        headers: {'X-Limit': limit},
        mapper: (json) => DataPageDto.fromJson(
          json,
          (item) => QuestionDto.fromJson(item as Json),
        ),
        converter: _questionPageConverter.convert,
        enableLocale: true,
      );

  @override
  Future<Result<DemoAnswerEntity, Failure>> checkAnswer({
    required String questionId,
    required String answerId,
  }) =>
      _client.post(
        '/questions/answer/check',
        body: {
          'question_id': questionId,
          'answer_id': answerId,
        },
        mapper: (json) => DataDto.fromJson(
          json,
          (data) => DemoAnswerDto.fromJson(data as Json),
        ),
        converter: (dto) => DemoAnswerEntity(
          isCorrect: dto.data.isCorrect,
          answerId: dto.data.answerId,
          correctAnswerId: dto.data.correctAnswerId,
          description: dto.data.description,
        ),
        enableLocale: true,
      );
}
