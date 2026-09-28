import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question_report/domain/entity/question_report.dart';

abstract interface class QuestionReportRepository {
  Future<Result<void, Failure>> submit(QuestionReportSubmission submission);
}
