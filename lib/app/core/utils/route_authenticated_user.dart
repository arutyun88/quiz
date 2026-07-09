import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

Future<void> routeAuthenticatedUser(BuildContext context, UserEntity? user) async {
  if (user case UserEntity user when user.name is String && user.name!.isNotEmpty && user.birthDate is DateTime) {
    final result = await getIt<QuestionRepository>().checkAnsweredToday();
    final answeredToday = switch (result) {
      ResultOk(data: final value) => value.answeredToday,
      ResultFailed() => false,
    };
    if (!context.mounted) return;
    if (answeredToday) {
      context.goNamed('quiz');
    } else {
      context.go('/');
    }
  } else {
    context.goNamed('profile-edit');
  }
}
