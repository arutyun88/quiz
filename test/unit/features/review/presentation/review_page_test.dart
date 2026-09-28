import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/config/theme/palette.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/question_report/domain/entity/question_report_status.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';
import 'package:quiz/features/review/presentation/provider/review_provider.dart';
import 'package:quiz/features/review/presentation/review_page.dart';
import 'package:quiz/gen/strings.g.dart';

class MockReviewRepository extends Mock implements ReviewRepository {}

void main() {
  late MockReviewRepository repository;

  setUp(() {
    repository = MockReviewRepository();
    getIt.registerSingleton<ReviewRepository>(repository);
    when(() => repository.fetch(limit: 20, offset: 0)).thenAnswer(
      (_) async => Result.ok(
        ReviewHistoryEntity(
          items: [
            _item(
              attemptId: 'attempt-1',
              question: 'First question',
              description: 'First explanation',
            ),
            _item(
              attemptId: 'attempt-2',
              question: 'Second question',
              description: 'Second explanation',
            ),
          ],
          total: 2,
          offset: 0,
          limit: 20,
        ),
      ),
    );
  });

  tearDown(() => getIt.reset());

  testWidgets('opening a review card collapses the previously opened card',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('First question'));
    await tester.pumpAndSettle();
    expect(find.text('First explanation'), findsOneWidget);

    await tester.tap(find.text('Second question'));
    await tester.pumpAndSettle();
    expect(find.text('First explanation'), findsNothing);
    expect(find.text('Second explanation'), findsOneWidget);
  });

  testWidgets('practice filters are mutually exclusive server queries',
      (tester) async {
    when(
      () => repository.fetch(
        limit: 20,
        offset: 0,
        practiceStatuses: any(named: 'practiceStatuses'),
      ),
    ).thenAnswer(
      (_) async => const Result.ok(
        ReviewHistoryEntity(items: [], total: 0, offset: 0, limit: 20),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('review-filter-button')), findsOneWidget);
    clearInteractions(repository);

    await tester.tap(find.byKey(const ValueKey('review-filter-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('review-filter-none')));
    await tester.pumpAndSettle();
    expect(find.text(t.review.filter_empty_title), findsOneWidget);
    expect(find.text(t.review.filter_empty_message), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('review-filter-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('review-filter-queued')));
    await tester.pumpAndSettle();

    final captured = verify(
      () => repository.fetch(
        limit: 20,
        offset: 0,
        practiceStatuses: captureAny(named: 'practiceStatuses'),
      ),
    ).captured.cast<Set<ReviewPracticeStatus>>();
    expect(captured, [
      {ReviewPracticeStatus.none},
      {ReviewPracticeStatus.queued},
    ]);
  });

  testWidgets('shows requested state instead of another practice action',
      (tester) async {
    when(() => repository.fetch(limit: 20, offset: 0)).thenAnswer(
      (_) async => Result.ok(
        ReviewHistoryEntity(
          items: [
            _item(
              attemptId: 'attempt-1',
              question: 'Requested question',
              description: 'Explanation',
              practiceRequested: true,
              practiceStatus: ReviewPracticeStatus.queued,
            ),
          ],
          total: 1,
          offset: 0,
          limit: 20,
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Requested question'));
    await tester.pumpAndSettle();

    expect(find.text(t.review.practice_cta), findsNothing);
    expect(find.byKey(const ValueKey('practice-queued')), findsOneWidget);
    expect(find.text(t.review.practice_queued_title), findsOneWidget);
    expect(find.text(t.review.practice_queued_message), findsOneWidget);
  });

  testWidgets('shows completed state for an answered practice question',
      (tester) async {
    when(() => repository.fetch(limit: 20, offset: 0)).thenAnswer(
      (_) async => Result.ok(
        ReviewHistoryEntity(
          items: [
            _item(
              attemptId: 'attempt-1',
              question: 'Practiced question',
              description: 'Explanation',
              practiceRequested: true,
              practiceStatus: ReviewPracticeStatus.completed,
            ),
          ],
          total: 1,
          offset: 0,
          limit: 20,
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final card = tester.widget<AnimatedContainer>(
      find.ancestor(
        of: find.text('Practiced question'),
        matching: find.byType(AnimatedContainer),
      ),
    );
    final decoration = card.decoration! as BoxDecoration;
    expect(
      decoration.color,
      Color.alphaBlend(
        Palette.light.answer.successMint.withValues(alpha: 0.14),
        Palette.light.card.background,
      ),
    );

    await tester.tap(find.text('Practiced question'));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('practice-completed')), findsOneWidget);
    expect(find.text(t.review.practice_completed_title), findsOneWidget);
    expect(find.text(t.review.practice_completed_message), findsOneWidget);
  });

  testWidgets('keeps the card expanded after practice is queued',
      (tester) async {
    when(() => repository.requestPractice('attempt-1'))
        .thenAnswer((_) async => const Result.ok(null));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('First question'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('practice-action')));
    await tester.pumpAndSettle();

    expect(find.text('First explanation'), findsOneWidget);
    expect(find.byKey(const ValueKey('practice-queued')), findsOneWidget);
    expect(find.text(t.review.practice_cta), findsNothing);
    verify(() => repository.requestPractice('attempt-1')).called(1);
  });

  testWidgets('shows report status instead of another report action',
      (tester) async {
    when(() => repository.fetch(limit: 20, offset: 0)).thenAnswer(
      (_) async => Result.ok(
        ReviewHistoryEntity(
          items: [
            _item(
              attemptId: 'attempt-1',
              question: 'Reported question',
              description: 'Explanation',
              reportSubmitted: true,
              reportStatus: QuestionReportStatus.processed,
            ),
          ],
          total: 1,
          offset: 0,
          limit: 20,
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reported question'));
    await tester.pumpAndSettle();

    expect(find.text(t.question.report.action), findsNothing);
    expect(find.text(t.question.report.processed_title), findsOneWidget);
    expect(find.text(t.question.report.processed_message), findsOneWidget);
  });

  testWidgets('shows a dedicated empty state', (tester) async {
    when(() => repository.fetch(limit: 20, offset: 0)).thenAnswer(
      (_) async => const Result.ok(
        ReviewHistoryEntity(items: [], total: 0, offset: 0, limit: 20),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(t.review.empty_title), findsOneWidget);
    expect(find.text(t.review.empty_message), findsOneWidget);
  });

  testWidgets('shows a dedicated initial error state', (tester) async {
    when(() => repository.fetch(limit: 20, offset: 0)).thenAnswer(
      (_) async => const Result.failed(Failure.unknown('failed')),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewProvider.overrideWith(
            (ref) => ReviewNotifier(reviewRepository: repository),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const ReviewPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(t.review.error_title), findsOneWidget);
    expect(find.text(t.review.error_message), findsOneWidget);
    expect(find.text(t.review.retry), findsOneWidget);
  });
}

ReviewHistoryItemEntity _item({
  required String attemptId,
  required String question,
  required String description,
  bool practiceRequested = false,
  ReviewPracticeStatus practiceStatus = ReviewPracticeStatus.none,
  bool reportSubmitted = false,
  QuestionReportStatus reportStatus = QuestionReportStatus.none,
}) =>
    ReviewHistoryItemEntity(
      attemptId: attemptId,
      questionId: 'question-$attemptId',
      questionVersionId: 'version-$attemptId',
      editionDate: '2026-09-23',
      answeredAt: DateTime.parse('2026-09-23T10:00:00Z'),
      action: 'ANSWER',
      answerId: 'wrong-answer',
      correctAnswerId: 'correct-answer',
      question: question,
      topic: 'История',
      answer: 'Wrong',
      correctAnswer: 'Correct',
      description: description,
      hint: null,
      hintUsed: false,
      versionStatus: ReviewVersionStatus.current,
      practiceRequested: practiceRequested,
      practiceStatus: practiceStatus,
      reportSubmitted: reportSubmitted,
      reportStatus: reportStatus,
      contentRedacted: false,
    );
