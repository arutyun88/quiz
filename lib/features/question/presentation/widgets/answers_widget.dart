import 'package:flutter/material.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/presentation/widgets/pressable_answer_widget.dart';

class AnswersWidget extends StatelessWidget {
  final List<AnswerEntity> answers;
  final void Function(AnswerEntity) onSelect;

  const AnswersWidget({
    super.key,
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
                    onSelect: (answer) {
                      onSelect(answer);
                    },
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[1],
                    onSelect: (answer) {
                      onSelect(answer);
                    },
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
                    onSelect: (answer) {
                      onSelect(answer);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: SizedBox.expand(
                  child: PressableAnswerWidget(
                    answer: answers[3],
                    onSelect: (answer) {
                      onSelect(answer);
                    },
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
