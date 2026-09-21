import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/navigation/quiz_navigation.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

enum AuthenticatedUserDestination { home, quiz, dailyLimit, profileEdit }

AuthenticatedUserDestination authenticatedUserDestination(
  UserEntity? user,
  DailyEditionState dailyEdition,
) {
  if (user?.name?.trim().isNotEmpty != true) {
    return AuthenticatedUserDestination.profileEdit;
  }
  if (dailyEdition case DailyEditionSummaryState(:final summary)
      when summary.summaryAcknowledged) {
    return AuthenticatedUserDestination.dailyLimit;
  }
  return shouldResumeDailyEdition(dailyEdition)
      ? AuthenticatedUserDestination.quiz
      : AuthenticatedUserDestination.home;
}

Future<void> routeAuthenticatedUser(
  BuildContext context,
  WidgetRef ref,
  UserEntity? user,
) async {
  if (user case UserEntity user when user.name?.trim().isNotEmpty == true) {
    final current = ref.read(dailyEditionProvider);
    if (current is DailyEditionInitialState) {
      await ref.read(dailyEditionProvider.notifier).bootstrap(
            timezoneId: user.timezoneId,
          );
    }
  }
  if (!context.mounted) return;
  final current = ref.read(dailyEditionProvider);
  if (current case DailyEditionSummaryState(:final summary)
      when summary.summaryAcknowledged &&
          summary.continuation.nextAction ==
              DailyContinuationAction.playQuestion) {
    await ref.read(dailyEditionProvider.notifier).resumeAcknowledgedSummary();
  }
  if (!context.mounted) return;
  switch (authenticatedUserDestination(
    user,
    ref.read(dailyEditionProvider),
  )) {
    case AuthenticatedUserDestination.home:
      context.go('/');
    case AuthenticatedUserDestination.quiz:
      context.goNamed('quiz', extra: QuizRouteTransition.immediate);
    case AuthenticatedUserDestination.dailyLimit:
      // Authentication has no calling tab. Establish the app underneath the sheet.
      final router = GoRouter.of(context);
      router.goNamed('rating');
      scheduleMicrotask(() => router.pushNamed<void>('daily-limit'));
    case AuthenticatedUserDestination.profileEdit:
      context.goNamed('profile-edit');
  }
}
