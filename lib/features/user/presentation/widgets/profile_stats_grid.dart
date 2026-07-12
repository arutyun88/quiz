import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileStatsGrid extends StatelessWidget {
  const ProfileStatsGrid({
    super.key,
    required this.profile,
  });

  final UserEntity profile;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.profile.view;
    final accuracy = _accuracyParts(profile.accuracy);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.stats_section,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            color: colors.text.accent,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.text.primary, width: 1.5),
            ),
          ),
          child: Row(
            children: [
              _StatCell(value: profile.streakDays.toString(), label: t.stat_streak),
              _StatCell(
                value: profile.questionsAnswered.toString(),
                label: t.stat_answers,
                withLeftBorder: true,
              ),
              _StatCell(
                value: accuracy.main,
                valueSuffix: accuracy.suffix,
                label: t.stat_accuracy,
                withLeftBorder: true,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.divider),
            ),
          ),
          child: Row(
            children: [
              _StatCell(
                value: profile.totalPoints.toString(),
                label: t.stat_points,
                valueColor: colors.text.accent,
              ),
              _StatCell(
                value: profile.bestStreakDays.toString(),
                label: t.stat_best_streak,
                withLeftBorder: true,
              ),
              _StatCell(
                value: _daysInGame.toString(),
                label: t.stat_days_in_game,
                withLeftBorder: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  int get _daysInGame => DateTime.now().difference(profile.memberSince).inDays + 1;

  ({String main, String suffix}) _accuracyParts(double accuracy) {
    final percent = accuracy * 100;
    final wholePart = percent.truncate();
    final fraction = ((percent - wholePart) * 10).round();

    if (fraction == 0 || fraction == 10) {
      return (main: percent.round().toString(), suffix: '%');
    }
    return (main: wholePart.toString(), suffix: '.$fraction%');
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.value,
    required this.label,
    this.valueSuffix,
    this.valueColor,
    this.withLeftBorder = false,
  });

  final String value;
  final String label;
  final String? valueSuffix;
  final Color? valueColor;
  final bool withLeftBorder;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Expanded(
      child: Container(
        decoration: withLeftBorder
            ? BoxDecoration(
                border: Border(left: BorderSide(color: colors.divider)),
              )
            : null,
        padding: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: withLeftBorder ? 16 : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              maxLines: 1,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: valueColor ?? colors.text.primary,
                    ),
                  ),
                  if (valueSuffix != null)
                    TextSpan(
                      text: valueSuffix,
                      style: GoogleFonts.unbounded(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: valueColor ?? colors.text.primary,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                color: colors.text.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
