import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/utils/localized_ordinal_day.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyResultReport extends StatelessWidget {
  const DailyResultReport({
    super.key,
    required this.summary,
    required this.onReview,
  });

  final DailySummaryEntity summary;
  final VoidCallback onReview;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    final accuracy = ((summary.accuracy ?? 0) * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          t.goal_completed,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            color: colors.text.accent,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(
                text: summary.correctCount.toString(),
                children: [
                  TextSpan(
                    text: ' / ${summary.requiredCount}',
                    style: GoogleFonts.unbounded(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
              style: GoogleFonts.unbounded(
                fontSize: 64,
                fontWeight: FontWeight.w800,
                height: 1,
                color: colors.text.primary,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$accuracy%',
                    style: GoogleFonts.unbounded(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t.accuracy_label,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _AnswerSegments(summary: summary),
        const SizedBox(height: 20),
        _ResultStats(summary: summary),
        const SizedBox(height: 18),
        _ResultInsight(summary: summary),
        if (summary.topicResults.isNotEmpty) ...[
          const SizedBox(height: 18),
          _TopicResults(results: summary.topicResults),
        ],
        if (_mistakeCount > 0) ...[
          const SizedBox(height: 18),
          _ReviewAnswers(mistakeCount: _mistakeCount, onTap: onReview),
        ],
      ],
    );
  }

  int get _mistakeCount => (summary.requiredCount - summary.correctCount).clamp(
        0,
        summary.requiredCount,
      );
}

class _AnswerSegments extends StatelessWidget {
  const _AnswerSegments({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final total = summary.requiredCount;
    if (total <= 0) return const SizedBox.shrink();

    final answered =
        (summary.resolvedCount - summary.skippedCount).clamp(0, total);
    final correct = summary.correctCount.clamp(0, answered);

    return Semantics(
      label: context.t.daily_result.score_semantics(
        correct: correct,
        total: total,
      ),
      child: Row(
        children: List.generate(total, (index) {
          final Color color;
          if (index < correct) {
            color = colors.text.accent;
          } else if (index < answered) {
            color = colors.text.primary;
          } else {
            color = colors.divider;
          }
          return Expanded(
            child: Container(
              height: 8,
              margin: EdgeInsets.only(right: index == total - 1 ? 0 : 4),
              color: color,
            ),
          );
        }),
      ),
    );
  }
}

class _ResultStats extends StatelessWidget {
  const _ResultStats({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final t = context.t.daily_result;
    final stats = <({String value, String label})>[
      (value: '+${summary.totalXp}', label: t.xp_label),
      if (summary.ratingDelta case final ratingDelta?)
        (value: _signed(ratingDelta), label: t.rating_label),
      if (summary.streakAfter != null)
        (
          value: _signed(summary.streakDelta ?? 1),
          label: t.streak_stat_label,
        ),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.palette.text.primary, width: 1.5),
          bottom: BorderSide(color: context.palette.text.primary, width: 1.5),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            for (var index = 0; index < stats.length; index++)
              Expanded(
                child: _ResultStat(
                  value: stats[index].value,
                  label: stats[index].label,
                  showDivider: index > 0,
                ),
              ),
          ],
        ),
      ),
    );
  }

  static String _signed(int value) {
    if (value > 0) return '+$value';
    if (value < 0) return '−${value.abs()}';
    return '0';
  }
}

class _ResultStat extends StatelessWidget {
  const _ResultStat({
    required this.value,
    required this.label,
    required this.showDivider,
  });

  final String value;
  final String label;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left:
              showDivider ? BorderSide(color: colors.divider) : BorderSide.none,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: GoogleFonts.unbounded(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: colors.text.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6,
              color: colors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultInsight extends StatelessWidget {
  const _ResultInsight({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final t = context.t.daily_result;
    final text = switch ((summary.percentile, summary.streakAfter)) {
      (final percentile?, _) =>
        t.percentile_insight(percentile: percentile.round()),
      (_, final streak?) => t.streak_insight(
          day: localizedOrdinalDay(
            streak + 1,
            Localizations.localeOf(context).languageCode,
          ),
        ),
      _ => t.completed_insight,
    };

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.palette.divider),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        text,
        style: GoogleFonts.spectral(
          fontSize: 15,
          fontStyle: FontStyle.italic,
          color: context.palette.text.primary,
        ),
      ),
    );
  }
}

class _TopicResults extends StatelessWidget {
  const _TopicResults({required this.results});

  final List<DailyTopicResultEntity> results;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '// ${context.t.daily_result.by_topic}',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            color: colors.text.accent,
          ),
        ),
        const SizedBox(height: 12),
        for (var index = 0; index < results.length; index++) ...[
          _TopicResultRow(result: results[index]),
          if (index != results.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _TopicResultRow extends StatelessWidget {
  const _TopicResultRow({required this.result});

  final DailyTopicResultEntity result;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final ratio = result.totalCount == 0
        ? 0.0
        : (result.correctCount / result.totalCount).clamp(0.0, 1.0);
    final progressColor = ratio < 0.6 ? colors.text.danger : colors.text.accent;
    final labelStyle = GoogleFonts.jetBrainsMono(
      fontSize: 9,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.6,
      color: colors.text.primary,
    );

    return Row(
      children: [
        SizedBox(
          width: 88,
          child: Text(
            result.topic.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: labelStyle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRect(
            child: Stack(
              children: [
                Container(height: 6, color: colors.divider),
                FractionallySizedBox(
                  widthFactor: ratio,
                  child: Container(height: 6, color: progressColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 30,
          child: Text(
            '${result.correctCount}/${result.totalCount}',
            textAlign: TextAlign.end,
            style: labelStyle.copyWith(color: colors.text.secondary),
          ),
        ),
      ],
    );
  }
}

class _ReviewAnswers extends StatelessWidget {
  const _ReviewAnswers({required this.mistakeCount, required this.onTap});

  final int mistakeCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: colors.text.primary, width: 1.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.review_answers,
                    style: GoogleFonts.unbounded(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    t.mistakes(n: mistakeCount).toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, size: 20, color: colors.text.primary),
          ],
        ),
      ),
    );
  }
}
