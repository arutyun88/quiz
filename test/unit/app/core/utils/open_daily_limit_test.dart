import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/utils/open_daily_limit.dart';

void main() {
  for (final origin in ['/profile/review', '/rating', '/']) {
    testWidgets('extra questions returns to $origin without changing the origin',
        (tester) async {
      final router = GoRouter(
        initialLocation: origin,
        routes: [
          for (final path in ['/profile/review', '/rating', '/'])
            GoRoute(
              path: path,
              builder: (context, state) => Scaffold(
                body: TextButton(
                  onPressed: () => openDailyLimit(context,
                      reviewSourceAttemptId: 'source-1'),
                  child: Text('open:$path'),
                ),
              ),
            ),
          GoRoute(
            path: '/daily-limit',
            name: 'daily-limit',
            builder: (context, state) => Scaffold(
              body: TextButton(
                onPressed: () => context.pop(),
                child: Text('close:${state.uri.queryParameters['reviewAttemptId']}'),
              ),
            ),
          ),
        ],
      );
      addTearDown(router.dispose);
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();
      await tester.tap(find.text('open:$origin'));
      await tester.pumpAndSettle();
      expect(find.text('close:source-1'), findsOneWidget);
      await tester.tap(find.text('close:source-1'));
      await tester.pumpAndSettle();
      expect(find.text('open:$origin'), findsOneWidget);
    });
  }
}
