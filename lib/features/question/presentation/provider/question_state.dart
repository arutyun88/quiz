part of 'question_provider.dart';

@freezed
class QuestionState with _$QuestionState {
  const QuestionState._();

  const factory QuestionState.loading() = _QuestionLoadingState;

  const factory QuestionState.data({
    required QuestionEntity question,
  }) = _QuestionDataState;

  const factory QuestionState.empty() = _QuestionEmptyState;

  const factory QuestionState.failed({
    required Failure failure,
  }) = _QuestionFailedState;
}
