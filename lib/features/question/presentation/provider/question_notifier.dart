part of 'question_provider.dart';

class QuestionNotifier extends StateNotifier<QuestionState> {
  final FetchQuestionUseCase _fetchQuestionUseCase;
  final QuestionIdService _questionIdService;

  QuestionNotifier({
    required FetchQuestionUseCase fetchQuestionUseCase,
    required QuestionIdService questionIdService,
  })  : _fetchQuestionUseCase = fetchQuestionUseCase,
        _questionIdService = questionIdService,
        super(const QuestionState.loading());

  Future<void> fetch() async {
    if (_questionIdService.questionId case String id) {
      final result = await _fetchQuestionUseCase.fetchById(id);

      switch (result) {
        case ResultOk(data: final question):
          state = QuestionState.data(question: question);

        case ResultFailed(error: final QuestionFailure _):
          await _questionIdService.clean();
          final result = await _fetchQuestionUseCase.fetch();

          switch (result) {
            case ResultOk(data: final question):
              state = QuestionState.data(question: question);
              _questionIdService.save(question.id);

            case ResultFailed(error: final QuestionFailure failure) when failure.reason is QuestionFailureOverReason:
              state = QuestionState.empty();

            case ResultFailed(error: final failure):
              state = QuestionState.failed(failure: failure);
          }
        case ResultFailed(error: final failure):
          state = QuestionState.failed(failure: failure);
      }
    } else {
      final result = await _fetchQuestionUseCase.fetch();

      switch (result) {
        case ResultOk(data: final question):
          state = QuestionState.data(question: question);
          _questionIdService.save(question.id);

        case ResultFailed(error: final QuestionFailure failure) when failure.reason is QuestionFailureOverReason:
          state = QuestionState.empty();

        case ResultFailed(error: final failure):
          state = QuestionState.failed(failure: failure);
      }
    }
  }

  Future<void> next() async {
    state = QuestionState.loading();

    await fetch();
  }
}
