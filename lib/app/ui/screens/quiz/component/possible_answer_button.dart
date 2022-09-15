import 'package:flutter/cupertino.dart';
import 'package:quiz/app/domain/model/quiz_answer_model.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';

class PossibleAnswerButton extends StatelessWidget {
  const PossibleAnswerButton({
    Key? key,
    required this.answer,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.icon,
  }) : super(key: key);

  final QuizAnswerModel answer;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0.0,
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 1.0,
              color: buttonColor ?? AppColors.greyBlue02,
            ),
            color: buttonColor ?? AppColors.transparent,
          ),
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              icon,
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    answer.value,
                    style: AppTextStyle.manrope16W500.apply(
                      color: textColor ?? AppColors.greyBlue02,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
