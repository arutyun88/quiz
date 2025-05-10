import 'dart:async';

import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/answered_statistics_dto_converter.dart';
import 'package:quiz/features/question/data/dto/answered_statistics_dto.dart';
import 'package:quiz/features/question/domain/entity/answered_statistics_entity.dart';
import 'package:quiz/features/question/domain/repository/answer_repository.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

class RemoteAnswerRepository implements AnswerRepository {
  final ApiClient _client;
  final AnsweredStatisticsDtoConverter _answerConverter;

  final _statisticsController = StreamController<UserStatisticsEntity>.broadcast();

  RemoteAnswerRepository({
    required ApiClient client,
    required AnsweredStatisticsDtoConverter answerConverter,
  })  : _client = client,
        _answerConverter = answerConverter;

  @override
  Stream<UserStatisticsEntity> get statistics => _statisticsController.stream;

  @override
  Future<Result<AnsweredStatisticsEntity, Failure>> send({
    required String questionId,
    required String answerId,
  }) async =>
      await _client.post('/questions/answer',
          body: {
            'question_id': questionId,
            'answer_id': answerId,
          },
          mapper: (json) => DataDto.fromJson(json, (json) => AnsweredStatisticsDto.fromJson(json as Json)),
          converter: _answerConverter.convert,
          onSuccess: (answer) => _statisticsController.add(answer.statistics));
}
