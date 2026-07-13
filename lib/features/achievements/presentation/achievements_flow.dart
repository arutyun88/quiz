import 'package:flutter/material.dart';
import 'package:quiz/features/achievements/presentation/pages/achievements_page.dart';

class AchievementsFlow extends StatelessWidget {
  const AchievementsFlow({
    super.key,
    this.userId,
  });

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return AchievementsPage(userId: userId);
  }
}
