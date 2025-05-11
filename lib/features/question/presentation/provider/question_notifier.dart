part of 'question_provider.dart';

class QuestionNotifier extends StateNotifier<QuestionState> {
  final FetchQuestionUseCase _fetchQuestionUseCase;
  final CheckQuestionStateUseCase _checkQuestionStateUseCase;
  final SendAnswerUseCase _sendAnswerUseCase;
  final QuestionIdService _questionIdService;

  static const Duration _timerDuration = Duration(seconds: 5);
  Timer? _timer;

  QuestionNotifier({
    required FetchQuestionUseCase fetchQuestionUseCase,
    required CheckQuestionStateUseCase checkQuestionStateUseCase,
    required SendAnswerUseCase sendAnswerUseCase,
    required QuestionIdService questionIdService,
  })  : _fetchQuestionUseCase = fetchQuestionUseCase,
        _checkQuestionStateUseCase = checkQuestionStateUseCase,
        _sendAnswerUseCase = sendAnswerUseCase,
        _questionIdService = questionIdService,
        super(const QuestionState.loading());

  Future<void> fetch() async {
    if (_questionIdService.questionId case String id) {
      final questionState = await _checkQuestionStateUseCase.checkById(id);

      if (questionState case ResultOk(data: final questionState) when questionState.isAnswered) {
        await _questionIdService.clean();
        return await fetch();
      }

      final result = await _fetchQuestionUseCase.fetchById(id);

      switch (result) {
        case ResultOk(data: final question):
          state = QuestionState.data(
            question: question,
            answerState: QuestionAnswerState.wait(),
          );

        case ResultFailed(error: final QuestionFailure _):
          await _questionIdService.clean();
          final result = await _fetchQuestionUseCase.fetch();

          switch (result) {
            case ResultOk(data: final question):
              state = QuestionState.data(
                question: question,
                answerState: QuestionAnswerState.wait(),
              );
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
          state = QuestionState.data(
            question: question,
            answerState: QuestionAnswerState.wait(),
          );
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

  void select(AnswerEntity answer) {
    if (state is! QuestionDataState) return;

    final previousState = state as QuestionDataState;

    final timerState = AnswerTimerState(
      duration: _timerDuration,
      remaining: _timerDuration,
      isActive: true,
    );

    state = previousState.copyWith(
      answerState: QuestionAnswerState.selected(
        answer: answer,
        timerState: timerState,
      ),
    );

    _startTimer();
  }

  void _startTimer() {
    _cancelTimer();

    const updateFrequency = Duration(milliseconds: 33); // ~30fps
    final startTime = DateTime.now();

    _timer = Timer.periodic(
      updateFrequency,
      (timer) {
        if (state is! QuestionDataState) {
          _cancelTimer();
          return;
        }

        final questionState = state as QuestionDataState;
        if (questionState.answerState is! QuestionAnswerSelectedState) {
          _cancelTimer();
          return;
        }

        final selectedState = questionState.answerState as QuestionAnswerSelectedState;

        final elapsed = DateTime.now().difference(startTime);
        final remaining = _timerDuration - elapsed;

        if (remaining.isNegative) {
          _cancelTimer();
          _sendAnswer(selectedState.answer);
          return;
        }

        state = questionState.copyWith(
          answerState: QuestionAnswerState.selected(
            answer: selectedState.answer,
            timerState: AnswerTimerState(
              duration: _timerDuration,
              remaining: remaining,
              isActive: true,
            ),
          ),
        );
      },
    );
  }

  Future<void> _sendAnswer(AnswerEntity answer) async {
    if (state is! QuestionDataState) return;

    if (state case QuestionDataState questionState) {
      state = questionState.copyWith(
        answerState: QuestionAnswerState.sending(answer: answer),
      );

      // TODO реализовать полную логику отправки с дальнейшим запросом нового вопроса
      _sendAnswerUseCase.send();
    }
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
