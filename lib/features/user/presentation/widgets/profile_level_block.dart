import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileLevelBlock extends StatelessWidget {
  const ProfileLevelBlock({
    super.key,
    required this.profile,
    required this.isPublic,
  });

  final UserEntity profile;
  final bool isPublic;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t;
    final nextLevel = (profile.level + 1).toString().padLeft(2, '0');
    final xpStyle = GoogleFonts.jetBrainsMono(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: colors.text.secondary,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.profile.view.current_level_label,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      color: colors.text.secondary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    profile.level.toString().padLeft(2, '0'),
                    style: GoogleFonts.unbounded(
                      fontSize: 78,
                      fontWeight: FontWeight.w800,
                      height: 0.85,
                      color: colors.text.primary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                t.profile.view.next_level(n: nextLevel),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: isPublic ? colors.text.secondary : colors.text.accent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: SizedBox(
            height: 6,
            child: ColoredBox(
              color: colors.background.dynamic,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _progress,
                child: ColoredBox(
                  color: isPublic ? colors.text.primary : colors.text.accent,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.gamification.xp(
                current: profile.experienceInLevel,
                total: profile.levelExperience,
              ),
              style: xpStyle,
            ),
            if (!isPublic)
              Text(
                t.gamification
                    .xp_remaining(
                      remaining: profile.levelExperience - profile.experienceInLevel,
                    )
                    .toUpperCase(),
                style: xpStyle,
              ),
          ],
        ),
      ],
    );
  }

  double get _progress {
    if (profile.levelExperience <= 0) return 0;
    return (profile.experienceInLevel / profile.levelExperience).clamp(0.0, 1.0);
  }
}
