import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('question loading uses a structural skeleton', (tester) async {
    await tester.pumpWidget(_app(const QuizQuestionLoading()));

    expect(find.byType(QuizQuestionLoading), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('unknown question error can be retried', (tester) async {
    var retried = false;
    await tester.pumpWidget(
      _app(
        QuizQuestionError(
          onRetry: () async => retried = true,
        ),
      ),
    );

    final error = t.question.state.unknown_error;
    expect(find.text(error.title), findsOneWidget);
    expect(find.text(error.message), findsOneWidget);
    expect(find.text(error.retry), findsOneWidget);

    await tester.tap(find.text(error.retry));
    await tester.pump(const Duration(milliseconds: 150));

    expect(retried, isTrue);
  });
}

Widget _app(Widget child) => TranslationProvider(
      child: MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(body: SafeArea(child: child)),
      ),
    );
