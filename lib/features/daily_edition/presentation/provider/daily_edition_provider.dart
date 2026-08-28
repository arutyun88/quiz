import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/observability/domain/app_error_reporter.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/entity/pending_daily_attempt_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';
import 'package:quiz/features/daily_edition/domain/service/daily_attempt_outbox.dart';
import 'package:uuid/uuid.dart';

final dailyEditionProvider =
    StateNotifierProvider.autoDispose<DailyEditionNotifier, DailyEditionState>(
        (ref) {
  final accountId = ref.watch(authenticationProvider).mapOrNull(
        authenticated: (state) => state.user?.id,
      );
  return DailyEditionNotifier(
    accountId: accountId,
    repository: getIt<DailyEditionRepository>(),
    outbox: getIt<DailyAttemptOutbox>(),
    analytics: getIt<ProductAnalytics>(),
    errorReporter: getIt<AppErrorReporter>(),
  );
});

sealed class DailyEditionState {
  const DailyEditionState();
}

final class DailyEditionInitialState extends DailyEditionState {
  const DailyEditionInitialState();
}

final class DailyEditionLoadingState extends DailyEditionState {
  const DailyEditionLoadingState();
}

final class DailyEditionActiveState extends DailyEditionState {
  const DailyEditionActiveState({
    required this.run,
    required this.assignment,
    this.hint,
    this.attempt,
    this.isBusy = false,
    this.failure,
  });

  final DailyRunEntity run;
  final DailyAssignmentEntity assignment;
  final DailyHintEntity? hint;
  final DailyAttemptEntity? attempt;
  final bool isBusy;
  final Failure? failure;

  DailyEditionActiveState copyWith({
    DailyAssignmentEntity? assignment,
    DailyHintEntity? hint,
    DailyAttemptEntity? attempt,
    bool? isBusy,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      DailyEditionActiveState(
        run: run,
        assignment: assignment ?? this.assignment,
        hint: hint ?? this.hint,
        attempt: attempt ?? this.attempt,
        isBusy: isBusy ?? this.isBusy,
        failure: clearFailure ? null : failure ?? this.failure,
      );
}

final class DailyEditionSummaryState extends DailyEditionState {
  const DailyEditionSummaryState({
    required this.run,
    required this.summary,
    this.latestAttempt,
    this.isBusy = false,
    this.failure,
  });

  final DailyRunEntity run;
  final DailySummaryEntity summary;
  final DailyAttemptEntity? latestAttempt;
  final bool isBusy;
  final Failure? failure;

  DailyEditionSummaryState copyWith({
    DailySummaryEntity? summary,
    bool? isBusy,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      DailyEditionSummaryState(
        run: run,
        summary: summary ?? this.summary,
        latestAttempt: latestAttempt,
        isBusy: isBusy ?? this.isBusy,
        failure: clearFailure ? null : failure ?? this.failure,
      );
}

final class DailyEditionFailedState extends DailyEditionState {
  const DailyEditionFailedState({required this.failure, this.run});

  final Failure failure;
  final DailyRunEntity? run;
}

class DailyEditionNotifier extends StateNotifier<DailyEditionState> {
  DailyEditionNotifier({
    required String? accountId,
    required DailyEditionRepository repository,
    required DailyAttemptOutbox outbox,
    String Function()? clientEventIdFactory,
    DateTime Function()? now,
    Future<void> Function(Duration)? delay,
    ProductAnalytics? analytics,
    AppErrorReporter? errorReporter,
  })  : _accountId = accountId,
        _repository = repository,
        _outbox = outbox,
        _clientEventIdFactory =
            clientEventIdFactory ?? (() => const Uuid().v4()),
        _now = now ?? DateTime.now,
        _delay = delay ?? Future.delayed,
        _analytics = analytics,
        _errorReporter = errorReporter,
        super(const DailyEditionInitialState());

  final String? _accountId;
  final DailyEditionRepository _repository;
  final DailyAttemptOutbox _outbox;
  final String Function() _clientEventIdFactory;
  final DateTime Function() _now;
  final Future<void> Function(Duration) _delay;
  final ProductAnalytics? _analytics;
  final AppErrorReporter? _errorReporter;
  bool _bootstrapping = false;

  /// Opens or restores the account's authoritative run. The server decides the
  /// edition date and returns the same active run on a new process or device.
  Future<void> bootstrap({String? timezoneId}) async {
    if (_bootstrapping) return;
    final accountId = _accountId;
    if (accountId == null) {
      state = const DailyEditionFailedState(
        failure: Failure.authentication(
          AuthenticationFailureType.unauthenticated,
        ),
      );
      return;
    }
    _bootstrapping = true;
    state = const DailyEditionLoadingState();
    try {
      final result = await _repository.open(timezoneId: timezoneId);
      switch (result) {
        case ResultOk(data: final run):
          unawaited(
            _analytics?.capture(
                  ProductAnalyticsEvent.dailyEditionOpened,
                  properties: {'run_status': run.status.name},
                ) ??
                Future.value(),
          );
          await _restoreOrLoadRun(accountId, run);
        case ResultFailed(error: final failure):
          state = DailyEditionFailedState(failure: failure);
      }
    } finally {
      _bootstrapping = false;
    }
  }

  /// Opens the server-owned run and reserves an unseen question related to an
  /// incorrect historical attempt. The server owns both source validation and
  /// continuation capacity; this client never grants a local allowance.
  Future<void> bootstrapReviewReplacement({
    required String sourceAttemptId,
    String? timezoneId,
  }) async {
    if (_bootstrapping) return;
    final accountId = _accountId;
    if (accountId == null) {
      state = const DailyEditionFailedState(
        failure: Failure.authentication(
          AuthenticationFailureType.unauthenticated,
        ),
      );
      return;
    }
    _bootstrapping = true;
    state = const DailyEditionLoadingState();
    try {
      final openResult = await _repository.open(timezoneId: timezoneId);
      switch (openResult) {
        case ResultOk(data: final run):
          final result = await _repository.reserveReviewReplacement(
            runId: run.runId,
            clientEventId: _clientEventIdFactory(),
            sourceAttemptId: sourceAttemptId,
          );
          switch (result) {
            case ResultOk(data: final assignment):
              await _showAssignment(run, assignment);
            case ResultFailed(error: final failure):
              state = DailyEditionFailedState(failure: failure, run: run);
          }
        case ResultFailed(error: final failure):
          state = DailyEditionFailedState(failure: failure);
      }
    } finally {
      _bootstrapping = false;
    }
  }

  Future<void> useHint() async {
    final current = state;
    if (current is! DailyEditionActiveState ||
        current.isBusy ||
        current.attempt != null) {
      return;
    }

    state = current.copyWith(isBusy: true, clearFailure: true);
    final result = await _repository.useHint(
      runId: current.run.runId,
      assignmentId: current.assignment.assignmentId,
    );
    switch (result) {
      case ResultOk(data: final hint):
        state = current.copyWith(
          assignment: current.assignment.copyWith(hintUsed: true),
          hint: hint,
          isBusy: false,
          clearFailure: true,
        );
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
    }
  }

  Future<void> submitAttempt({
    required DailyAttemptAction action,
    String? answerId,
  }) async {
    final current = state;
    final accountId = _accountId;
    if (current is! DailyEditionActiveState ||
        accountId == null ||
        current.isBusy ||
        current.attempt != null) {
      return;
    }

    state = current.copyWith(isBusy: true, clearFailure: true);
    final pending = PendingDailyAttemptEntity(
      accountId: accountId,
      runId: current.run.runId,
      assignmentId: current.assignment.assignmentId,
      clientEventId: _clientEventIdFactory(),
      action: action,
      answerId: answerId,
      createdAt: _now().toUtc(),
    );
    try {
      await _outbox.save(pending);
    } on Object catch (error, stackTrace) {
      _report(error, stackTrace, 'daily_attempt_outbox_save');
      state = current.copyWith(
        isBusy: false,
        failure: Failure.unknown(error),
      );
      return;
    }
    await _sendPending(current, pending);
  }

  Future<void> retryPendingAttempt() async {
    final current = state;
    final accountId = _accountId;
    if (current is! DailyEditionActiveState ||
        accountId == null ||
        current.isBusy ||
        current.attempt != null) {
      return;
    }

    try {
      final pending = await _outbox.load(accountId: accountId);
      if (pending == null) return;
      state = current.copyWith(isBusy: true, clearFailure: true);
      await _sendPending(current, pending);
    } on Object catch (error, stackTrace) {
      _report(error, stackTrace, 'daily_attempt_outbox_retry');
      state = current.copyWith(
        isBusy: false,
        failure: Failure.unknown(error),
      );
    }
  }

  Future<void> _sendPending(
    DailyEditionActiveState current,
    PendingDailyAttemptEntity pending,
  ) async {
    final result = await _repository.submitAttempt(
      runId: pending.runId,
      assignmentId: pending.assignmentId,
      clientEventId: pending.clientEventId,
      action: pending.action,
      answerId: pending.answerId,
    );
    switch (result) {
      case ResultOk(data: final attempt):
        try {
          await _outbox.clear(
            accountId: pending.accountId,
            clientEventId: pending.clientEventId,
          );
          state = current.copyWith(
            attempt: attempt,
            isBusy: false,
            clearFailure: true,
          );
          _trackAttempt(attempt, assignmentKind: current.assignment.kind);
        } on Object catch (error, stackTrace) {
          _report(error, stackTrace, 'daily_attempt_outbox_clear');
          state = current.copyWith(
            isBusy: false,
            failure: Failure.unknown(error),
          );
        }
      case ResultFailed(error: final failure)
          when _hasErrorCode(failure, 'ASSIGNMENT_NOT_CURRENT'):
        await _clearPendingAndLoadRun(current.run, pending);
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
    }
  }

  /// Leaves the authoritative reveal visible until the user advances. A
  /// completed attempt goes to the server summary; otherwise the next pinned
  /// assignment is requested from the server.
  Future<void> advance() async {
    final current = state;
    if (current is! DailyEditionActiveState ||
        current.isBusy ||
        current.attempt == null) {
      return;
    }

    state = current.copyWith(isBusy: true, clearFailure: true);
    if (current.attempt!.runCompleted) {
      await _loadSummary(current.run, latestAttempt: current.attempt);
      return;
    }

    final result = await _repository.fetchCurrent(current.run.runId);
    switch (result) {
      case ResultOk(data: final assignment):
        await _showAssignment(current.run, assignment);
      case ResultFailed(error: final failure) when _isDailyRunComplete(failure):
        await _loadSummary(current.run, latestAttempt: current.attempt);
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
    }
  }

  Future<void> closeDuringGrace() async {
    final current = state;
    if (current is! DailyEditionActiveState || current.isBusy) return;

    state = current.copyWith(isBusy: true, clearFailure: true);
    final result = await _repository.close(current.run.runId);
    switch (result) {
      case ResultOk(data: final run):
        await _loadSummary(run, latestAttempt: current.attempt);
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
    }
  }

  Future<void> refreshContinuation() async {
    final current = state;
    if (current is! DailyEditionSummaryState || current.isBusy) return;

    state = current.copyWith(isBusy: true, clearFailure: true);
    final result = await _repository.fetchContinuation(current.run.runId);
    switch (result) {
      case ResultOk(data: final continuation):
        state = current.copyWith(
          summary: current.summary.copyWith(continuation: continuation),
          isBusy: false,
          clearFailure: true,
        );
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
    }
  }

  Future<void> continueEdition() async {
    final current = state;
    if (current is! DailyEditionSummaryState ||
        current.isBusy ||
        current.summary.continuation.nextAction !=
            DailyContinuationAction.playQuestion) {
      return;
    }

    state = current.copyWith(isBusy: true, clearFailure: true);
    final result = await _repository.fetchCurrent(current.run.runId);
    switch (result) {
      case ResultOk(data: final assignment):
        await _showAssignment(current.run, assignment);
      case ResultFailed(error: final failure) when _isDailyRunComplete(failure):
        await _loadSummary(current.run, latestAttempt: current.latestAttempt);
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
    }
  }

  Future<bool> waitForRewardedAdConfirmation({
    required int previousRewardedVideosUsed,
    int maxAttempts = 10,
  }) async {
    final current = state;
    if (current is! DailyEditionSummaryState || current.isBusy) {
      return false;
    }
    if (current.summary.continuation.rewardedVideosUsed >
        previousRewardedVideosUsed) {
      return true;
    }

    state = current.copyWith(isBusy: true, clearFailure: true);
    var latest = current;
    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      final result = await _repository.fetchContinuation(current.run.runId);
      switch (result) {
        case ResultOk(data: final continuation):
          latest = latest.copyWith(
            summary: latest.summary.copyWith(continuation: continuation),
            isBusy: true,
            clearFailure: true,
          );
          state = latest;
          if (continuation.rewardedVideosUsed > previousRewardedVideosUsed) {
            state = latest.copyWith(isBusy: false, clearFailure: true);
            return true;
          }
        case ResultFailed(error: final failure):
          state = latest.copyWith(isBusy: false, failure: failure);
          return false;
      }
      if (attempt + 1 < maxAttempts) {
        await _delay(const Duration(seconds: 1));
      }
    }
    state = latest.copyWith(isBusy: false, clearFailure: true);
    return false;
  }

  Future<void> _loadRun(DailyRunEntity run) async {
    switch (run.status) {
      case DailyRunStatus.inProgress:
        final result = await _repository.fetchCurrent(run.runId);
        switch (result) {
          case ResultOk(data: final assignment):
            await _showAssignment(run, assignment);
          case ResultFailed(error: final failure)
              when _isDailyRunComplete(failure):
            await _loadSummary(run);
          case ResultFailed(error: final failure):
            state = DailyEditionFailedState(failure: failure, run: run);
        }
      case DailyRunStatus.completed:
      case DailyRunStatus.abandoned:
      case DailyRunStatus.expired:
      case DailyRunStatus.systemProtected:
        await _loadSummary(run);
      case DailyRunStatus.unknown:
        state = DailyEditionFailedState(
          run: run,
          failure: Failure.unknown(
            StateError('Unsupported Daily Edition status'),
          ),
        );
    }
  }

  Future<void> _showAssignment(
    DailyRunEntity run,
    DailyAssignmentEntity assignment,
  ) async {
    if (!assignment.hintUsed) {
      state = DailyEditionActiveState(run: run, assignment: assignment);
      return;
    }

    final result = await _repository.useHint(
      runId: run.runId,
      assignmentId: assignment.assignmentId,
    );
    switch (result) {
      case ResultOk(data: final hint):
        state = DailyEditionActiveState(
          run: run,
          assignment: assignment,
          hint: hint,
        );
      case ResultFailed(error: final failure):
        state = DailyEditionActiveState(
          run: run,
          assignment: assignment,
          failure: failure,
        );
    }
  }

  Future<void> _restoreOrLoadRun(
    String accountId,
    DailyRunEntity run,
  ) async {
    final PendingDailyAttemptEntity? pending;
    try {
      pending = await _outbox.load(accountId: accountId);
    } on Object catch (error, stackTrace) {
      _report(error, stackTrace, 'daily_attempt_outbox_restore');
      state = DailyEditionFailedState(
        run: run,
        failure: Failure.unknown(error),
      );
      return;
    }

    if (pending == null) {
      await _loadRun(run);
      return;
    }
    if (pending.runId != run.runId) {
      try {
        await _outbox.clear(
          accountId: accountId,
          clientEventId: pending.clientEventId,
        );
      } on Object catch (error, stackTrace) {
        _report(error, stackTrace, 'daily_attempt_outbox_drop_stale');
        state = DailyEditionFailedState(
          run: run,
          failure: Failure.unknown(error),
        );
        return;
      }
      await _loadRun(run);
      return;
    }

    final result = await _repository.submitAttempt(
      runId: pending.runId,
      assignmentId: pending.assignmentId,
      clientEventId: pending.clientEventId,
      action: pending.action,
      answerId: pending.answerId,
    );
    switch (result) {
      case ResultOk(data: final attempt):
        try {
          await _outbox.clear(
            accountId: accountId,
            clientEventId: pending.clientEventId,
          );
        } on Object catch (error, stackTrace) {
          _report(error, stackTrace, 'daily_attempt_outbox_replay_clear');
          state = DailyEditionFailedState(
            run: run,
            failure: Failure.unknown(error),
          );
          return;
        }
        if (attempt.runCompleted) {
          _trackAttempt(attempt);
          await _loadSummary(run, latestAttempt: attempt);
        } else {
          _trackAttempt(attempt);
          await _loadRun(run);
        }
      case ResultFailed(error: final failure)
          when _hasErrorCode(failure, 'ASSIGNMENT_NOT_CURRENT'):
        await _clearPendingAndLoadRun(run, pending);
      case ResultFailed(error: final failure):
        state = DailyEditionFailedState(failure: failure, run: run);
    }
  }

  Future<void> _clearPendingAndLoadRun(
    DailyRunEntity run,
    PendingDailyAttemptEntity pending,
  ) async {
    try {
      await _outbox.clear(
        accountId: pending.accountId,
        clientEventId: pending.clientEventId,
      );
    } on Object catch (error, stackTrace) {
      _report(error, stackTrace, 'daily_attempt_outbox_reconcile_clear');
      state = DailyEditionFailedState(
        run: run,
        failure: Failure.unknown(error),
      );
      return;
    }
    await _loadRun(run);
  }

  Future<void> _loadSummary(
    DailyRunEntity run, {
    DailyAttemptEntity? latestAttempt,
  }) async {
    final result = await _repository.fetchSummary(run.runId);
    switch (result) {
      case ResultOk(data: final summary):
        state = DailyEditionSummaryState(
          run: run,
          summary: summary,
          latestAttempt: latestAttempt,
        );
        unawaited(
          _analytics?.capture(
                ProductAnalyticsEvent.dailySummaryViewed,
                properties: {
                  'run_status': summary.status.name,
                  'resolved_count': summary.resolvedCount,
                  'correct_count': summary.correctCount,
                  'skipped_count': summary.skippedCount,
                  'hint_count': summary.hintCount,
                  'bonus_served': summary.bonusServed,
                },
              ) ??
              Future.value(),
        );
      case ResultFailed(error: final failure):
        state = DailyEditionFailedState(failure: failure, run: run);
    }
  }

  void _trackAttempt(
    DailyAttemptEntity attempt, {
    DailyAssignmentKind? assignmentKind,
  }) {
    unawaited(
      _analytics?.capture(
            ProductAnalyticsEvent.dailyAttemptAccepted,
            properties: {
              r'$insert_id': attempt.clientEventId,
              'action': attempt.action.name,
              'correct': attempt.isCorrect,
              'hint_used': attempt.hintUsed,
              'run_completed': attempt.runCompleted,
              if (assignmentKind != null)
                'assignment_kind': assignmentKind.name,
              if (attempt.ratingDelta != null)
                'rating_delta': attempt.ratingDelta!,
            },
          ) ??
          Future.value(),
    );
  }

  void _report(Object error, StackTrace stackTrace, String operation) {
    unawaited(
      _errorReporter?.captureException(
            error,
            stackTrace,
            operation: operation,
          ) ??
          Future.value(),
    );
  }
}

bool _isDailyRunComplete(Failure failure) =>
    _hasErrorCode(failure, 'DAILY_RUN_COMPLETE');

bool _hasErrorCode(Failure failure, String expected) => switch (failure) {
      NetworkFailure(
        reason: NetworkFailureBadResponseReason(errorCode: final errorCode),
      )
          when errorCode == expected =>
        true,
      _ => false,
    };
