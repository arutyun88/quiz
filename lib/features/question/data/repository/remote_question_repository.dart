import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/question_converter.dart';
import 'package:quiz/features/question/data/converter/question_state_dto_converter.dart';
import 'package:quiz/features/question/data/dto/question_dto.dart';
import 'package:quiz/features/question/data/dto/question_state_dto.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

class RemoteQuestionRepository implements QuestionRepository {
  final ApiClient _client;
  final QuestionPageConverter _questionPageConverter;
  final QuestionStateDtoConverter _questionStateDtoConverter;

  const RemoteQuestionRepository({
    required ApiClient client,
    required QuestionPageConverter questionPageConverter,
    required QuestionStateDtoConverter questionStateDtoConverter,
  })  : _client = client,
        _questionPageConverter = questionPageConverter,
        _questionStateDtoConverter = questionStateDtoConverter;

  @override
  Future<Result<PageEntity<QuestionEntity>, Failure>> fetch({
    int limit = 1,
  }) async =>
      await _client.get(
        '/questions',
        headers: {
          'X-Limit': limit,
        },
        mapper: (json) => DataPageDto.fromJson(json, (json) => QuestionDto.fromJson(json as Json)),
        converter: _questionPageConverter.convert,
        enableLocale: true,
      );

  @override
  Future<Result<QuestionStateEntity, Failure>> checkQuestionStateById(String id) async {
    return await _client.get(
      '/questions/$id/state',
      mapper: (json) => DataDto.fromJson(json, (json) => QuestionStateDto.fromJson(json as Json)),
      converter: _questionStateDtoConverter.convert,
    );
  }
}
