import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question_report/domain/entity/question_report.dart';
import 'package:quiz/features/question_report/domain/repository/question_report_repository.dart';

@LazySingleton(as: QuestionReportRepository)
class RemoteQuestionReportRepository implements QuestionReportRepository {
  const RemoteQuestionReportRepository({required ApiClient client})
      : _client = client;

  final ApiClient _client;

  @override
  Future<Result<void, Failure>> submit(
    QuestionReportSubmission submission,
  ) =>
      _client.post<void, void>(
        '/question-reports',
        body: {
          'client_event_id': submission.clientEventId,
          'attempt_id': submission.attemptId,
          'category': submission.category.apiValue,
          'details': submission.details,
          'locale': submission.locale,
        },
      );
}
