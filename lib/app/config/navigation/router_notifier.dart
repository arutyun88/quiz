import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/main_layout.dart';
import 'package:quiz/features/authentication/presentation/sign_in/sign_in_flow.dart';
import 'package:quiz/features/authentication/presentation/sign_up/sign_up_flow.dart';
import 'package:quiz/features/home/presentation/home_flow.dart';
import 'package:quiz/features/profile/presentation/profile_flow.dart';
import 'package:quiz/features/rating/presentation/rating_flow.dart';
import 'package:quiz/features/settings/presentation/settings_flow.dart';
import 'package:quiz/features/splash/presentation/splash_flow.dart';

class RouterNotifier extends AsyncNotifier<GoRouter> {
  @override
  FutureOr<GoRouter> build() {
    return GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashFlow(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginFlow(),
        ),
        GoRoute(
          path: '/registration',
          name: 'registration',
          builder: (context, state) => const RegistrationFlow(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => MainLayout(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/',
                  name: 'home',
                  builder: (context, state) => const HomeFlow(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/rating',
                  name: 'rating',
                  builder: (context, state) => const RatingFlow(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  name: 'profile',
                  builder: (context, state) => const ProfileFlow(),
                  routes: [
                    GoRoute(
                      path: 'settings',
                      name: 'profile-settings',
                      builder: (context, state) => const SettingsFlow(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
