import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_placeholders.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('leaderboard loading uses a structural skeleton', (tester) async {
    await tester.pumpWidget(_app(const LeaderboardLoading()));

    expect(find.byType(LeaderboardLoading), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('leaderboard error explains the failure and can be retried',
      (tester) async {
    var retried = false;
    await tester.pumpWidget(
      _app(
        LeaderboardError(
          title: t.leaderboard.error_title,
          message: t.leaderboard.error_message,
          onRetry: () async => retried = true,
        ),
      ),
    );

    expect(find.text(t.leaderboard.error_title), findsOneWidget);
    expect(find.text(t.leaderboard.error_message), findsOneWidget);
    expect(find.text(t.leaderboard.retry), findsOneWidget);

    await tester.tap(find.text(t.leaderboard.retry));
    await tester.pump(const Duration(milliseconds: 150));

    expect(retried, isTrue);
  });

  testWidgets('empty history explains how to create the first entry',
      (tester) async {
    await tester.pumpWidget(_app(const LeaderboardHistoryEmpty()));

    expect(find.text(t.leaderboard.history_empty_title), findsOneWidget);
    expect(find.text(t.leaderboard.history_empty_message), findsOneWidget);
    expect(find.byIcon(Icons.calendar_month_outlined), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}

Widget _app(Widget child) => TranslationProvider(
      child: MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(body: SafeArea(child: child)),
      ),
    );
