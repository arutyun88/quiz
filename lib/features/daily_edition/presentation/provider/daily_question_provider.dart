import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';
import 'package:quiz/features/question/presentation/question_answer_state.dart';

final dailyQuestionProvider = StateNotifierProvider.autoDispose<
    DailyQuestionNotifier, QuestionAnswerState>((ref) {
  final notifier = DailyQuestionNotifier(
    submitAnswer: (answerId) => ref
        .read(dailyEditionProvider.notifier)
        .submitAttempt(action: DailyAttemptAction.answer, answerId: answerId),
  );
  ref.listen(
    dailyEditionProvider,
    (_, next) => notifier.synchronize(next),
    fireImmediately: true,
  );
  return notifier;
});

class DailyQuestionNotifier extends StateNotifier<QuestionAnswerState> {
  DailyQuestionNotifier({
    required Future<void> Function(String answerId) submitAnswer,
    Duration confirmationDuration = const Duration(seconds: 3),
  })  : _submitAnswer = submitAnswer,
        _confirmationDuration = confirmationDuration,
        super(const QuestionAnswerState.wait());

  final Future<void> Function(String answerId) _submitAnswer;
  final Duration _confirmationDuration;
  Timer? _timer;
  String? _assignmentId;

  void synchronize(DailyEditionState editionState) {
    if (editionState is! DailyEditionActiveState) {
      _reset();
      return;
    }

    if (_assignmentId != editionState.assignment.assignmentId) {
      _assignmentId = editionState.assignment.assignmentId;
      _cancelTimer();
      state = const QuestionAnswerState.wait();
    }

    final attempt = editionState.attempt;
    if (attempt != null) {
      _cancelTimer();
      final answer = _answerForAttempt(editionState.assignment, attempt);
      if (answer != null) {
        state = QuestionAnswerState.sent(
          answer: answer,
          correctAnswerId: attempt.correctAnswerId,
          description: attempt.description,
          xp: attempt.xpAwarded,
        );
      }
      return;
    }

    final selectedAnswer = state.answer;
    if (selectedAnswer == null) return;

    if (editionState.isBusy) {
      _cancelTimer();
      state = QuestionAnswerState.sending(answer: selectedAnswer);
    } else if (editionState.failure case final failure?) {
      _cancelTimer();
      state = QuestionAnswerState.failed(
        answer: selectedAnswer,
        failure: failure,
      );
    }
  }

  void select(AnswerEntity answer) {
    if (state is! QuestionAnswerWaitingState &&
        state is! QuestionAnswerSelectedState) {
      return;
    }

    _cancelTimer();
    state = QuestionAnswerState.selected(
      answer: answer,
      timerState: AnswerTimerState(
        duration: _confirmationDuration,
        remaining: _confirmationDuration,
        isActive: true,
      ),
    );
    _startTimer(answer);
  }

  void _startTimer(AnswerEntity answer) {
    const updateFrequency = Duration(milliseconds: 33);
    final startedAt = DateTime.now();
    _timer = Timer.periodic(updateFrequency, (_) {
      final elapsed = DateTime.now().difference(startedAt);
      final remaining = _confirmationDuration - elapsed;
      if (remaining <= Duration.zero) {
        _cancelTimer();
        state = QuestionAnswerState.sending(answer: answer);
        unawaited(_submitAnswer(answer.id));
        return;
      }
      state = QuestionAnswerState.selected(
        answer: answer,
        timerState: AnswerTimerState(
          duration: _confirmationDuration,
          remaining: remaining,
          isActive: true,
        ),
      );
    });
  }

  AnswerEntity? _answerForAttempt(
    DailyAssignmentEntity assignment,
    DailyAttemptEntity attempt,
  ) {
    final answerId = attempt.answerId;
    if (answerId == null) return null;
    for (final answer in assignment.answers) {
      if (answer.id == answerId && answer.text != null) {
        return AnswerEntity(id: answer.id, text: answer.text!);
      }
    }
    return null;
  }

  void _reset() {
    _assignmentId = null;
    _cancelTimer();
    state = const QuestionAnswerState.wait();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }
}

extension DailyAssignmentPresentationX on DailyAssignmentEntity {
  QuestionEntity? toQuestionEntity() {
    final questionText = text;
    if (questionText == null || answers.any((answer) => answer.text == null)) {
      return null;
    }
    return QuestionEntity(
      id: assignmentId,
      question: questionText,
      topic: TopicEntity(
        id: topic ?? '',
        name: topic ?? '',
        description: '',
      ),
      hint: '',
      answers: [
        for (final answer in answers)
          AnswerEntity(id: answer.id, text: answer.text!),
      ],
    );
  }
}
