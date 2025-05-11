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
    required bool isCorrect,
  }) = QuestionAnswerSentState;
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
