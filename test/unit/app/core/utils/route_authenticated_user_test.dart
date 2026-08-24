import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/utils/route_authenticated_user.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

void main() {
  testWidgets('complete profile routes to the safe home bootstrap',
      (tester) async {
    final router = _router(_user(name: 'User'));
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.tap(find.byKey(const Key('route-user')));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/');
  });

  testWidgets('missing name routes to profile completion', (tester) async {
    final router = _router(_user(name: null));
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.tap(find.byKey(const Key('route-user')));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/profile-edit');
  });
}

GoRouter _router(UserEntity user) => GoRouter(
      initialLocation: '/trigger',
      routes: [
        GoRoute(
          path: '/trigger',
          builder: (context, state) => Material(
            child: TextButton(
              key: const Key('route-user'),
              onPressed: () => routeAuthenticatedUser(context, user),
              child: const Text('route'),
            ),
          ),
        ),
        GoRoute(path: '/', builder: (context, state) => const Text('home')),
        GoRoute(
          path: '/profile-edit',
          name: 'profile-edit',
          builder: (context, state) => const Text('profile edit'),
        ),
      ],
    );

UserEntity _user({required String? name}) => UserEntity(
      id: 'user-1',
      email: 'user@example.test',
      name: name,
      level: 1,
      experienceInLevel: 0,
      levelExperience: 100,
      streakDays: 0,
      bestStreakDays: 0,
      questionsAnswered: 0,
      correctAnswers: 0,
      accuracy: 0,
      totalPoints: 0,
      memberSince: DateTime.utc(2026),
      achievementsUnlocked: 0,
      achievementsTotal: 0,
    );
