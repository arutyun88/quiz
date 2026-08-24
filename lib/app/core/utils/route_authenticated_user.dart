import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

void routeAuthenticatedUser(BuildContext context, UserEntity? user) {
  if (user case UserEntity user when user.name?.trim().isNotEmpty == true) {
    context.go('/');
  } else {
    context.goNamed('profile-edit');
  }
}
