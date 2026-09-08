import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

enum AuthenticatedUserDestination { home, quiz, profileEdit }

AuthenticatedUserDestination authenticatedUserDestination(
  UserEntity? user,
  DailyEditionState dailyEdition,
) {
  if (user?.name?.trim().isNotEmpty != true) {
    return AuthenticatedUserDestination.profileEdit;
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
  switch (authenticatedUserDestination(
    user,
    ref.read(dailyEditionProvider),
  )) {
    case AuthenticatedUserDestination.home:
      context.go('/');
    case AuthenticatedUserDestination.quiz:
      context.goNamed('quiz');
    case AuthenticatedUserDestination.profileEdit:
      context.goNamed('profile-edit');
  }
}
