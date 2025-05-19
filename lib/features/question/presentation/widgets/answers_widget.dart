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
            onSelect: ref.read(questionProvider.notifier).select,
          ),
          orElse: () => AnswersLoadingWidget(),
        );
  }
}

class _AnswersDataWidget extends StatelessWidget {
  final List<AnswerEntity> answers;
  final Function(AnswerEntity) onSelect;

  const _AnswersDataWidget({
    required this.answers,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
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
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[1],
                    onSelect: onSelect,
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
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[3],
                    onSelect: onSelect,
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
