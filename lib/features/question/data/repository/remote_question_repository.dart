import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/answered_today_dto_converter.dart';
import 'package:quiz/features/question/data/converter/question_converter.dart';
import 'package:quiz/features/question/data/converter/question_state_dto_converter.dart';
import 'package:quiz/features/question/data/dto/answered_today_dto.dart';
import 'package:quiz/features/question/data/dto/question_dto.dart';
import 'package:quiz/features/question/data/dto/question_state_dto.dart';
import 'package:quiz/features/question/domain/entity/answered_today_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

class RemoteQuestionRepository implements QuestionRepository {
  final ApiClient _client;
  final QuestionPageConverter _questionPageConverter;
  final QuestionConverter _questionConverter;
  final QuestionStateDtoConverter _questionStateDtoConverter;
  final AnsweredTodayDtoConverter _answeredTodayDtoConverter;

  const RemoteQuestionRepository({
    required ApiClient client,
    required QuestionPageConverter questionPageConverter,
    required QuestionConverter questionConverter,
    required QuestionStateDtoConverter questionStateDtoConverter,
    required AnsweredTodayDtoConverter answeredTodayDtoConverter,
  })  : _client = client,
        _questionPageConverter = questionPageConverter,
        _questionConverter = questionConverter,
        _questionStateDtoConverter = questionStateDtoConverter,
        _answeredTodayDtoConverter = answeredTodayDtoConverter;

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
  Future<Result<List<QuestionEntity>, Failure>> localizeByIds(List<String> ids) async {
    return await _client.post(
      '/questions/localize',
      body: {
        'question_ids': ids,
      },
      mapper: (json) => DataDto.fromJson(
        json,
        (json) => (json as List<dynamic>).map((item) => QuestionDto.fromJson(item as Json)).toList(),
      ),
      converter: (dto) => _questionConverter.convertMultiple(dto.data).toList(),
      enableLocale: true,
    );
  }

  @override
  Future<Result<QuestionStateEntity, Failure>> checkQuestionStateById(String id) async {
    return await _client.get(
      '/questions/$id/state',
      mapper: (json) => DataDto.fromJson(json, (json) => QuestionStateDto.fromJson(json as Json)),
      converter: _questionStateDtoConverter.convert,
    );
  }

  @override
  Future<Result<AnsweredTodayEntity, Failure>> checkAnsweredToday() async {
    return await _client.get(
      '/questions/answered-today',
      mapper: (json) => DataDto.fromJson(json, (json) => AnsweredTodayDto.fromJson(json as Json)),
      converter: _answeredTodayDtoConverter.convert,
    );
  }
}
