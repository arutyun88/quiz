import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_badge.dart';
import 'package:quiz/gen/strings.g.dart';

class StartDayHeader extends StatelessWidget {
  const StartDayHeader({
    super.key,
    required this.streak,
    required this.level,
    this.subtitle,
  });

  final int streak;
  final int? level;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.gamification;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'QUIZ',
                      style: GoogleFonts.unbounded(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: colors.text.primary,
                        letterSpacing: 0.5,
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
              const SizedBox(height: 3),
              Text(
                subtitle ?? _formatDate(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  letterSpacing: 1.5,
                  color: colors.text.secondary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8.0,
            children: [
              AppBadge.outlined(
                value: streak.toString(),
                label: t.streak_badge_label,
                muted: streak == 0,
              ),
              AppBadge.filled(
                value: level != null ? level.toString().padLeft(2, '0') : '—',
                label: t.level_badge_label,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate() {
    final now = DateTime.now();
    final locale = LocaleSettings.instance.currentLocale.languageCode;
    final weekday = DateFormat.E(locale).format(now).toUpperCase();
    final dayMonth = DateFormat('d MMMM', locale).format(now).toUpperCase();
    return '$weekday · $dayMonth';
  }
}
