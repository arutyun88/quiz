import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileAchievementsRow extends StatelessWidget {
  const ProfileAchievementsRow({
    super.key,
    required this.unlocked,
    required this.total,
    this.onTap,
  });

  final int unlocked;
  final int total;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: colors.text.primary, width: 1.5),
            bottom: BorderSide(color: colors.text.primary, width: 1.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.t.profile.view.achievements(
                unlocked: unlocked,
                total: total,
              ),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                color: colors.text.primary,
              ),
            ),
            if (onTap != null) Icon(Icons.arrow_forward, size: 20, color: colors.text.primary),
          ],
        ),
      ),
    );
  }
}
