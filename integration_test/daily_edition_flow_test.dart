import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/unauthorized_event_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/entity/pending_daily_attempt_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';
import 'package:quiz/features/daily_edition/domain/service/daily_attempt_outbox.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_question_provider.dart';
import 'package:quiz/features/daily_limit/presentation/daily_limit_flow.dart';
import 'package:quiz/features/daily_result/presentation/daily_result_gate_flow.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/gamification/domain/repository/gamification_repository.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/home/presentation/home_gate_flow.dart';
import 'package:quiz/features/home/presentation/quiz_gate_flow.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/features/subscription/domain/gateway/quiz_plus_purchase_gateway.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/fetch_current_user_gateway.dart';
import 'package:quiz/features/user/domain/repository/sign_in_with_email_gateway.dart';
import 'package:quiz/features/user/domain/repository/sign_up_with_email_gateway.dart';
import 'package:quiz/features/user/domain/repository/user_logout_gateway.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';
import 'package:quiz/features/user/presentation/provider/quiz_plus_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class _MockAuthTokenService extends Mock implements AuthTokenService {}

class _MockFetchCurrentUserGateway extends Mock
    implements FetchCurrentUserGateway {}

class _MockSignInWithEmailGateway extends Mock
    implements SignInWithEmailGateway {}

class _MockSignUpWithEmailGateway extends Mock
    implements SignUpWithEmailGateway {}

class _MockUserLogoutGateway extends Mock implements UserLogoutGateway {}

class _MockUserRepository extends Mock implements UserRepository {}

class _MockUnauthorizedEventService extends Mock
    implements UnauthorizedEventService {}

class _MockQuizPlusPurchaseGateway extends Mock
    implements QuizPlusPurchaseGateway {}

class _MockPushNotificationsGateway extends Mock
    implements PushNotificationsGateway {}

class _AuthenticatedNotifier extends AuthenticationNotifier {
  _AuthenticatedNotifier({
    required super.tokenService,
    required super.fetchCurrentUserGateway,
    required super.signInWithEmailGateway,
    required super.signUpWithEmailGateway,
    required super.userLogoutGateway,
    required super.userRepository,
    required super.unauthorizedEventService,
    required super.quizPlusPurchaseGateway,
    required super.pushNotificationsGateway,
  }) {
    state = AuthenticationState.authenticated(user: _user);
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initializeDateFormatting('en');
    await LocaleSettings.setLocale(AppLocale.en);
    await getIt.reset();
    getIt
        .registerSingleton<RewardedAdsGateway>(const _UnavailableRewardedAds());
    getIt.registerSingleton<ProductAnalytics>(const _NoopProductAnalytics());
  });

  tearDownAll(() => getIt.reset());

  testWidgets(
    'completes the main edition and the market preview continuation',
    (tester) async {
      tester.view.physicalSize = const Size(430, 932);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final repository = _DailyEditionScenarioRepository();
      final outbox = _MemoryDailyAttemptOutbox();
      final dailyEdition = DailyEditionNotifier(
        accountId: _user.id,
        repository: repository,
        outbox: outbox,
        clientEventIdFactory: repository.nextClientEventId,
        now: () => _serverTime,
        delay: (_) async {},
      );
      await dailyEdition.bootstrap(timezoneId: _user.timezoneId);

      final unauthorizedEvents = _MockUnauthorizedEventService();
      when(() => unauthorizedEvents.stream)
          .thenAnswer((_) => const Stream<void>.empty());
      final authentication = _AuthenticatedNotifier(
        tokenService: _MockAuthTokenService(),
        fetchCurrentUserGateway: _MockFetchCurrentUserGateway(),
        signInWithEmailGateway: _MockSignInWithEmailGateway(),
        signUpWithEmailGateway: _MockSignUpWithEmailGateway(),
        userLogoutGateway: _MockUserLogoutGateway(),
        userRepository: _MockUserRepository(),
        unauthorizedEventService: unauthorizedEvents,
        quizPlusPurchaseGateway: _MockQuizPlusPurchaseGateway(),
        pushNotificationsGateway: _MockPushNotificationsGateway(),
      );
      final gamification = GamificationNotifier(
        gamificationRepository: const _ScenarioGamificationRepository(),
      )..state = const BaseState.data(_level);
      final router = _router();
      addTearDown(router.dispose);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authenticationProvider.overrideWith((ref) => authentication),
            dailyEditionProvider.overrideWith((ref) => dailyEdition),
            dailyQuestionProvider.overrideWith((ref) {
              final notifier = DailyQuestionNotifier(
                submitAnswer: (answerId) =>
                    ref.read(dailyEditionProvider.notifier).submitAttempt(
                          action: DailyAttemptAction.answer,
                          answerId: answerId,
                        ),
                confirmationDuration: Duration.zero,
              );
              ref.listen(
                dailyEditionProvider,
                (_, next) => notifier.synchronize(next),
                fireImmediately: true,
              );
              return notifier;
            }),
            gamificationProvider.overrideWith((ref) => gamification),
            quizPlusProvider.overrideWithValue(false),
          ],
          child: TranslationProvider(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              routerConfig: router,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('DAILY EDITION READY'), findsOneWidget);
      expect(find.text('START EDITION'), findsOneWidget);
      await tester.tap(find.text('START EDITION'));
      await tester.pumpAndSettle();

      for (var position = 1; position <= 10; position++) {
        await _answerQuestion(tester, position);
      }

      expect(find.text("TODAY'S ISSUE COMPLETED"), findsOneWidget);
      expect(find.text('KEEP PLAYING FOR FREE'), findsOneWidget);
      expect(find.text('10 MORE QUESTIONS WITHOUT ADS'), findsOneWidget);

      await tester.tap(find.text('KEEP PLAYING FOR FREE'));
      await tester.pumpAndSettle();

      for (var position = 11; position <= 20; position++) {
        await _answerQuestion(tester, position);
      }

      expect(find.text("THAT'S ALL FOR TODAY"), findsWidgets);
      expect(find.text('REVIEW ANSWERS'), findsOneWidget);
      expect(find.text('GO HOME'), findsOneWidget);
      expect(find.byType(DailyLimitFlow), findsOneWidget);
      expect(repository.submittedPositions, List.generate(20, (i) => i + 1));
      expect(repository.acknowledgeCalls, 1);
      expect(outbox.savedCount, 20);
      expect(outbox.clearedCount, 20);
      expect(outbox.pending, isNull);
    },
  );
}

Future<void> _answerQuestion(WidgetTester tester, int position) async {
  expect(find.text('Question $position'), findsWidgets);
  await tester.tap(find.text('Answer $position'));
  await tester.pump(const Duration(milliseconds: 40));
  await tester.pumpAndSettle();

  expect(find.text('Server explanation $position'), findsOneWidget);
  final action = position == 10 ? 'FINISH ISSUE' : 'NEXT QUESTION';
  await tester.tap(find.text(action));
  await tester.pumpAndSettle();
}

GoRouter _router() => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (_, __) => const HomeGateFlow(),
        ),
        GoRoute(
          path: '/quiz',
          name: 'quiz',
          builder: (_, __) => const QuizGateFlow(),
        ),
        GoRoute(
          path: '/daily-result',
          name: 'daily-result',
          builder: (_, __) => const DailyResultGateFlow(),
        ),
        GoRoute(
          path: '/daily-limit',
          name: 'daily-limit',
          builder: (_, __) => const DailyLimitFlow(),
        ),
        GoRoute(
          path: '/rating',
          name: 'rating',
          builder: (_, __) => const Scaffold(body: Text('Rating')),
        ),
        GoRoute(
          path: '/profile/review',
          name: 'profile-review',
          builder: (_, __) => const Scaffold(body: Text('Review')),
        ),
        GoRoute(
          path: '/profile/settings/subscription',
          builder: (_, __) => const Scaffold(body: Text('Subscription')),
        ),
        GoRoute(
          path: '/question-report/:attemptId',
          name: 'question-report',
          builder: (_, state) => Scaffold(
            body: Text('Report ${state.pathParameters['attemptId']}'),
          ),
        ),
      ],
    );

class _DailyEditionScenarioRepository implements DailyEditionRepository {
  static const mainQuestions = 10;
  static const previewQuestions = 10;

  var _started = false;
  var _resolved = 0;
  var _summaryAcknowledged = false;
  var _clientEventSequence = 0;
  var acknowledgeCalls = 0;
  final submittedPositions = <int>[];

  String nextClientEventId() => 'event-${++_clientEventSequence}';

  DailyRunEntity get _run => DailyRunEntity(
        runId: 'run-1',
        editionDate: '2026-10-16',
        status: _resolved >= mainQuestions
            ? DailyRunStatus.completed
            : DailyRunStatus.inProgress,
        startedAt: _started ? _serverTime : null,
        closesAt: _closesAt,
        graceEndsAt: _closesAt.add(const Duration(hours: 1)),
        requiredCount: mainQuestions,
        resolvedCount: _resolved > mainQuestions ? mainQuestions : _resolved,
        ratingAtOpen: 1200,
        topics: const [
          DailyTopicEntity(id: 'general', name: 'General knowledge'),
        ],
      );

  DailyAssignmentEntity get _currentAssignment {
    final position = _resolved + 1;
    return DailyAssignmentEntity(
      assignmentId: 'assignment-$position',
      questionId: 'question-$position',
      questionVersionId: 'version-$position',
      position: position,
      kind: position <= mainQuestions
          ? DailyAssignmentKind.main
          : DailyAssignmentKind.bonus,
      topic: 'General knowledge',
      text: 'Question $position',
      answers: [
        DailyAssignmentAnswerEntity(
          id: 'answer-$position',
          text: 'Answer $position',
        ),
      ],
      hintUsed: false,
    );
  }

  DailyContinuationEntity get _continuation {
    final bonusServed = _resolved <= mainQuestions ? 0 : _resolved - 10;
    final remaining = previewQuestions - bonusServed;
    return DailyContinuationEntity(
      runId: 'run-1',
      serverTime: _serverTime,
      closesAt: _closesAt,
      nextAction: remaining > 0
          ? DailyContinuationAction.playQuestion
          : DailyContinuationAction.limitReached,
      quizPlus: false,
      accessReason: DailyContinuationAccessReason.marketPreview,
      marketPreviewQuestions: previewQuestions,
      bonusQuestionsGranted: previewQuestions,
      bonusQuestionsServed: bonusServed,
      bonusQuestionsRemaining: remaining,
      questionsPerReward: 5,
      rewardedVideosUsed: 0,
      rewardedVideosMax: 6,
      rewardedVideosRemaining: 6,
      rollingVideosUsed: 0,
      rollingVideosMax: 6,
      rewardedAdAvailable: false,
      rewardedAdNextAvailableAt: null,
    );
  }

  DailySummaryEntity get _summary => DailySummaryEntity(
        runId: 'run-1',
        editionDate: '2026-10-16',
        status: DailyRunStatus.completed,
        requiredCount: mainQuestions,
        resolvedCount: mainQuestions,
        correctCount: mainQuestions,
        skippedCount: 0,
        hintCount: 0,
        answerXp: 100,
        completionXp: 25,
        totalXp: 125,
        bonusGranted: previewQuestions,
        bonusServed: _continuation.bonusQuestionsServed,
        summaryAcknowledged: _summaryAcknowledged,
        ratingBefore: 1200,
        ratingAfter: 1210,
        ratingDelta: 10,
        accuracy: 1,
        percentile: 98,
        streakBefore: 4,
        streakAfter: 5,
        streakDelta: 1,
        seasonRankBefore: 20,
        seasonRankAfter: 17,
        seasonRankDelta: -3,
        topicResults: const [
          DailyTopicResultEntity(
            topicId: 'general',
            topic: 'General knowledge',
            correctCount: mainQuestions,
            totalCount: mainQuestions,
          ),
        ],
        continuation: _continuation,
      );

  @override
  Future<Result<DailyRunEntity, Failure>> open({String? timezoneId}) async {
    expectSync(timezoneId, anyOf(isNull, 'Asia/Yekaterinburg'));
    return Result.ok(_run);
  }

  @override
  Future<Result<DailyRunEntity, Failure>> start(String runId) async {
    expectSync(runId, 'run-1');
    _started = true;
    return Result.ok(_run);
  }

  @override
  Future<Result<DailyAssignmentEntity, Failure>> fetchCurrent(
    String runId,
  ) async {
    expectSync(runId, 'run-1');
    if (_resolved < mainQuestions + previewQuestions) {
      return Result.ok(_currentAssignment);
    }
    return const Result.failed(
      Failure.network(
        NetworkFailureReason.badResponse(
          'Daily run is complete',
          statusCode: 409,
          errorCode: 'DAILY_RUN_COMPLETE',
        ),
      ),
    );
  }

  @override
  Future<Result<DailyAttemptEntity, Failure>> submitAttempt({
    required String runId,
    required String assignmentId,
    required String clientEventId,
    required DailyAttemptAction action,
    String? answerId,
  }) async {
    final position = _resolved + 1;
    expectSync(runId, 'run-1');
    expectSync(assignmentId, 'assignment-$position');
    expectSync(clientEventId, 'event-$position');
    expectSync(action, DailyAttemptAction.answer);
    expectSync(answerId, 'answer-$position');
    _resolved = position;
    submittedPositions.add(position);
    return Result.ok(
      DailyAttemptEntity(
        clientEventId: clientEventId,
        attemptId: 'attempt-$position',
        assignmentId: assignmentId,
        questionVersionId: 'version-$position',
        action: action,
        isCorrect: true,
        answerId: answerId,
        correctAnswerId: answerId,
        description: 'Server explanation $position',
        hintUsed: false,
        xpAwarded: 10,
        ratingBefore: 1199 + position,
        ratingAfter: 1200 + position,
        ratingDelta: 1,
        provisional: false,
        runCompleted: position == mainQuestions,
        partner: null,
      ),
    );
  }

  @override
  Future<Result<DailySummaryEntity, Failure>> fetchSummary(String runId) async {
    expectSync(runId, 'run-1');
    return Result.ok(_summary);
  }

  @override
  Future<Result<DailySummaryEntity, Failure>> acknowledgeSummary(
    String runId,
  ) async {
    expectSync(runId, 'run-1');
    acknowledgeCalls += 1;
    _summaryAcknowledged = true;
    return Result.ok(_summary);
  }

  @override
  Future<Result<DailyContinuationEntity, Failure>> fetchContinuation(
    String runId,
  ) async {
    expectSync(runId, 'run-1');
    return Result.ok(_continuation);
  }

  @override
  Future<Result<DailyRunEntity, Failure>> close(String runId) async =>
      Result.ok(_run);

  @override
  Future<Result<DailyHintEntity, Failure>> useHint({
    required String runId,
    required String assignmentId,
  }) async =>
      Result.ok(
        DailyHintEntity(assignmentId: assignmentId, hint: 'Scenario hint'),
      );

  @override
  Future<Result<DailyAssignmentEntity, Failure>> reserveReviewReplacement({
    required String runId,
    required String clientEventId,
    required String sourceAttemptId,
  }) async =>
      Result.ok(_currentAssignment);

  @override
  Future<Result<DailyContinuationEntity, Failure>> confirmDebugRewardedAd({
    required String runId,
    required String clientEventId,
  }) async =>
      Result.ok(_continuation);
}

class _MemoryDailyAttemptOutbox implements DailyAttemptOutbox {
  PendingDailyAttemptEntity? pending;
  var savedCount = 0;
  var clearedCount = 0;

  @override
  Future<PendingDailyAttemptEntity?> load({required String accountId}) async =>
      pending?.accountId == accountId ? pending : null;

  @override
  Future<void> save(PendingDailyAttemptEntity attempt) async {
    pending = attempt;
    savedCount += 1;
  }

  @override
  Future<void> clear({
    required String accountId,
    required String clientEventId,
  }) async {
    expectSync(pending?.accountId, accountId);
    expectSync(pending?.clientEventId, clientEventId);
    pending = null;
    clearedCount += 1;
  }
}

class _ScenarioGamificationRepository implements GamificationRepository {
  const _ScenarioGamificationRepository();

  @override
  Future<Result<UserLevelEntity, Failure>> fetchLevel() async =>
      const Result.ok(_level);
}

class _UnavailableRewardedAds implements RewardedAdsGateway {
  const _UnavailableRewardedAds();

  @override
  bool get available => false;

  @override
  Future<void> initializeConsent() async {}

  @override
  Future<bool> privacyOptionsRequired() async => false;

  @override
  Future<void> showPrivacyOptions() async {}

  @override
  Future<RewardedAdShowOutcome> showRewarded({
    required String userId,
    required String runId,
    required String clientEventId,
  }) async =>
      RewardedAdShowOutcome.unavailable;
}

class _NoopProductAnalytics implements ProductAnalytics {
  const _NoopProductAnalytics();

  @override
  bool get consentDecided => false;

  @override
  bool get consentGranted => false;

  @override
  bool get enabled => false;

  @override
  Future<void> capture(
    ProductAnalyticsEvent event, {
    Map<String, Object> properties = const {},
  }) async {}

  @override
  Future<void> identify(String userId) async {}

  @override
  Future<void> initialize() async {}

  @override
  Future<void> resetIdentity() async {}

  @override
  Future<void> screen(String routeName) async {}

  @override
  Future<bool> setConsent(bool granted) async => granted;
}

const _level = UserLevelEntity(
  level: 4,
  experience: 400,
  experienceInLevel: 40,
  levelExperience: 100,
  totalPoints: 900,
  questionsAnswered: 80,
  correctAnswers: 60,
  accuracy: 0.75,
  streakDays: 4,
  bestStreakDays: 8,
  streakNotice: null,
);

final _user = UserEntity(
  id: 'user-1',
  email: 'player@example.test',
  name: 'Player',
  timezoneId: 'Asia/Yekaterinburg',
  level: 4,
  experienceInLevel: 40,
  levelExperience: 100,
  streakDays: 4,
  bestStreakDays: 8,
  questionsAnswered: 80,
  correctAnswers: 60,
  accuracy: 0.75,
  totalPoints: 900,
  memberSince: DateTime.utc(2026, 1, 1),
  achievementsUnlocked: 3,
  achievementsTotal: 12,
);

final _serverTime = DateTime.utc(2026, 10, 16, 12);
// 04:00 in the account timezone (Asia/Yekaterinburg, UTC+05:00).
final _closesAt = DateTime.utc(2026, 10, 16, 23);
