import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

/// Raised card on the [Palette.card] surface: a leading icon, a title with an
/// optional mono caption, and an optional trailing icon. Shared by В2 (ad offer),
/// В5 (partner block) and Г1 (guest progress notice).
class AppInfoCard extends StatelessWidget {
  const AppInfoCard({
    super.key,
    required this.icon,
    required this.title,
    this.caption,
    this.trailingIcon = Icons.arrow_forward,
    this.iconColor,
    this.onTap,
  });

  final IconData icon;
  final String title;

  /// Mono uppercase caption under the title (e.g. «+2 ВОПРОСА · БЕСПЛАТНО»).
  final String? caption;

  /// `null` hides the trailing affordance entirely.
  final IconData? trailingIcon;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    final card = Container(
      decoration: BoxDecoration(
        color: colors.card.background,
        border: Border.all(color: colors.card.border),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Icon(icon, size: 22, color: iconColor ?? colors.answer.success),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.spectral(fontSize: 15, color: colors.text.primary),
                ),
                if (caption case final String caption) ...[
                  const SizedBox(height: 1),
                  Text(
                    caption,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailingIcon case final IconData trailingIcon) ...[
            const SizedBox(width: 12),
            Icon(trailingIcon, size: 20, color: colors.text.primary),
          ],
        ],
      ),
    );

    if (onTap == null) return card;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: card,
    );
  }
}
