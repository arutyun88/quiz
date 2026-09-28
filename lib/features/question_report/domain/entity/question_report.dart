enum QuestionReportCategory {
  factualError('FACTUAL_ERROR'),
  ambiguous('AMBIGUOUS'),
  badTranslation('BAD_TRANSLATION'),
  outdatedFact('OUTDATED_FACT'),
  technical('TECHNICAL'),
  other('OTHER');

  const QuestionReportCategory(this.apiValue);

  final String apiValue;
}

class QuestionReportSubmission {
  const QuestionReportSubmission({
    required this.clientEventId,
    required this.attemptId,
    required this.category,
    required this.locale,
    this.details,
  });

  final String clientEventId;
  final String attemptId;
  final QuestionReportCategory category;
  final String locale;
  final String? details;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionReportSubmission &&
          clientEventId == other.clientEventId &&
          attemptId == other.attemptId &&
          category == other.category &&
          locale == other.locale &&
          details == other.details;

  @override
  int get hashCode => Object.hash(
        clientEventId,
        attemptId,
        category,
        locale,
        details,
      );
}
