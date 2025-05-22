import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/features/question/presentation/widgets/answers_loading_widget.dart';
import 'package:quiz/features/question/presentation/widgets/pressable_answer_widget.dart';

class AnswersWidget extends ConsumerStatefulWidget {
  const AnswersWidget({
    super.key,
  });

  @override
  ConsumerState<AnswersWidget> createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends ConsumerState<AnswersWidget> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(questionProvider).maybeWhen(
          data: (question, answersState) => _AnswersDataWidget(
            answers: question.answers,
            onSelect: answersState is QuestionAnswerWaitingState || answersState is QuestionAnswerSelectedState
                ? ref.read(questionProvider.notifier).select
                : null,
            selectedAnswer: answersState.answer,
          ),
          orElse: () => AnswersLoadingWidget(),
        );
  }
}

class _AnswersDataWidget extends ConsumerWidget {
  final List<AnswerEntity> answers;
  final Function(AnswerEntity)? onSelect;
  final AnswerEntity? selectedAnswer;

  const _AnswersDataWidget({
    required this.answers,
    this.onSelect,
    this.selectedAnswer,
  });

  AnswerState answerState(AnswerEntity answer, WidgetRef ref) {
    return ref.read(questionProvider).maybeMap(
          data: (value) => value.answerState.maybeMap(
            selected: (value) => value.answer.id == answer.id ? AnswerState.select : AnswerState.wait,
            sending: (value) => value.answer.id == answer.id ? AnswerState.select : AnswerState.wait,
            sent: (value) => value.answer.id == answer.id
                ? value.isCorrect
                    ? AnswerState.correct
                    : AnswerState.failed
                : answer.isCorrect
                    ? AnswerState.correct
                    : AnswerState.wait,
            failed: (value) => value.answer.id == answer.id ? AnswerState.select : AnswerState.wait,
            orElse: () => AnswerState.wait,
          ),
          orElse: () => AnswerState.wait,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[0],
                    onSelect: onSelect,
                    state: answerState(answers[0], ref),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[1],
                    onSelect: onSelect,
                    state: answerState(answers[1], ref),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[2],
                    onSelect: onSelect,
                    state: answerState(answers[2], ref),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[3],
                    onSelect: onSelect,
                    state: answerState(answers[3], ref),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
