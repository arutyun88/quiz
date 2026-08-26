import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/demo/domain/entity/demo_answer_entity.dart';
import 'package:quiz/features/demo/domain/repository/demo_repository.dart';
import 'package:quiz/features/demo/presentation/provider/demo_config_provider.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';

final demoProvider = StateNotifierProvider.autoDispose<DemoNotifier, DemoState>(
  (ref) => DemoNotifier(
    repository: getIt<DemoRepository>(),
    questionLimit: ref.watch(demoConfigProvider).questionCount,
  )..bootstrap(),
);

sealed class DemoState {
  const DemoState();
}

final class DemoLoadingState extends DemoState {
  const DemoLoadingState();
}

final class DemoFailedState extends DemoState {
  final Failure failure;

  const DemoFailedState(this.failure);
}

final class DemoActiveState extends DemoState {
  final List<QuestionEntity> questions;
  final int index;
  final bool hintVisible;
  final bool isSubmitting;
  final String? selectedAnswerId;
  final DemoAnswerEntity? reveal;
  final Failure? failure;

  const DemoActiveState({
    required this.questions,
    required this.index,
    this.hintVisible = false,
    this.isSubmitting = false,
    this.selectedAnswerId,
    this.reveal,
    this.failure,
  });

  QuestionEntity get question => questions[index];
  int get position => index + 1;
  int get total => questions.length;

  DemoActiveState copyWith({
    bool? hintVisible,
    bool? isSubmitting,
    String? selectedAnswerId,
    bool clearSelectedAnswer = false,
    DemoAnswerEntity? reveal,
    bool clearReveal = false,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      DemoActiveState(
        questions: questions,
        index: index,
        hintVisible: hintVisible ?? this.hintVisible,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        selectedAnswerId: clearSelectedAnswer
            ? null
            : selectedAnswerId ?? this.selectedAnswerId,
        reveal: clearReveal ? null : reveal ?? this.reveal,
        failure: clearFailure ? null : failure ?? this.failure,
      );
}

final class DemoCompletedState extends DemoState {
  const DemoCompletedState();
}

final class DemoNotifier extends StateNotifier<DemoState> {
  final DemoRepository _repository;
  final int _questionLimit;
  int _generation = 0;

  DemoNotifier({
    required DemoRepository repository,
    required int questionLimit,
  })  : _repository = repository,
        _questionLimit = questionLimit,
        super(const DemoLoadingState());

  Future<void> bootstrap() async {
    final generation = ++_generation;
    state = const DemoLoadingState();
    final result = await _repository.fetchQuestions(limit: _questionLimit);
    if (generation != _generation) return;

    switch (result) {
      case ResultOk(data: final page) when page.items.isNotEmpty:
        state =
            DemoActiveState(questions: List.unmodifiable(page.items), index: 0);
      case ResultOk():
        state = DemoFailedState(
          Failure.unknown(StateError('Guest demo has no questions')),
        );
      case ResultFailed(error: final failure):
        state = DemoFailedState(failure);
    }
  }

  void showHint() {
    final current = state;
    if (current is! DemoActiveState || current.isSubmitting) return;
    state = current.copyWith(hintVisible: true, clearFailure: true);
  }

  Future<void> submitAnswer(String answerId) async {
    final current = state;
    if (current is! DemoActiveState ||
        current.isSubmitting ||
        current.reveal != null ||
        !current.question.answers.any((answer) => answer.id == answerId)) {
      return;
    }

    final generation = ++_generation;
    final questionId = current.question.id;
    state = current.copyWith(
      isSubmitting: true,
      selectedAnswerId: answerId,
      clearFailure: true,
    );
    final result = await _repository.checkAnswer(
      questionId: questionId,
      answerId: answerId,
    );
    if (generation != _generation) return;

    final latest = state;
    if (latest is! DemoActiveState || latest.question.id != questionId) return;
    switch (result) {
      case ResultOk(data: final reveal):
        state = latest.copyWith(isSubmitting: false, reveal: reveal);
      case ResultFailed(error: final failure):
        state = latest.copyWith(isSubmitting: false, failure: failure);
    }
  }

  void advance() {
    final current = state;
    if (current is! DemoActiveState || current.reveal == null) return;
    _generation++;
    final nextIndex = current.index + 1;
    if (nextIndex >= current.questions.length) {
      state = const DemoCompletedState();
      return;
    }
    state = DemoActiveState(
      questions: current.questions,
      index: nextIndex,
    );
  }
}
