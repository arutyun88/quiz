import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/main_layout.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('reselecting a tab pops one route at a time', (tester) async {
    final router = GoRouter(
      initialLocation: '/profile/details/edit',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              MainLayout(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(path: '/', builder: (_, __) => const SizedBox()),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/rating',
                  builder: (_, __) => const SizedBox(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (_, __) => const SizedBox(),
                  routes: [
                    GoRoute(
                      path: 'details',
                      builder: (_, __) => const SizedBox(),
                      routes: [
                        GoRoute(
                          path: 'edit',
                          builder: (_, __) => const SizedBox(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        child: TranslationProvider(
          child: MaterialApp.router(
            theme: AppTheme.light,
            routerConfig: router,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      router.routeInformationProvider.value.uri.path,
      '/profile/details/edit',
    );

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/profile/details');

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/profile');
  });
}
