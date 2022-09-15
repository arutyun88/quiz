import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/app/domain/model/quiz_model.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/default_button.dart';
import 'package:quiz/app/ui/uikit/const/icons_const.dart';
import 'package:quiz/app/ui/uikit/const/photo_const.dart';
import 'package:quiz/app/ui/routes/routes_const.dart';
import 'package:quiz/app/ui/uikit/scaffold.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';

class QuizPreviewPage extends StatelessWidget {
  const QuizPreviewPage({
    Key? key,
    required QuizModel quiz,
  })  : _quiz = quiz,
        super(key: key);
  final QuizModel _quiz;

  @override
  Widget build(BuildContext context) {
    return QuizPreviewView(quiz: _quiz);
  }
}

class QuizPreviewView extends StatefulWidget {
  const QuizPreviewView({
    Key? key,
    required QuizModel quiz,
  })  : _quiz = quiz,
        super(key: key);
  final QuizModel _quiz;

  @override
  State<QuizPreviewView> createState() => _QuizPreviewViewState();
}

class _QuizPreviewViewState extends State<QuizPreviewView> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      height: 52,
      leading: SvgPicture.asset(
        AppIcons.backIcon,
        height: 16,
        width: 16,
        color: AppColors.white,
      ),
      leadingOnPressed: () => Navigator.of(context).pop(),
      titleWidget: Text(
        'Игра на предугадывание',
        style: AppTextStyle.manrope16W500.apply(color: AppColors.white),
      ),
      action: const SizedBox(height: 16, width: 16),
      body: Flexible(
        fit: FlexFit.tight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.asset(AppPhoto.quizStart, color: AppColors.white),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500, minWidth: 330),
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28.0),
                  ),
                  color: AppColors.white,
                ),
                child: SafeArea(
                  top: false,
                  child: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18.0,
                            right: 18.0,
                            top: 24.0,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Инструкция к игре',
                                      style: AppTextStyle.manrope16W500.apply(
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        widget._quiz.description,
                                        style: AppTextStyle.manrope14W400
                                            .apply(color: AppColors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Flexible(
                                fit: FlexFit.tight,
                                child: SizedBox(height: 24.0),
                              ),
                              DefaultButton(
                                backgroundColor: AppColors.blueLight,
                                body: Text(
                                  'Начать игру',
                                  style: AppTextStyle.manrope14W600.apply(
                                    color: AppColors.white,
                                  ),
                                ),
                                onPressed: _onPressed,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    widget._quiz.type == QuizType.video
        ? Navigator.of(context).pushNamed(
            Routes.quizVideo,
            arguments: widget._quiz,
          )
        : Navigator.of(context).pushNamed(
            Routes.quizSimple,
            arguments: widget._quiz,
          );
  }
}
