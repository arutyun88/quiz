import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';

void main() {
  const assignment = DailyAssignmentEntity(
    assignmentId: 'assignment-1',
    questionId: 'question-1',
    questionVersionId: 'version-1',
    position: 1,
    kind: DailyAssignmentKind.main,
    topic: 'Science',
    text: 'Question?',
    answers: [],
    hintUsed: false,
  );

  DailyEditionState activeState({required DateTime? startedAt}) =>
      DailyEditionActiveState(
        run: DailyRunEntity(
          runId: 'run-1',
          editionDate: '2026-09-08',
          status: DailyRunStatus.inProgress,
          startedAt: startedAt,
          closesAt: DateTime.parse('2026-09-09T00:00:00Z'),
          graceEndsAt: DateTime.parse('2026-09-09T00:30:00Z'),
          requiredCount: 10,
          resolvedCount: 0,
          ratingAtOpen: 1000,
        ),
        assignment: assignment,
      );

  test('keeps the start screen before the edition is explicitly started', () {
    expect(shouldResumeDailyEdition(activeState(startedAt: null)), isFalse);
  });

  test('resumes an explicitly started edition before its first answer', () {
    expect(
      shouldResumeDailyEdition(
        activeState(startedAt: DateTime.utc(2026, 9, 9)),
      ),
      isTrue,
    );
  });

  test('does not route non-active states to the quiz', () {
    expect(
      shouldResumeDailyEdition(const DailyEditionInitialState()),
      isFalse,
    );
  });
}
