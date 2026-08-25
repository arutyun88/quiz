import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';

final dailyEditionProvider =
    StateNotifierProvider.autoDispose<DailyEditionNotifier, DailyEditionState>(
        (ref) {
  return DailyEditionNotifier(repository: getIt<DailyEditionRepository>());
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
  });

  final DailyRunEntity run;
  final DailySummaryEntity summary;
  final DailyAttemptEntity? latestAttempt;
}

final class DailyEditionFailedState extends DailyEditionState {
  const DailyEditionFailedState({required this.failure, this.run});

  final Failure failure;
  final DailyRunEntity? run;
}

class DailyEditionNotifier extends StateNotifier<DailyEditionState> {
  DailyEditionNotifier({required DailyEditionRepository repository})
      : _repository = repository,
        super(const DailyEditionInitialState());

  final DailyEditionRepository _repository;
  bool _bootstrapping = false;

  /// Opens or restores the account's authoritative run. The server decides the
  /// edition date and returns the same active run on a new process or device.
  Future<void> bootstrap({String? timezoneId}) async {
    if (_bootstrapping) return;
    _bootstrapping = true;
    state = const DailyEditionLoadingState();
    try {
      final result = await _repository.open(timezoneId: timezoneId);
      switch (result) {
        case ResultOk(data: final run):
          await _loadRun(run);
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
    required String clientEventId,
    required DailyAttemptAction action,
    String? answerId,
  }) async {
    final current = state;
    if (current is! DailyEditionActiveState ||
        current.isBusy ||
        current.attempt != null) {
      return;
    }

    state = current.copyWith(isBusy: true, clearFailure: true);
    final result = await _repository.submitAttempt(
      runId: current.run.runId,
      assignmentId: current.assignment.assignmentId,
      clientEventId: clientEventId,
      action: action,
      answerId: answerId,
    );
    switch (result) {
      case ResultOk(data: final attempt):
        state = current.copyWith(
          attempt: attempt,
          isBusy: false,
          clearFailure: true,
        );
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
        state = DailyEditionActiveState(
          run: current.run,
          assignment: assignment,
        );
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

  Future<void> _loadRun(DailyRunEntity run) async {
    switch (run.status) {
      case DailyRunStatus.inProgress:
        final result = await _repository.fetchCurrent(run.runId);
        switch (result) {
          case ResultOk(data: final assignment):
            state = DailyEditionActiveState(
              run: run,
              assignment: assignment,
            );
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
      case ResultFailed(error: final failure):
        state = DailyEditionFailedState(failure: failure, run: run);
    }
  }
}

bool _isDailyRunComplete(Failure failure) => switch (failure) {
      NetworkFailure(
        reason: NetworkFailureBadResponseReason(errorCode: final errorCode),
      )
          when errorCode == 'DAILY_RUN_COMPLETE' =>
        true,
      _ => false,
    };
