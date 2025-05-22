import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/button/pressable_button.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';

enum AnswerState { wait, select, correct, failed }

class PressableAnswerWidget extends StatelessWidget {
  final AnswerEntity answer;
  final Function(AnswerEntity)? onSelect;
  final AnswerState state;

  const PressableAnswerWidget({
    super.key,
    required this.answer,
    this.onSelect,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return PressableButton<AnswerEntity>(
      onPressed: onSelect != null ? () => onSelect!(answer) : null,
      child: AppWidget(
        duration: const Duration(milliseconds: 250),
        backgroundColor: _color(context),
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

  Color? _color(BuildContext context) => switch (state) {
        AnswerState.select => context.appTheme.palette.answer.select,
        AnswerState.correct => context.appTheme.palette.answer.success,
        AnswerState.failed => context.appTheme.palette.answer.failure,
        AnswerState.wait => null,
      };
}
