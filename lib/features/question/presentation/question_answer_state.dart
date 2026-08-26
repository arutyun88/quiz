import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';

part 'question_answer_state.freezed.dart';

@freezed
class QuestionAnswerState with _$QuestionAnswerState {
  const QuestionAnswerState._();

  const factory QuestionAnswerState.wait() = QuestionAnswerWaitingState;

  const factory QuestionAnswerState.selected({
    required AnswerEntity answer,
    required AnswerTimerState timerState,
  }) = QuestionAnswerSelectedState;

  const factory QuestionAnswerState.sending({
    required AnswerEntity answer,
  }) = QuestionAnswerSendingState;

  const factory QuestionAnswerState.sent({
    required AnswerEntity answer,
    String? correctAnswerId,
    String? description,
    @Default(0) int xp,
    @Default(0) int streakDelta,
  }) = QuestionAnswerSentState;

  const factory QuestionAnswerState.failed({
    required AnswerEntity answer,
    required Failure failure,
  }) = QuestionAnswerFailedState;

  AnswerEntity? get answer => switch (this) {
        QuestionAnswerSelectedState(:final answer) ||
        QuestionAnswerSendingState(:final answer) ||
        QuestionAnswerSentState(:final answer) ||
        QuestionAnswerFailedState(:final answer) =>
          answer,
        _ => null,
      };
}

extension QuestionAnswerSentStateX on QuestionAnswerSentState {
  bool get isCorrect => answer.id == correctAnswerId;
}

@freezed
class AnswerTimerState with _$AnswerTimerState {
  const AnswerTimerState._();

  const factory AnswerTimerState({
    required Duration duration,
    required Duration remaining,
    @Default(false) bool isActive,
  }) = _AnswerTimerState;

  double get progress => remaining.inMilliseconds / duration.inMilliseconds;
}
