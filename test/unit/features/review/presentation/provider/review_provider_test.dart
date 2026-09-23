import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';
import 'package:quiz/features/review/presentation/provider/review_provider.dart';

class _MockReviewRepository extends Mock implements ReviewRepository {}

void main() {
  test('coalesces initial refresh and preserves data when refresh fails',
      () async {
    final repository = _MockReviewRepository();
    const history = ReviewHistoryEntity(
      items: [],
      total: 0,
      offset: 0,
      limit: 20,
    );
    when(
      () => repository.fetch(limit: any(named: 'limit'), offset: 0),
    ).thenAnswer((_) async => const Result.ok(history));
    final notifier = ReviewNotifier(reviewRepository: repository);
    addTearDown(notifier.dispose);

    await notifier.refresh();

    verify(() => repository.fetch(limit: 20, offset: 0)).called(1);
    expect((notifier.state as ReviewDataState).items, isEmpty);

    when(
      () => repository.fetch(limit: any(named: 'limit'), offset: 0),
    ).thenAnswer(
      (_) async => const Result.failed(Failure.noConnection()),
    );
    await notifier.refresh();

    expect(notifier.state, isA<ReviewDataState>());
  });

  test('marks a practice request in the current history after persistence',
      () async {
    final repository = _MockReviewRepository();
    final item = ReviewHistoryItemEntity(
      attemptId: 'attempt-1',
      questionId: 'question-1',
      questionVersionId: 'version-1',
      editionDate: '2026-09-23',
      answeredAt: DateTime.parse('2026-09-23T10:00:00Z'),
      action: 'ANSWER',
      answerId: 'answer-1',
      correctAnswerId: 'answer-2',
      question: 'Question?',
      topic: 'History',
      answer: 'Wrong',
      correctAnswer: 'Correct',
      description: null,
      hint: null,
      hintUsed: false,
      versionStatus: ReviewVersionStatus.current,
      practiceRequested: false,
      contentRedacted: false,
    );
    final history = ReviewHistoryEntity(
      items: [item],
      total: 1,
      offset: 0,
      limit: 20,
    );
    when(
      () => repository.fetch(limit: any(named: 'limit'), offset: 0),
    ).thenAnswer((_) async => Result.ok(history));
    when(() => repository.requestPractice('attempt-1'))
        .thenAnswer((_) async => const Result.ok(null));
    final notifier = ReviewNotifier(reviewRepository: repository);
    addTearDown(notifier.dispose);
    await notifier.refresh();

    final requested = await notifier.requestPractice('attempt-1');

    expect(requested, isTrue);
    final state = notifier.state as ReviewDataState;
    expect(state.items.single.practiceRequested, isTrue);
  });
}
