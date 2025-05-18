import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/button/pressable_button.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';

class PressableAnswerWidget extends StatelessWidget {
  final AnswerEntity answer;
  final Function(AnswerEntity) onSelect;

  const PressableAnswerWidget({
    super.key,
    required this.answer,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return PressableButton<AnswerEntity>(
      onPressed: () => onSelect(answer),
      child: AppWidget(
        child: Center(
          child: Text(
            answer.text,
            textAlign: TextAlign.center,
            style: context.textStyle.body16Regular,
          ),
        ),
      ),
    );
  }
}
