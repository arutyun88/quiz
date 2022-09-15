import 'package:flutter/cupertino.dart';
import 'package:quiz/app/ui/routes/app_router.dart';
import 'package:quiz/app/ui/uikit/main_theme.dart';
import 'package:quiz/app/ui/routes/routes_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: mainTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }
}
