import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/main_layout.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';
import 'package:quiz/features/daily_edition/domain/service/daily_attempt_outbox.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class _MockDailyEditionRepository extends Mock
    implements DailyEditionRepository {}

class _MockDailyAttemptOutbox extends Mock implements DailyAttemptOutbox {}

void main() {
  testWidgets('reselecting a tab pops one route at a time', (tester) async {
    final router = GoRouter(
      initialLocation: '/profile/details/edit',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              MainLayout(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(path: '/', builder: (_, __) => const SizedBox()),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/rating',
                  builder: (_, __) => const SizedBox(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (_, __) => const SizedBox(),
                  routes: [
                    GoRoute(
                      path: 'details',
                      builder: (_, __) => const SizedBox(),
                      routes: [
                        GoRoute(
                          path: 'edit',
                          builder: (_, __) => const SizedBox(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        child: TranslationProvider(
          child: MaterialApp.router(
            theme: AppTheme.light,
            routerConfig: router,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      router.routeInformationProvider.value.uri.path,
      '/profile/details/edit',
    );

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/profile/details');

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/profile');
  });

  testWidgets('game tab opens a summary completed on another tab',
      (tester) async {
    final notifier = DailyEditionNotifier(
      accountId: 'user-1',
      repository: _MockDailyEditionRepository(),
      outbox: _MockDailyAttemptOutbox(),
    )..state = DailyEditionSummaryState(
        run: _completedRun,
        summary: _unacknowledgedSummary,
      );

    final router = GoRouter(
      initialLocation: '/profile',
      routes: [
        GoRoute(
          path: '/daily-result',
          name: 'daily-result',
          builder: (_, __) => const Text('daily result'),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              MainLayout(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(path: '/', builder: (_, __) => const SizedBox()),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/rating',
                  builder: (_, __) => const SizedBox(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (_, __) => const SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          dailyEditionProvider.overrideWith((ref) => notifier),
        ],
        child: TranslationProvider(
          child: MaterialApp.router(
            theme: AppTheme.light,
            routerConfig: router,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.draw_outlined));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/daily-result');
    expect(find.text('daily result'), findsOneWidget);
  });
}

final _completedRun = DailyRunEntity(
  runId: 'run-1',
  editionDate: '2026-09-29',
  status: DailyRunStatus.completed,
  startedAt: DateTime.utc(2026, 9, 29, 8),
  closesAt: DateTime.utc(2026, 9, 30),
  graceEndsAt: DateTime.utc(2026, 9, 30, 1),
  requiredCount: 10,
  resolvedCount: 10,
  ratingAtOpen: 1200,
);

final _unacknowledgedSummary = DailySummaryEntity(
  runId: 'run-1',
  editionDate: '2026-09-29',
  status: DailyRunStatus.completed,
  requiredCount: 10,
  resolvedCount: 10,
  correctCount: 8,
  skippedCount: 0,
  hintCount: 0,
  answerXp: 99,
  completionXp: 10,
  totalXp: 109,
  bonusGranted: 0,
  bonusServed: 0,
  continuation: DailyContinuationEntity(
    runId: 'run-1',
    serverTime: DateTime.utc(2026, 9, 29, 8, 5),
    closesAt: DateTime.utc(2026, 9, 30),
    nextAction: DailyContinuationAction.completeMain,
    quizPlus: false,
    bonusQuestionsGranted: 0,
    bonusQuestionsServed: 0,
    bonusQuestionsRemaining: 0,
    questionsPerReward: 5,
    rewardedVideosUsed: 0,
    rewardedVideosMax: 0,
    rewardedVideosRemaining: 0,
    rollingVideosUsed: 0,
    rollingVideosMax: 0,
    rewardedAdAvailable: false,
    rewardedAdNextAvailableAt: null,
  ),
);
