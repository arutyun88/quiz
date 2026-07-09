import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';
import 'package:quiz/features/question/domain/service/question_id_service.dart';

abstract interface class SyncCachedQuestionLocaleUseCase {
  Future<Result<SyncCachedQuestionLocaleResult, Failure>> sync();
}

class SyncCachedQuestionLocaleResult {
  const SyncCachedQuestionLocaleResult({
    required this.cachedCount,
    required this.syncedCount,
  });

  final int cachedCount;
  final int syncedCount;
}

class SyncCachedQuestionLocaleUseCaseImpl
    implements SyncCachedQuestionLocaleUseCase {
  static const int _localizeBatchSize = 50;

  final QuestionDao _questionDao;
  final QuestionRepository _questionRepository;
  final ConnectivityService _connectivityService;
  final QuestionIdService _questionIdService;

  SyncCachedQuestionLocaleUseCaseImpl({
    required QuestionDao questionDao,
    required QuestionRepository questionRepository,
    required ConnectivityService connectivityService,
    required QuestionIdService questionIdService,
  })  : _questionDao = questionDao,
        _questionRepository = questionRepository,
        _connectivityService = connectivityService,
        _questionIdService = questionIdService;

  @override
  Future<Result<SyncCachedQuestionLocaleResult, Failure>> sync() async {
    final cachedQuestions = await _questionDao.getAllQuestions();

    final List<QuestionEntity> questions;
    switch (cachedQuestions) {
      case ResultOk(:final data):
        questions = data;
      case ResultFailed(:final error)
          when error is QuestionFailure &&
              error.reason is QuestionFailureNotFoundCachedReason:
        questions = const [];
      case ResultFailed(:final error):
        return Result.failed(error);
    }

    if (questions.isEmpty) {
      return const Result.ok(
          SyncCachedQuestionLocaleResult(cachedCount: 0, syncedCount: 0));
    }

    final hasInternet = await _connectivityService.hasInternetConnection();
    if (!hasInternet) {
      return Result.failed(const Failure.noConnection());
    }

    final ids = questions.map((question) => question.id).toList();
    final remoteQuestions = await _localizeByChunks(ids);

    switch (remoteQuestions) {
      case ResultOk(:final data) when _containsAllRequestedQuestions(data, ids):
        final replaceResult = await _questionDao.replaceAll(data);

        switch (replaceResult) {
          case ResultOk():
            final currentQuestionId = _questionIdService.questionId;
            if (currentQuestionId != null &&
                !data.any((question) => question.id == currentQuestionId)) {
              await _questionIdService.clean();
            }

            return Result.ok(
              SyncCachedQuestionLocaleResult(
                cachedCount: questions.length,
                syncedCount: data.length,
              ),
            );
          case ResultFailed(:final error):
            return Result.failed(error);
        }
      case ResultOk():
        return Result.failed(
            Failure.question(QuestionFailureReason.notFoundCached()));
      case ResultFailed(:final error):
        return Result.failed(error);
    }
  }

  Future<Result<List<QuestionEntity>, Failure>> _localizeByChunks(
      List<String> ids) async {
    final result = <QuestionEntity>[];

    for (var start = 0; start < ids.length; start += _localizeBatchSize) {
      final batchEnd = start + _localizeBatchSize;
      final end = batchEnd > ids.length ? ids.length : batchEnd;
      final chunk = ids.sublist(start, end);
      final localized = await _questionRepository.localizeByIds(chunk);

      switch (localized) {
        case ResultOk(:final data):
          result.addAll(data);
        case ResultFailed(:final error):
          return Result.failed(error);
      }
    }

    return Result.ok(result);
  }

  bool _containsAllRequestedQuestions(
      List<QuestionEntity> questions, List<String> ids) {
    final localizedIds = questions.map((question) => question.id).toSet();
    return ids.every(localizedIds.contains);
  }
}
