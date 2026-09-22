import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/entity/pending_daily_attempt_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';
import 'package:quiz/features/daily_edition/domain/service/daily_attempt_outbox.dart';
import 'package:quiz/features/observability/domain/logger.dart';
import 'package:uuid/uuid.dart';

final dailyEditionProvider = StateNotifierProvider<DailyEditionNotifier, DailyEditionState>((ref) {
  final accountId = ref.watch(
    authenticationProvider.select(
      (state) => state.mapOrNull(
        authenticated: (state) => state.user?.id,
      ),
    ),
  );
  return DailyEditionNotifier(
    accountId: accountId,
    repository: getIt<DailyEditionRepository>(),
    outbox: getIt<DailyAttemptOutbox>(),
    connectivityService: getIt<ConnectivityService>(),
    analytics: getIt<ProductAnalytics>(),
  );
});

sealed class DailyEditionState {
  const DailyEditionState();
}

bool shouldResumeDailyEdition(DailyEditionState state) => switch (state) {
      DailyEditionActiveState(:final run) => run.startedAt != null,
      _ => false,
    };

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
    this.resumeContinuation = false,
    this.isBusy = false,
    this.failure,
  });

  final DailyRunEntity run;
  final DailySummaryEntity summary;
  final DailyAttemptEntity? latestAttempt;
  final bool resumeContinuation;
  final bool isBusy;
  final Failure? failure;

  DailyEditionSummaryState copyWith({
    DailySummaryEntity? summary,
    bool? resumeContinuation,
    bool? isBusy,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      DailyEditionSummaryState(
        run: run,
        summary: summary ?? this.summary,
        latestAttempt: latestAttempt,
        resumeContinuation: resumeContinuation ?? this.resumeContinuation,
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
    ConnectivityService? connectivityService,
    String Function()? clientEventIdFactory,
    DateTime Function()? now,
    Future<void> Function(Duration)? delay,
    Future<void> Function(Duration)? automaticRetryDelay,
    ProductAnalytics? analytics,
  })  : _accountId = accountId,
        _repository = repository,
        _outbox = outbox,
        _connectivityService = connectivityService,
        _clientEventIdFactory = clientEventIdFactory ?? (() => const Uuid().v4()),
        _now = now ?? DateTime.now,
        _delay = delay ?? Future.delayed,
        _automaticRetryDelay = automaticRetryDelay ?? Future.delayed,
        _analytics = analytics,
        super(const DailyEditionInitialState()) {
    _connectivitySubscription = connectivityService?.onStatusChange.listen(
      _handleConnectivityStatus,
    );
  }

  final String? _accountId;
  final DailyEditionRepository _repository;
  final DailyAttemptOutbox _outbox;
  final ConnectivityService? _connectivityService;
  final String Function() _clientEventIdFactory;
  final DateTime Function() _now;
  final Future<void> Function(Duration) _delay;
  final Future<void> Function(Duration) _automaticRetryDelay;
  final ProductAnalytics? _analytics;
  StreamSubscription<InternetStatus>? _connectivitySubscription;
  bool _bootstrapping = false;
  bool _automaticRetryRunning = false;
  bool _waitingForConnection = false;
  bool _disposed = false;
  int _automaticRetryGeneration = 0;
  int _serverRetryIndex = 0;
  String? _pendingReviewSource;
  bool get hasPendingReview => _pendingReviewSource != null;

  static const _serverRetryDelays = <Duration>[
    Duration(seconds: 2),
    Duration(seconds: 5),
    Duration(seconds: 10),
    Duration(seconds: 30),
  ];

  /// Opens or restores the account's authoritative run. The server decides the
  /// edition date and returns the same active run on a new process or device.
  Future<void> bootstrap({
    String? timezoneId,
    bool preserveCurrentState = false,
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
    if (!preserveCurrentState) {
      state = const DailyEditionLoadingState();
    }
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
    _pendingReviewSource = sourceAttemptId;
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
              _pendingReviewSource = null;
              await _showAssignment(run, assignment);
            case ResultFailed(error: final failure) when _isDailyRunComplete(failure):
              final acknowledged = await _repository.acknowledgeSummary(run.runId);
              switch (acknowledged) {
                case ResultOk(data: final summary):
                  state = DailyEditionSummaryState(
                    run: run,
                    summary: summary,
                    resumeContinuation: true,
                  );
                case ResultFailed(error: final error):
                  state = DailyEditionFailedState(failure: error, run: run);
              }
            case ResultFailed(error: final failure) when _hasErrorCode(failure, 'CURRENT_ASSIGNMENT_EXISTS'):
              final existing = await _repository.fetchCurrent(run.runId);
              switch (existing) {
                case ResultOk(data: final assignment):
                  await _showAssignment(run, assignment);
                case ResultFailed(error: final error):
                  state = DailyEditionFailedState(failure: error, run: run);
              }
            case ResultFailed(error: final failure) when _hasErrorCode(failure, 'MAIN_EDITION_INCOMPLETE'):
              await _restoreOrLoadRun(accountId, run);
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

  Future<bool> startEdition() async {
    final current = state;
    if (current is! DailyEditionActiveState || current.isBusy) return false;
    if (current.run.startedAt != null) return true;

    state = current.copyWith(isBusy: true, clearFailure: true);
    final result = await _repository.start(current.run.runId);
    switch (result) {
      case ResultOk(data: final run):
        state = DailyEditionActiveState(
          run: run,
          assignment: current.assignment,
          hint: current.hint,
          attempt: current.attempt,
        );
        return true;
      case ResultFailed(error: final failure):
        state = DailyEditionFailedState(failure: failure, run: current.run);
        return false;
    }
  }

  Future<void> useHint() async {
    final current = state;
    if (current is! DailyEditionActiveState || current.isBusy || current.attempt != null) {
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
    if (current is! DailyEditionActiveState || accountId == null || current.isBusy || current.attempt != null) {
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
      assignment: current.assignment,
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

  Future<bool> retryPendingAttempt() async {
    final current = state;
    final accountId = _accountId;
    if (current is! DailyEditionActiveState || accountId == null || current.isBusy || current.attempt != null) {
      return false;
    }

    _cancelAutomaticRetryWait(resetBackoff: false);
    try {
      final pending = await _outbox.load(accountId: accountId);
      if (pending == null) return false;
      state = current.copyWith(isBusy: true, clearFailure: true);
      await _sendPending(current, pending);
      return true;
    } on Object catch (error, stackTrace) {
      _report(error, stackTrace, 'daily_attempt_outbox_retry');
      state = current.copyWith(
        isBusy: false,
        failure: Failure.unknown(error),
      );
      return false;
    }
  }

  /// Reconciles an in-memory question after the app returns from background.
  /// The current question remains visible while the authoritative run and
  /// assignment are fetched from the server.
  Future<void> synchronizeActiveRun({String? timezoneId}) async {
    final current = state;
    final accountId = _accountId;
    if (current is! DailyEditionActiveState ||
        current.isBusy ||
        current.attempt != null ||
        accountId == null ||
        _bootstrapping) {
      return;
    }

    _bootstrapping = true;
    try {
      final result = await _repository.open(timezoneId: timezoneId);
      switch (result) {
        case ResultOk(data: final run):
          await _restoreOrLoadRun(accountId, run);
        case ResultFailed(error: final failure):
          state = current.copyWith(failure: failure);
      }
    } finally {
      _bootstrapping = false;
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
        _cancelAutomaticRetryWait();
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
      case ResultFailed(error: final failure) when _hasErrorCode(failure, 'ASSIGNMENT_NOT_CURRENT'):
        _cancelAutomaticRetryWait();
        await _clearPendingAndLoadRun(current.run, pending);
      case ResultFailed(error: final failure) when _hasErrorCode(failure, 'DAILY_RUN_NOT_FOUND'):
        _cancelAutomaticRetryWait();
        await _clearPendingAndBootstrap(current, pending);
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
        _scheduleAutomaticRetry(failure);
    }
  }

  void _scheduleAutomaticRetry(Failure failure) {
    if (_connectivityService == null || _disposed) return;

    if (failure is NoConnectionFailure) {
      _serverRetryIndex = 0;
      _waitForConnection();
      return;
    }
    if (!_isRetryableServerFailure(failure)) {
      _cancelAutomaticRetryWait();
      return;
    }

    _waitingForConnection = false;
    final delayIndex = _serverRetryIndex.clamp(
      0,
      _serverRetryDelays.length - 1,
    );
    final retryDelay = _serverRetryDelays[delayIndex];
    if (_serverRetryIndex < _serverRetryDelays.length - 1) {
      _serverRetryIndex += 1;
    }
    final generation = ++_automaticRetryGeneration;
    unawaited(_retryAfterDelay(retryDelay, generation));
  }

  Future<void> _retryAfterDelay(Duration delay, int generation) async {
    await _automaticRetryDelay(delay);
    if (_disposed || generation != _automaticRetryGeneration) return;
    await _runAutomaticRetry();
  }

  void _waitForConnection() {
    _waitingForConnection = true;
    final generation = ++_automaticRetryGeneration;
    unawaited(_retryIfConnectionAlreadyRestored(generation));
  }

  Future<void> _retryIfConnectionAlreadyRestored(int generation) async {
    final connected = await _connectivityService!.hasInternetConnection();
    if (_disposed || generation != _automaticRetryGeneration || !_waitingForConnection || !connected) {
      return;
    }
    await _runAutomaticRetry();
  }

  void _handleConnectivityStatus(InternetStatus status) {
    if (status != InternetStatus.connected || !_waitingForConnection) return;
    unawaited(_runAutomaticRetry());
  }

  Future<void> _runAutomaticRetry() async {
    if (_disposed || _automaticRetryRunning) return;
    _automaticRetryRunning = true;
    _cancelAutomaticRetryWait(resetBackoff: false);
    try {
      await retryPendingAttempt();
    } finally {
      _automaticRetryRunning = false;
    }
  }

  void _cancelAutomaticRetryWait({bool resetBackoff = true}) {
    _automaticRetryGeneration += 1;
    _waitingForConnection = false;
    if (resetBackoff) _serverRetryIndex = 0;
  }

  bool _isRetryableServerFailure(Failure failure) => switch (failure) {
        ServerUnavailableFailure() => true,
        NetworkFailure(reason: NetworkFailureTimeoutReason() || NetworkFailureServerReason()) => true,
        NetworkFailure(reason: NetworkFailureBadResponseReason(:final statusCode))
            when statusCode != null && statusCode >= 500 =>
          true,
        _ => false,
      };

  Future<void> _clearPendingAndBootstrap(
    DailyEditionActiveState current,
    PendingDailyAttemptEntity pending,
  ) async {
    try {
      await _outbox.clear(
        accountId: pending.accountId,
        clientEventId: pending.clientEventId,
      );
    } on Object catch (error, stackTrace) {
      _report(error, stackTrace, 'daily_attempt_outbox_drop_missing_run');
      state = current.copyWith(
        isBusy: false,
        failure: Failure.unknown(error),
      );
      return;
    }

    state = const DailyEditionInitialState();
    await bootstrap();
  }

  /// Leaves the authoritative reveal visible until the user advances. A
  /// completed attempt goes to the server summary; otherwise the next pinned
  /// assignment is requested from the server.
  Future<bool> advance() async {
    final current = state;
    if (current is! DailyEditionActiveState ||
        current.isBusy ||
        current.attempt == null) {
      return false;
    }

    state = current.copyWith(isBusy: true, clearFailure: true);
    if (current.attempt!.runCompleted) {
      if (_pendingReviewSource case final String source) {
        await bootstrapReviewReplacement(sourceAttemptId: source);
        return _finishReviewAdvance(current);
      }
      return _loadSummary(
        current.run,
        latestAttempt: current.attempt,
        activeFallback: current,
      );
    }

    if (current.run.status == DailyRunStatus.completed && hasPendingReview) {
      await bootstrapReviewReplacement(sourceAttemptId: _pendingReviewSource!);
      return _finishReviewAdvance(current);
    }

    final result = await _repository.fetchCurrent(current.run.runId);
    switch (result) {
      case ResultOk(data: final assignment):
        await _showAssignment(current.run, assignment);
        return true;
      case ResultFailed(error: final failure) when _isDailyRunComplete(failure):
        return _loadSummary(
          current.run,
          latestAttempt: current.attempt,
          activeFallback: current,
        );
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
        return false;
    }
  }

  bool _finishReviewAdvance(DailyEditionActiveState fallback) {
    switch (state) {
      case DailyEditionActiveState() || DailyEditionSummaryState():
        return true;
      case DailyEditionFailedState(:final failure):
        state = fallback.copyWith(isBusy: false, failure: failure);
        return false;
      default:
        state = fallback.copyWith(
          isBusy: false,
          failure: Failure.unknown(
            StateError('Review continuation did not finish'),
          ),
        );
        return false;
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
        if (!continuation.serverTime.isBefore(continuation.closesAt)) {
          await bootstrap();
          return;
        }
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
        current.summary.continuation.nextAction != DailyContinuationAction.playQuestion) {
      return;
    }

    if (_pendingReviewSource case final String source) {
      await bootstrapReviewReplacement(sourceAttemptId: source);
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

  Future<bool> acknowledgeSummary() async {
    final current = state;
    if (current is! DailyEditionSummaryState || current.isBusy) return false;
    if (current.summary.summaryAcknowledged) return true;

    state = current.copyWith(isBusy: true, clearFailure: true);
    final result = await _repository.acknowledgeSummary(current.run.runId);
    switch (result) {
      case ResultOk(data: final summary):
        state = current.copyWith(
          summary: summary,
          isBusy: false,
          clearFailure: true,
        );
        return true;
      case ResultFailed(error: final failure):
        state = current.copyWith(isBusy: false, failure: failure);
        return false;
    }
  }

  Future<void> resumeAcknowledgedSummary() async {
    final current = state;
    if (current is! DailyEditionSummaryState || !current.resumeContinuation || current.isBusy) {
      return;
    }

    state = current.copyWith(resumeContinuation: false);
    if (current.summary.continuation.nextAction == DailyContinuationAction.playQuestion) {
      await continueEdition();
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
    if (current.summary.continuation.rewardedVideosUsed > previousRewardedVideosUsed) {
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

  Future<bool> confirmDebugRewardedAd({
    required String clientEventId,
  }) async {
    final current = state;
    if (current is! DailyEditionSummaryState) return false;

    final result = await _repository.confirmDebugRewardedAd(
      runId: current.run.runId,
      clientEventId: clientEventId,
    );
    switch (result) {
      case ResultOk(data: final continuation):
        state = current.copyWith(
          summary: current.summary.copyWith(continuation: continuation),
          clearFailure: true,
        );
        return true;
      case ResultFailed():
        return false;
    }
  }

  Future<void> _loadRun(DailyRunEntity run) async {
    switch (run.status) {
      case DailyRunStatus.inProgress:
        final result = await _repository.fetchCurrent(run.runId);
        switch (result) {
          case ResultOk(data: final assignment):
            await _showAssignment(run, assignment);
          case ResultFailed(error: final failure) when _isDailyRunComplete(failure):
            await _loadSummary(run);
          case ResultFailed(error: final failure):
            state = DailyEditionFailedState(failure: failure, run: run);
        }
      case DailyRunStatus.completed:
      case DailyRunStatus.abandoned:
      case DailyRunStatus.expired:
      case DailyRunStatus.systemProtected:
        await _loadSummary(run, resumeContinuation: true);
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
        final restoredAssignment = pending.assignment;
        if (restoredAssignment != null && restoredAssignment.assignmentId == attempt.assignmentId) {
          state = DailyEditionActiveState(
            run: run,
            assignment: restoredAssignment,
            attempt: attempt,
          );
          _trackAttempt(
            attempt,
            assignmentKind: restoredAssignment.kind,
          );
        } else if (attempt.runCompleted) {
          _trackAttempt(attempt);
          await _loadSummary(run, latestAttempt: attempt);
        } else {
          _trackAttempt(attempt);
          await _loadRun(run);
        }
      case ResultFailed(error: final failure) when _hasErrorCode(failure, 'ASSIGNMENT_NOT_CURRENT'):
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

  Future<bool> _loadSummary(
    DailyRunEntity run, {
    DailyAttemptEntity? latestAttempt,
    bool resumeContinuation = false,
    DailyEditionActiveState? activeFallback,
  }) async {
    final result = await _repository.fetchSummary(run.runId);
    switch (result) {
      case ResultOk(data: final summary):
        state = DailyEditionSummaryState(
          run: run,
          summary: summary,
          latestAttempt: latestAttempt,
          resumeContinuation: resumeContinuation && summary.summaryAcknowledged,
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
        return true;
      case ResultFailed(error: final failure):
        state = activeFallback?.copyWith(
              isBusy: false,
              failure: failure,
            ) ??
            DailyEditionFailedState(failure: failure, run: run);
        return false;
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
              if (assignmentKind != null) 'assignment_kind': assignmentKind.name,
              if (attempt.ratingDelta != null) 'rating_delta': attempt.ratingDelta!,
            },
          ) ??
          Future.value(),
    );
  }

  void _report(Object error, StackTrace stackTrace, String operation) {
    log.error(
      'Daily edition operation failed',
      error: error,
      stackTrace: stackTrace,
      data: {'operation': operation},
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _cancelAutomaticRetryWait();
    unawaited(_connectivitySubscription?.cancel() ?? Future.value());
    super.dispose();
  }
}

bool _isDailyRunComplete(Failure failure) => _hasErrorCode(failure, 'DAILY_RUN_COMPLETE');

bool _hasErrorCode(Failure failure, String expected) => switch (failure) {
      NetworkFailure(
        reason: NetworkFailureBadResponseReason(errorCode: final errorCode),
      )
          when errorCode == expected =>
        true,
      _ => false,
    };
