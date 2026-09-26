import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/daily_edition/presentation/widgets/daily_hint_panel.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('keeps the hint obscured and explains the subscription gate',
      (tester) async {
    var hintRequested = false;

    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.light,
          home: Scaffold(
            body: DailyHintPanel(
              hintUsed: false,
              hint: 'Hint',
              obscuredText: 'Question',
              enabled: true,
              subscriptionLocked: true,
              onUseHint: () async => hintRequested = true,
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const ValueKey('hint-obscured')), findsOneWidget);
    expect(find.text(t.question.hint.subscription_required), findsNothing);
    expect(find.text(t.question.hint.confirm_title), findsNothing);

    await tester.tap(find.byKey(const ValueKey('hint-obscured')));
    await tester.pumpAndSettle();

    expect(hintRequested, isFalse);
    expect(find.text(t.question.hint.confirm_title), findsNothing);
    expect(find.text(t.question.hint.subscription_title), findsOneWidget);
    expect(find.text(t.question.hint.subscription_required), findsOneWidget);
    expect(find.text(t.question.hint.subscription_acknowledge), findsOneWidget);
  });
}
