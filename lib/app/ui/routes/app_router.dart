import 'package:flutter/cupertino.dart';
import 'package:quiz/app/domain/model/quiz_model.dart';
import 'package:quiz/app/ui/screens/init/view/init_view.dart';
import 'package:quiz/app/ui/screens/quiz/view/quiz_preview_view.dart';
import 'package:quiz/app/ui/screens/quiz/view/simple_quiz_view.dart';
import 'package:quiz/app/ui/screens/quiz/view/video_quiz_view.dart';
import 'package:quiz/app/ui/routes/routes_const.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.quizPreview:
        return CupertinoPageRoute(
          builder: (_) => QuizPreviewPage(
            quiz: routeSettings.arguments as QuizModel,
          ),
        );

      case Routes.quizSimple:
        return CupertinoPageRoute(
          builder: (_) => SimpleQuizPage(
            quiz: routeSettings.arguments as QuizModel,
          ),
        );

      case Routes.quizVideo:
        return CupertinoPageRoute(
          builder: (_) => VideoQuizPage(
            quiz: routeSettings.arguments as QuizModel,
          ),
        );

      default:
        return CupertinoPageRoute(builder: (_) => const InitPage());
    }
  }
}
