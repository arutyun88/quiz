import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_limit/presentation/daily_limit_page.dart';
import 'package:quiz/features/daily_result/presentation/server_daily_result_page.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocale(AppLocale.ru));

  testWidgets('result offers ten free questions without ad or Quiz+ copy',
      (tester) async {
    await tester.pumpWidget(
      _app(
        ServerDailyResultPage(
          summary: _summary(_continuation(remaining: 10)),
          onContinue: () {},
        ),
      ),
    );

    expect(find.text('ИГРАТЬ ДАЛЬШЕ БЕСПЛАТНО'), findsOneWidget);
    expect(find.text('ДОСТУПНО ЕЩЁ 10 ВОПРОСОВ БЕЗ РЕКЛАМЫ'), findsOneWidget);
    expect(find.textContaining('QUIZ+'), findsNothing);
    expect(find.textContaining('РОЛИК'), findsNothing);
  });

  testWidgets('exhausted result closes the preview instead of offering more',
      (tester) async {
    await tester.pumpWidget(
      _app(
        ServerDailyResultPage(
          summary: _summary(
            _continuation(
              remaining: 0,
              nextAction: DailyContinuationAction.limitReached,
            ),
          ),
          onContinue: () {},
        ),
      ),
    );

    expect(find.text('ЗАВЕРШИТЬ НА СЕГОДНЯ'), findsOneWidget);
    expect(find.text('НА СЕГОДНЯ ВСЁ · НОВЫЙ ВЫПУСК ЗАВТРА'), findsOneWidget);
    expect(find.textContaining('ДОСТУПНО ЕЩЁ'), findsNothing);
  });

  testWidgets('final page exposes review and home without monetization',
      (tester) async {
    var openedHome = false;
    var openedReview = false;
    await tester.pumpWidget(
      _app(
        DailyLimitPage(
          continuation: _continuation(
            remaining: 0,
            nextAction: DailyContinuationAction.limitReached,
          ),
          isBusy: false,
          isAdBusy: false,
          onKeepPlaying: () {},
          onQuizPlus: () {},
          onClose: () {},
          onHome: () => openedHome = true,
          onReview: () => openedReview = true,
          onRefresh: () {},
        ),
      ),
    );

    expect(find.text('НА СЕГОДНЯ ВСЁ'), findsOneWidget);
    expect(find.text('РАЗБОР ОТВЕТОВ'), findsOneWidget);
    expect(find.text('НА ГЛАВНУЮ'), findsOneWidget);
    expect(find.textContaining('QUIZ+'), findsNothing);
    expect(find.textContaining('Посмотреть ролик'), findsNothing);

    await tester.tap(find.text('РАЗБОР ОТВЕТОВ'));
    await tester.pump(const Duration(milliseconds: 150));
    await tester.tap(find.text('НА ГЛАВНУЮ'));
    await tester.pump(const Duration(milliseconds: 150));
    expect(openedReview, isTrue);
    expect(openedHome, isTrue);
  });
}

Widget _app(Widget child) => TranslationProvider(
      child: MaterialApp(
        theme: AppTheme.light,
        home: child,
      ),
    );

DailyContinuationEntity _continuation({
  required int remaining,
  DailyContinuationAction nextAction = DailyContinuationAction.playQuestion,
}) {
  final now = DateTime.now().toUtc();
  return DailyContinuationEntity(
    runId: 'run-1',
    serverTime: now,
    receivedAt: now,
    closesAt: now.add(const Duration(hours: 12)),
    nextAction: nextAction,
    quizPlus: false,
    accessReason: DailyContinuationAccessReason.marketPreview,
    marketPreviewQuestions: 10,
    bonusQuestionsGranted: 10,
    bonusQuestionsServed: 10 - remaining,
    bonusQuestionsRemaining: remaining,
    questionsPerReward: 5,
    rewardedVideosUsed: 0,
    rewardedVideosMax: 0,
    rewardedVideosRemaining: 0,
    rollingVideosUsed: 0,
    rollingVideosMax: 0,
    rewardedAdAvailable: false,
    rewardedAdNextAvailableAt: null,
  );
}

DailySummaryEntity _summary(DailyContinuationEntity continuation) =>
    DailySummaryEntity(
      runId: 'run-1',
      editionDate: '2026-10-12',
      status: DailyRunStatus.completed,
      requiredCount: 10,
      resolvedCount: 10,
      correctCount: 8,
      skippedCount: 0,
      hintCount: 0,
      answerXp: 80,
      completionXp: 25,
      totalXp: 105,
      bonusGranted: 10,
      bonusServed: 10 - continuation.bonusQuestionsRemaining,
      ratingBefore: 1200,
      ratingAfter: 1260,
      ratingDelta: 60,
      accuracy: 0.8,
      streakBefore: 2,
      streakAfter: 3,
      streakDelta: 1,
      continuation: continuation,
    );
