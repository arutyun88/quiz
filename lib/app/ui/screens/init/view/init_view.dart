import 'package:flutter/cupertino.dart';
import 'package:quiz/app/domain/model/quiz_model.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/default_button.dart';
import 'package:quiz/app/ui/routes/routes_const.dart';
import 'package:quiz/app/ui/uikit/scaffold.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InitView();
  }
}

class InitView extends StatefulWidget {
  const InitView({Key? key}) : super(key: key);

  @override
  State<InitView> createState() => _InitViewState();
}

// TODO получение данных от API
class _InitViewState extends State<InitView> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ).copyWith(top: 0.0),
              child: Text(
                'Здесь список викторин с изображением и описанием',
                textAlign: TextAlign.center,
                style: AppTextStyle.manrope16W500.apply(color: AppColors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: DefaultButton(
                onPressed: _startQuiz,
                backgroundColor: AppColors.white,
                body: Text(
                  'Викторина 1',
                  style: AppTextStyle.folks24W400
                      .apply(color: AppColors.blueLight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// PGQ - Игра на предугадывание
  void _startQuiz() {
    const quiz = QuizModel(
      id: 1,
      targetQuiz: 'Какая-то виктрина',
      description: 'Описание какой-то викторины. Здесь может быть любой текст,'
          ' без ограничения длины',
      type: QuizType.simple,
    );
    Navigator.of(context).pushNamed(Routes.quizPreview, arguments: quiz);
  }
}
