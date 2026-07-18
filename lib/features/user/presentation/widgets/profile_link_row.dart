import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

/// Mono link row of the profile (ДОСТИЖЕНИЯ · 12/30, МАСТЕРСТВО …).
/// Borders come from the surrounding [SettingsRowGroup].
class ProfileLinkRow extends StatelessWidget {
  const ProfileLinkRow({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label.toUpperCase(),
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
