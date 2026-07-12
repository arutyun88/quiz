import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.showBack = false,
    this.trailing,
  });

  final bool showBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
      child: Row(
        children: [
          if (showBack) ...[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: context.pop,
              child: Icon(Icons.arrow_back, size: 22, color: colors.text.primary),
            ),
            const SizedBox(width: 12),
          ],
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'QUIZ',
                  style: GoogleFonts.unbounded(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: colors.text.primary,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: GoogleFonts.unbounded(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: colors.text.accent,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class ProfileHeaderButton extends StatelessWidget {
  const ProfileHeaderButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          border: Border.all(color: colors.text.primary),
        ),
        child: Icon(icon, size: 18, color: colors.text.primary),
      ),
    );
  }
}
