import 'package:flutter/material.dart';
import 'package:quiz/app/core/widgets/app_status_banner.dart';
import 'package:quiz/features/question_report/domain/entity/question_report_status.dart';
import 'package:quiz/gen/strings.g.dart';

class QuestionReportSubmittedBanner extends StatelessWidget {
  const QuestionReportSubmittedBanner({
    super.key,
    this.status = QuestionReportStatus.pending,
  });

  final QuestionReportStatus status;

  @override
  Widget build(BuildContext context) {
    final t = context.t.question.report;
    return AppStatusBanner(
      key: const ValueKey('question-report-submitted'),
      title: status == QuestionReportStatus.processed
          ? t.processed_title
          : t.status_title,
      message: status == QuestionReportStatus.processed
          ? t.processed_message
          : t.status_message,
    );
  }
}
