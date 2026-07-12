import 'package:flutter/material.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/presentation/widgets/profile_level_block.dart';
import 'package:quiz/features/user/presentation/widgets/profile_link_row.dart';
import 'package:quiz/features/user/presentation/widgets/profile_stats_grid.dart';
import 'package:quiz/features/user/presentation/widgets/profile_user_block.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.profile,
    required this.isPublic,
    this.onAchievementsTap,
  });

  final UserEntity profile;
  final bool isPublic;
  final VoidCallback? onAchievementsTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 24),
      children: [
        ProfileUserBlock(profile: profile, isPublic: isPublic),
        const SizedBox(height: 22),
        ProfileLevelBlock(profile: profile, isPublic: isPublic),
        const SizedBox(height: 24),
        ProfileStatsGrid(profile: profile),
        const SizedBox(height: 18),
        ProfileAchievementsRow(
          unlocked: profile.achievementsUnlocked,
          total: profile.achievementsTotal,
          onTap: onAchievementsTap,
        ),
      ],
    );
  }
}
