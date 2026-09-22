import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:quiz/features/observability/domain/logger.dart';
import 'package:quiz/features/observability/presentation/go_router_navigation_logger.dart';

void main() {
  late List<LogRecord> records;
  late StreamSubscription<LogRecord> subscription;
  late GoRouter router;
  late GoRouterNavigationLogger navigationLogger;

  setUp(() {
    hierarchicalLoggingEnabled = true;
    Logger.root.level = Level.ALL;
    records = [];
    subscription = Logger('Navigation').onRecord.listen(records.add);
    router = GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (_, __) => const SizedBox.shrink(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (_, __, navigationShell) => navigationShell,
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/',
                  builder: (_, __) => const SizedBox.shrink(),
                  routes: [
                    GoRoute(
                      path: 'user/:userId',
                      builder: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    navigationLogger = GoRouterNavigationLogger(router);
  });

  tearDown(() async {
    navigationLogger.dispose();
    router.dispose();
    await subscription.cancel();
  });

  testWidgets('logs one user route for startup and shell navigation',
      (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(records.single.message, 'OPEN /splash');
    expect((records.single.object as StringRecord).toJson(), {
      'action': 'open',
      'to': '/splash',
    });

    router.go('/');
    await tester.pumpAndSettle();

    expect(records.map((record) => record.message), [
      'OPEN /splash',
      'NAVIGATE /splash → /',
    ]);
  });

  testWidgets('logs the route pattern without identifiers or query values',
      (tester) async {
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    router.go('/user/private-id?token=private-token');
    await tester.pumpAndSettle();

    final record = records.last;
    expect(record.message, 'NAVIGATE /splash → /user/:userId');
    expect(record.message, isNot(contains('private-id')));
    expect(record.message, isNot(contains('private-token')));
    expect((record.object as StringRecord).toJson(), {
      'action': 'navigate',
      'from': '/splash',
      'to': '/user/:userId',
    });
  });
}
