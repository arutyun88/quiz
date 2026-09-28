import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/question_report/domain/entity/question_report.dart';
import 'package:quiz/features/question_report/domain/repository/question_report_repository.dart';
import 'package:uuid/uuid.dart';

final questionReportRepositoryProvider = Provider<QuestionReportRepository>(
  (_) => getIt<QuestionReportRepository>(),
);

final questionReportProvider = StateNotifierProvider.autoDispose
    .family<QuestionReportNotifier, QuestionReportState, String>(
  (ref, attemptId) => QuestionReportNotifier(
    attemptId: attemptId,
    repository: ref.watch(questionReportRepositoryProvider),
  ),
);

sealed class QuestionReportState {
  const QuestionReportState();
}

final class QuestionReportIdleState extends QuestionReportState {
  const QuestionReportIdleState();
}

final class QuestionReportSubmittingState extends QuestionReportState {
  const QuestionReportSubmittingState({this.previousFailure});

  final Failure? previousFailure;
}

final class QuestionReportSubmittedState extends QuestionReportState {
  const QuestionReportSubmittedState();
}

final class QuestionReportFailedState extends QuestionReportState {
  const QuestionReportFailedState(this.failure);

  final Failure failure;
}

class QuestionReportNotifier extends StateNotifier<QuestionReportState> {
  QuestionReportNotifier({
    required String attemptId,
    required QuestionReportRepository repository,
    String Function()? clientEventIdFactory,
  })  : _attemptId = attemptId,
        _repository = repository,
        _clientEventIdFactory =
            clientEventIdFactory ?? (() => const Uuid().v4()),
        super(const QuestionReportIdleState());

  final String _attemptId;
  final QuestionReportRepository _repository;
  final String Function() _clientEventIdFactory;
  QuestionReportSubmission? _pendingSubmission;

  Future<bool> submit({
    required QuestionReportCategory category,
    required String locale,
    String? details,
  }) async {
    if (state is QuestionReportSubmittingState) return false;

    final normalizedDetails = details?.trim();
    final comparable = _pendingSubmission;
    final shouldReuse = comparable != null &&
        comparable.attemptId == _attemptId &&
        comparable.category == category &&
        comparable.locale == locale &&
        comparable.details ==
            (normalizedDetails == null || normalizedDetails.isEmpty
                ? null
                : normalizedDetails);
    final submission = QuestionReportSubmission(
      clientEventId:
          shouldReuse ? comparable.clientEventId : _clientEventIdFactory(),
      attemptId: _attemptId,
      category: category,
      locale: locale,
      details: normalizedDetails == null || normalizedDetails.isEmpty
          ? null
          : normalizedDetails,
    );
    _pendingSubmission = submission;
    final previousFailure = switch (state) {
      QuestionReportFailedState(:final failure) => failure,
      QuestionReportSubmittingState(:final previousFailure) => previousFailure,
      _ => null,
    };
    state = QuestionReportSubmittingState(previousFailure: previousFailure);

    final result = await _repository.submit(submission);
    return switch (result) {
      ResultOk() => _completeSuccessfully(),
      ResultFailed(error: final failure) => _completeWithFailure(failure),
    };
  }

  bool _completeSuccessfully() {
    state = const QuestionReportSubmittedState();
    return true;
  }

  bool _completeWithFailure(Failure failure) {
    state = QuestionReportFailedState(failure);
    return false;
  }
}
