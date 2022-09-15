import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/const/icons_const.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.width,
    required this.currentQuestionNumber,
    required String question,
  })  : _question = question,
        super(key: key);

  final double width;
  final int currentQuestionNumber;
  final String _question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(28),
        dashPattern: const [12, 8],
        color: AppColors.orange,
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  "Вопрос ${currentQuestionNumber + 1}",
                  style: AppTextStyle.manrope20W700.apply(
                    color: AppColors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 24.0,
                ),
                child: Text(
                  _question,
                  style: AppTextStyle.manrope16W500.apply(
                    color: AppColors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
