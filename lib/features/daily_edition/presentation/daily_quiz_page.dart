import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/utils/open_daily_limit.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_question_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/partner_interaction_provider.dart';
import 'package:quiz/features/daily_edition/presentation/widgets/daily_hint_panel.dart';
import 'package:quiz/features/daily_edition/presentation/widgets/partner_recommendation_block.dart';
import 'package:quiz/features/daily_edition/domain/service/partner_interaction_tracker.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/answer_reveal_bottom_sheet.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_body.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_motion.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/features/home/presentation/widgets/start_day_header.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/presentation/question_answer_state.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyQuizPage extends ConsumerStatefulWidget {
  const DailyQuizPage({super.key});

  @override
  ConsumerState<DailyQuizPage> createState() => _DailyQuizPageState();
}

class _DailyQuizPageState extends ConsumerState<DailyQuizPage>
    with WidgetsBindingObserver {
  String? _scheduledAttemptId;
  String? _presentedAttemptId;
  String? _offlineNoticeAssignmentId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    unawaited(_synchronizeAfterResume());
  }

  Future<void> _synchronizeAfterResume() async {
    unawaited(ref.read(gamificationProvider.notifier).fetch());
    final timezoneId = ref.read(authenticationProvider).mapOrNull(
          authenticated: (state) => state.user?.timezoneId,
        );
    final editionState = ref.read(dailyEditionProvider);
    if (editionState case DailyEditionFailedState(:final failure)
        when quizConnectionErrorKind(failure) != null) {
      await ref.read(dailyEditionProvider.notifier).bootstrap(
            timezoneId: timezoneId,
            preserveCurrentState: true,
          );
      return;
    }
    final notifier = ref.read(dailyEditionProvider.notifier);
    final retriedPendingAttempt = await notifier.retryPendingAttempt();
    if (!mounted || retriedPendingAttempt) return;
    await notifier.synchronizeActiveRun(timezoneId: timezoneId);
  }

  @override
  Widget build(BuildContext context) {
    final editionState = ref.watch(dailyEditionProvider);
    final answerState = ref.watch(dailyQuestionProvider);
    final gamification = ref.watch(gamificationProvider);
    final palette = context.palette;
    final connectionError = switch (editionState) {
      DailyEditionFailedState(:final failure) =>
        quizConnectionErrorKind(failure),
      _ => null,
    };

    ref.listen(dailyEditionProvider, (_, next) {
      if (next case DailyEditionActiveState(:final run)
          when run.startedAt == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted && ModalRoute.of(context)?.isCurrent == true) {
            context.goNamed('home');
          }
        });
      } else if (next case DailyEditionSummaryState(:final summary)) {
        _scheduleSummaryNavigation(summary.summaryAcknowledged);
      }
    });
    _listenForReveal(ref, answerState);
    _listenForOfflineFailure(ref, answerState);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: palette.background.static,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StartDayHeader(
                streak: gamification.whenOrNull(
                      data: (data) => data.streakDays,
                    ) ??
                    0,
                level: gamification.whenOrNull(data: (data) => data.level),
                subtitle: context.t.onboarding.daily_issue,
                showBadges: connectionError == null,
              ),
              AppDivider(indent: 22, endIndent: 22),
              Expanded(
                child: _buildBody(
                  ref,
                  editionState: editionState,
                  answerState: answerState,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    WidgetRef ref, {
    required DailyEditionState editionState,
    required QuestionAnswerState answerState,
  }) {
    return switch (editionState) {
      DailyEditionInitialState() ||
      DailyEditionLoadingState() =>
        const QuizLoading(),
      DailyEditionFailedState(:final failure) => switch (
            quizConnectionErrorKind(failure)) {
          final kind? => QuizConnectionError(
              kind: kind,
              onRetry: () => _retryBootstrap(ref),
            ),
          null => QuizError(failure: failure),
        },
      DailyEditionSummaryState() => const QuizLoading(),
      DailyEditionActiveState(
        :final run,
        :final assignment,
        :final hint,
        :final isBusy,
      ) =>
        switch (assignment.toQuestionEntity()) {
          final QuestionEntity question => Column(
              children: [
                Expanded(
                  child: QuizBody(
                    question: question,
                    answerState: answerState,
                    questionNumber: assignment.position,
                    totalQuestions: run.requiredCount,
                    onSelect: !isBusy &&
                            (answerState is QuestionAnswerWaitingState ||
                                answerState is QuestionAnswerSelectedState)
                        ? ref.read(dailyQuestionProvider.notifier).select
                        : null,
                    questionSupplement: DailyHintPanel(
                      hintUsed: assignment.hintUsed,
                      hint: hint?.hint,
                      obscuredText: question.question,
                      enabled:
                          !isBusy && answerState is QuestionAnswerWaitingState,
                      onUseHint:
                          ref.read(dailyEditionProvider.notifier).useHint,
                    ),
                  ),
                ),
              ],
            ),
          null => QuizError(
              failure: Failure.unknown(
                StateError('Daily assignment content is unavailable'),
              ),
            ),
        },
    };
  }

  Future<void> _retryBootstrap(WidgetRef ref) async {
    final timezoneId = ref.read(authenticationProvider).mapOrNull(
          authenticated: (state) => state.user?.timezoneId,
        );
    await Future.wait([
      ref.read(gamificationProvider.notifier).fetch(),
      ref.read(dailyEditionProvider.notifier).bootstrap(
            timezoneId: timezoneId,
            preserveCurrentState: true,
          ),
    ]);
  }

  void _listenForReveal(
    WidgetRef ref,
    QuestionAnswerState currentState,
  ) {
    if (currentState case final QuestionAnswerSentState sentState) {
      _scheduleReveal(ref, sentState);
    }
    ref.listen(
      dailyQuestionProvider.select(
        (state) => state is QuestionAnswerSentState ? state : null,
      ),
      (_, sentState) {
        if (sentState != null) _scheduleReveal(ref, sentState);
      },
    );
  }

  void _listenForOfflineFailure(
    WidgetRef ref,
    QuestionAnswerState currentState,
  ) {
    if (currentState case final QuestionAnswerFailedState failedState) {
      _scheduleOfflineNotice(ref, failedState);
    }
    ref.listen(
      dailyQuestionProvider.select(
        (state) => state is QuestionAnswerFailedState ? state : null,
      ),
      (_, failedState) {
        if (failedState != null) _scheduleOfflineNotice(ref, failedState);
      },
    );
  }

  void _scheduleOfflineNotice(
    WidgetRef ref,
    QuestionAnswerFailedState failedState,
  ) {
    if (quizConnectionErrorKind(failedState.failure) == null) return;
    final editionState = ref.read(dailyEditionProvider);
    if (editionState is! DailyEditionActiveState) return;
    final assignmentId = editionState.assignment.assignmentId;
    if (_offlineNoticeAssignmentId == assignmentId) return;
    _offlineNoticeAssignmentId = assignmentId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final latestState = ref.read(dailyEditionProvider);
      final latestAnswerState = ref.read(dailyQuestionProvider);
      if (latestState is! DailyEditionActiveState ||
          latestState.assignment.assignmentId != assignmentId ||
          latestAnswerState is! QuestionAnswerFailedState ||
          quizConnectionErrorKind(latestAnswerState.failure) == null) {
        return;
      }
      AppSnackBar.showOffline(
        context,
        title: context.t.question.error_snackbar.offline.title,
        message: context.t.question.error_snackbar.offline.message,
      );
    });
  }

  void _scheduleReveal(
    WidgetRef ref,
    QuestionAnswerSentState sentState,
  ) {
    final editionState = ref.read(dailyEditionProvider);
    if (editionState is! DailyEditionActiveState) return;
    final attemptId = editionState.attempt?.attemptId;
    if (attemptId == null ||
        _scheduledAttemptId == attemptId ||
        _presentedAttemptId == attemptId) {
      return;
    }
    _scheduledAttemptId = attemptId;
    unawaited(_presentRevealWhenReady(ref, sentState, attemptId));
  }

  Future<void> _presentRevealWhenReady(
    WidgetRef ref,
    QuestionAnswerSentState sentState,
    String attemptId,
  ) async {
    for (var frame = 0; frame < 120; frame++) {
      await Future<void>.delayed(const Duration(milliseconds: 16));
      if (!mounted) {
        _scheduledAttemptId = null;
        return;
      }
      final latestState = ref.read(dailyEditionProvider);
      if (latestState is! DailyEditionActiveState ||
          latestState.attempt?.attemptId != attemptId) {
        _scheduledAttemptId = null;
        return;
      }
      if (ModalRoute.of(context)?.isCurrent != true) continue;
      final question = latestState.assignment.toQuestionEntity();
      if (question == null) {
        _scheduledAttemptId = null;
        return;
      }
      _scheduledAttemptId = null;
      _presentedAttemptId = attemptId;
      unawaited(ref.read(gamificationProvider.notifier).fetch());
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      await _showAnswerRevealSheet(
        context,
        question: question,
        sentState: sentState,
        ratingDelta: latestState.attempt?.ratingDelta,
        partnerBlock: _partnerBlock(ref, latestState),
        isFinalAction: latestState.attempt?.runCompleted == true &&
            !ref.read(dailyEditionProvider.notifier).hasPendingReview,
        onNext: () => _advanceFromReveal(ref),
      );
      if (ref.read(dailyEditionProvider)
          case DailyEditionSummaryState(:final summary)) {
        _scheduleSummaryNavigation(summary.summaryAcknowledged);
      }
      return;
    }
    _scheduledAttemptId = null;
  }

  Future<void> _showAnswerRevealSheet(
    BuildContext context, {
    required QuestionEntity question,
    required QuestionAnswerSentState sentState,
    required int? ratingDelta,
    required Widget? partnerBlock,
    required bool isFinalAction,
    required Future<AnswerRevealFailure?> Function() onNext,
  }) async {
    final palette = context.palette;
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      barrierColor: palette.bottomSheet.scrim,
      backgroundColor: palette.bottomSheet.background,
      shape: const RoundedRectangleBorder(),
      sheetAnimationStyle: const AnimationStyle(
        duration: answerRevealTransitionDuration,
        reverseDuration: answerRevealTransitionDuration,
      ),
      builder: (sheetContext) => SafeArea(
        top: false,
        child: AnswerRevealBottomSheet(
          question: question,
          sentState: sentState,
          ratingDelta: ratingDelta,
          partnerBlock: partnerBlock,
          isFinalAction: isFinalAction,
          onNext: () async {
            final errorMessage = await onNext();
            if (errorMessage == null && sheetContext.mounted) {
              Navigator.of(sheetContext).pop();
            }
            return errorMessage;
          },
        ),
      ),
    );
  }

  Future<AnswerRevealFailure?> _advanceFromReveal(WidgetRef ref) async {
    final advanced = await ref.read(dailyEditionProvider.notifier).advance();
    if (advanced || !mounted) return null;

    final failure = switch (ref.read(dailyEditionProvider)) {
      DailyEditionActiveState(:final failure) => failure,
      DailyEditionFailedState(:final failure) => failure,
      DailyEditionSummaryState(:final failure) => failure,
      _ => null,
    };
    return switch (failure == null ? null : quizConnectionErrorKind(failure)) {
      QuizConnectionErrorKind.noInternet => AnswerRevealFailure(
          title: context.t.question.state.no_internet.title,
          message: context.t.question.state.no_internet.message,
          kind: AnswerRevealFailureKind.offline,
        ),
      QuizConnectionErrorKind.serverUnavailable => AnswerRevealFailure(
          title: context.t.question.state.server_unavailable.title,
          message: context.t.question.state.server_unavailable.message,
          kind: AnswerRevealFailureKind.error,
        ),
      null => AnswerRevealFailure(
          title: context.t.question.answer_reveal.continue_error_title,
          message: context.t.question.answer_reveal.continue_error,
          kind: AnswerRevealFailureKind.error,
        ),
    };
  }

  void _scheduleSummaryNavigation(bool summaryAcknowledged) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted ||
          ModalRoute.of(context)?.isCurrent != true ||
          Navigator.of(context, rootNavigator: true).canPop()) {
        return;
      }
      if (summaryAcknowledged) {
        openDailyLimit(context);
      } else {
        context.goNamed('daily-result');
      }
    });
  }

  Widget? _partnerBlock(WidgetRef ref, DailyEditionActiveState state) {
    final attempt = state.attempt;
    final partner = attempt?.partner;
    if (attempt == null || partner == null) return null;
    return PartnerRecommendationBlock(
      partner: partner,
      interaction: PartnerInteraction(
        campaignId: partner.campaignId,
        attemptId: attempt.attemptId,
      ),
      tracker: ref.read(partnerInteractionTrackerProvider),
      launcher: ref.read(partnerLinkLauncherProvider),
    );
  }
}
