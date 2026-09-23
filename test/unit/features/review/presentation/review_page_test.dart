import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';
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

  testWidgets('hides practice action when it was already requested',
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
  });
}

ReviewHistoryItemEntity _item({
  required String attemptId,
  required String question,
  required String description,
  bool practiceRequested = false,
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
      contentRedacted: false,
    );
