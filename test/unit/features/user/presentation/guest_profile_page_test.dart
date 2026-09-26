import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/user/presentation/pages/guest_profile_page.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('shows the guest profile without a profile request error',
      (tester) async {
    final router = GoRouter(
      initialLocation: '/profile',
      routes: [
        GoRoute(
          path: '/profile',
          builder: (_, __) => const GuestProfilePage(),
          routes: [
            GoRoute(
              path: 'settings',
              builder: (_, __) => const SizedBox(),
            ),
            GoRoute(
              path: 'debug',
              name: 'debug',
              builder: (_, __) => const Text('DEBUG'),
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (_, __) => const Text('LOGIN'),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(TranslationProvider(
      child: MaterialApp.router(
        theme: AppTheme.light,
        routerConfig: router,
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.text(t.profile.guest.title), findsOneWidget);
    expect(find.text(t.profile.guest.sign_in), findsOneWidget);
    expect(find.text(t.profile.view.load_failed), findsNothing);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.add_moderator_outlined), findsOneWidget);

    await tester.tap(find.text(t.profile.guest.sign_in));
    await tester.pumpAndSettle();
    expect(find.text('LOGIN'), findsOneWidget);
  });
}
