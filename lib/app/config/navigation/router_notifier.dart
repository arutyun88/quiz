import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/main_layout.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/analytics/presentation/product_analytics_navigator_observer.dart';
import 'package:quiz/features/achievements/presentation/achievements_flow.dart';
import 'package:quiz/features/authentication/presentation/forgot_password/forgot_password_flow.dart';
import 'package:quiz/features/authentication/presentation/sign_in/sign_in_flow.dart';
import 'package:quiz/features/authentication/presentation/sign_up/sign_up_flow.dart';
import 'package:quiz/features/daily_limit/presentation/daily_limit_flow.dart';
import 'package:quiz/features/daily_result/presentation/daily_result_gate_flow.dart';
import 'package:quiz/features/debug/debug_answered_question_page.dart';
import 'package:quiz/features/debug/debug_flow.dart';
import 'package:quiz/features/debug/debug_question_page.dart';
import 'package:quiz/features/home/presentation/home_gate_flow.dart';
import 'package:quiz/features/home/presentation/quiz_gate_flow.dart';
import 'package:quiz/features/mastery/presentation/mastery_flow.dart';
import 'package:quiz/features/onboarding/presentation/onboarding_flow.dart';
import 'package:quiz/features/rating/presentation/rating_flow.dart';
import 'package:quiz/features/review/presentation/review_flow.dart';
import 'package:quiz/features/settings/presentation/about_page.dart';
import 'package:quiz/features/settings/presentation/language_page.dart';
import 'package:quiz/features/settings/presentation/notifications_page.dart';
import 'package:quiz/features/settings/presentation/settings_flow.dart';
import 'package:quiz/features/settings/presentation/subscription_page.dart';
import 'package:quiz/features/splash/presentation/splash_flow.dart';
import 'package:quiz/features/user/presentation/pages/edit/change_password_page.dart';
import 'package:quiz/features/user/presentation/pages/edit/profile_edit_flow.dart';
import 'package:quiz/features/user/presentation/pages/adult_content_settings_page.dart';
import 'package:quiz/features/user/presentation/pages/profile_flow.dart';
import 'package:quiz/features/user/presentation/pages/public_profile_page.dart';

class RouterNotifier extends AsyncNotifier<GoRouter> {
  @override
  FutureOr<GoRouter> build() {
    final analytics = getIt<ProductAnalytics>();
    return GoRouter(
      initialLocation: '/splash',
      observers: [ProductAnalyticsNavigatorObserver(analytics)],
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashFlow(),
        ),
        GoRoute(
          path: '/onboarding',
          name: 'onboarding',
          builder: (context, state) => const OnboardingFlow(),
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
        GoRoute(
          path: '/forgot-password',
          name: 'forgot-password',
          builder: (context, state) => const ForgotPasswordFlow(),
        ),
        // В1/В2/В4 — full-screen, no tab bar. Fade transition (not the default forward
        // slide) so closing them does not read as «going deeper». Siblings (not nested)
        // so returning В4 → В2 rebuilds В2 fresh with the updated counter.
        GoRoute(
          path: '/daily-result',
          name: 'daily-result',
          pageBuilder: (context, state) =>
              _fadePage(const DailyResultGateFlow(), state),
        ),
        GoRoute(
          path: '/daily-limit',
          name: 'daily-limit',
          pageBuilder: (context, state) =>
              _fadePage(const DailyLimitFlow(), state),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              MainLayout(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              observers: [ProductAnalyticsNavigatorObserver(analytics)],
              routes: [
                GoRoute(
                  path: '/',
                  name: 'home',
                  builder: (context, state) => const HomeGateFlow(),
                ),
                GoRoute(
                  path: '/quiz',
                  name: 'quiz',
                  builder: (context, state) => QuizGateFlow(
                    reviewSourceAttemptId:
                        state.uri.queryParameters['reviewAttemptId'],
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              observers: [ProductAnalyticsNavigatorObserver(analytics)],
              routes: [
                GoRoute(
                  path: '/rating',
                  name: 'rating',
                  builder: (context, state) => const RatingFlow(),
                  routes: [
                    GoRoute(
                      path: 'user/:userId',
                      name: 'public-profile',
                      builder: (context, state) => PublicProfilePage(
                        userId: state.pathParameters['userId']!,
                      ),
                      routes: [
                        GoRoute(
                          path: 'achievements',
                          name: 'public-profile-achievements',
                          builder: (context, state) => AchievementsFlow(
                            userId: state.pathParameters['userId']!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              observers: [ProductAnalyticsNavigatorObserver(analytics)],
              routes: [
                GoRoute(
                  path: '/profile',
                  name: 'profile',
                  builder: (context, state) => const ProfileFlow(),
                  routes: [
                    GoRoute(
                      path: 'achievements',
                      name: 'profile-achievements',
                      builder: (context, state) => const AchievementsFlow(),
                    ),
                    GoRoute(
                      path: 'mastery',
                      name: 'profile-mastery',
                      builder: (context, state) => const MasteryFlow(),
                    ),
                    GoRoute(
                      path: 'review',
                      name: 'profile-review',
                      builder: (context, state) => const ReviewFlow(),
                    ),
                    GoRoute(
                      path: 'settings',
                      name: 'profile-settings',
                      builder: (context, state) => const SettingsFlow(),
                      routes: [
                        GoRoute(
                          path: 'edit',
                          name: 'profile-edit',
                          builder: (context, state) => const ProfileEditFlow(),
                          routes: [
                            GoRoute(
                              path: 'password',
                              name: 'profile-edit-password',
                              builder: (context, state) =>
                                  const ChangePasswordPage(),
                            ),
                          ],
                        ),
                        GoRoute(
                          path: 'notifications',
                          name: 'profile-settings-notifications',
                          builder: (context, state) =>
                              const NotificationsPage(),
                        ),
                        GoRoute(
                          path: 'adult-content',
                          name: 'profile-settings-adult-content',
                          builder: (context, state) =>
                              const AdultContentSettingsPage(),
                        ),
                        GoRoute(
                          path: 'subscription',
                          name: 'profile-settings-subscription',
                          builder: (context, state) => const SubscriptionPage(),
                        ),
                        GoRoute(
                          path: 'language',
                          name: 'profile-settings-language',
                          builder: (context, state) => const LanguagePage(),
                        ),
                        GoRoute(
                          path: 'about',
                          name: 'profile-settings-about',
                          builder: (context, state) => const AboutPage(),
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'debug',
                      name: 'debug',
                      builder: (context, state) => const DebugFlow(),
                      routes: [
                        GoRoute(
                          path: 'questions',
                          name: 'debug-questions',
                          builder: (context, state) =>
                              const DebugQuestionPage(),
                        ),
                        GoRoute(
                          path: 'questions/answered',
                          name: 'debug-answered-questions',
                          builder: (context, state) =>
                              const DebugAnsweredQuestionPage(),
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
  }
}

/// Directionless fade for the full-screen daily-end routes (В1/В2/В4): a `go`
/// transition otherwise slides forward, which reads wrong when closing them.
CustomTransitionPage<void> _fadePage(Widget child, GoRouterState state) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 220),
    reverseTransitionDuration: const Duration(milliseconds: 220),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
