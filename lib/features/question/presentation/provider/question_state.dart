part of 'question_provider.dart';

@freezed
class QuestionState with _$QuestionState {
  const QuestionState._();

  const factory QuestionState.loading() = QuestionLoadingState;

  const factory QuestionState.data({
    required QuestionEntity question,
    required QuestionAnswerState answerState,
  }) = QuestionDataState;

  const factory QuestionState.empty() = QuestionEmptyState;

  const factory QuestionState.failed({
    required Failure failure,
  }) = QuestionFailedState;
}

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
