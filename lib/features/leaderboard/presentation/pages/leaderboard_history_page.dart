import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_timeline_entity.dart';
import 'package:quiz/features/leaderboard/presentation/provider/leaderboard_timeline_provider.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/rank_sparkline.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardHistoryPage extends ConsumerWidget {
  const LeaderboardHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leaderboardTimelineProvider);

    return AppScaffold(
      title: context.t.leaderboard.history.title,
      body: switch (state) {
        BaseLoadingState() => const _HistoryLoading(),
        BaseDataState(:final data) => _HistoryView(timeline: data),
        _ => _HistoryError(onRetry: () => ref.read(leaderboardTimelineProvider.notifier).fetch()),
      },
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView({required this.timeline});

  final LeaderboardTimelineEntity timeline;

  @override
  Widget build(BuildContext context) {
    if (!timeline.days.any((day) => day.isPlayed)) return const _HistoryEmpty();

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 24),
      children: [
        _CurrentRankBlock(timeline: timeline),
        const SizedBox(height: 20),
        RankSparkline(days: timeline.days),
        const SizedBox(height: 18),
        Text(
          '// ${context.t.leaderboard.history.by_days_title.toUpperCase()}',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            letterSpacing: 2,
            color: context.palette.text.accent,
          ),
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < timeline.days.length; i++)
          _DayRow(
            day: timeline.days[i],
            isFirst: i == 0,
            isLast: i == timeline.days.length - 1,
          ),
      ],
    );
  }
}

class _CurrentRankBlock extends StatelessWidget {
  const _CurrentRankBlock({required this.timeline});

  final LeaderboardTimelineEntity timeline;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.leaderboard.history;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.current_rank_label.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  letterSpacing: 2,
                  color: colors.text.secondary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                timeline.currentRank != null ? '#${timeline.currentRank}' : '—',
                style: GoogleFonts.unbounded(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  height: 1,
                  color: colors.text.primary,
                ),
              ),
            ],
          ),
        ),
        if (timeline.deltaOverPeriod case final delta?)
          _DeltaBadge(delta: delta, days: timeline.days.length),
      ],
    );
  }
}

class _DeltaBadge extends StatelessWidget {
  const _DeltaBadge({required this.delta, required this.days});

  final int delta;
  final int days;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final (icon, color) = switch (delta) {
      > 0 => (Icons.trending_up, colors.answer.success),
      < 0 => (Icons.trending_down, colors.text.danger),
      _ => (Icons.trending_flat, colors.text.secondary),
    };
    final sign = delta > 0 ? '+' : '';

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 4),
          Text(
            '$sign$delta ${context.t.leaderboard.history.delta_label(n: days)}'.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              letterSpacing: 0.5,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _DayRow extends StatelessWidget {
  const _DayRow({
    required this.day,
    required this.isFirst,
    required this.isLast,
  });

  final TimelineDayEntity day;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.leaderboard.history;
    final (icon, iconColor) = switch (day.trend) {
      RankTrend.up => (Icons.trending_up, colors.answer.success),
      RankTrend.down => (Icons.trending_down, colors.text.danger),
      _ => (Icons.trending_flat, colors.text.secondary),
    };

    final row = Container(
      decoration: BoxDecoration(
        border: Border(
          top: isFirst ? BorderSide(color: colors.text.primary, width: 1.5) : BorderSide(color: colors.divider),
          bottom: isLast ? BorderSide(color: colors.text.primary, width: 1.5) : BorderSide.none,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatDate(context, day.date),
                  style: GoogleFonts.spectral(fontSize: 16, color: colors.text.primary),
                ),
                const SizedBox(height: 1),
                Text(
                  day.isPlayed ? t.points(n: day.points ?? 0).toUpperCase() : t.not_played.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(fontSize: 9, color: colors.text.secondary),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            // Min width keeps ranks aligned across rows; wide ones (#100+) grow instead of wrapping
            constraints: const BoxConstraints(minWidth: 44),
            child: Text(
              day.isPlayed ? '#${day.rank}' : '—',
              textAlign: TextAlign.right,
              maxLines: 1,
              softWrap: false,
              style: GoogleFonts.unbounded(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: day.isPlayed ? colors.text.primary : colors.text.secondary,
              ),
            ),
          ),
          SizedBox(
            width: 24,
            child: day.isPlayed
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Icon(icon, size: 17, color: iconColor),
                  )
                : null,
          ),
        ],
      ),
    );

    // A day without a result stays in place but recedes, so the played days keep the reader's attention
    return day.isPlayed ? row : Opacity(opacity: 0.5, child: row);
  }

  String _formatDate(BuildContext context, DateTime date) {
    final t = context.t.leaderboard.history;
    // Leaderboard days are UTC days (the daily edition rolls over at UTC midnight), so "today" is compared in UTC:
    // by local date, a user ahead of UTC would see the still-running day labelled "yesterday" after local midnight
    final now = DateTime.now().toUtc();
    final today = DateTime.utc(now.year, now.month, now.day);
    final difference = today.difference(DateTime.utc(date.year, date.month, date.day)).inDays;

    return switch (difference) {
      0 => t.today,
      1 => t.yesterday,
      _ => DateFormat('d MMMM', LocaleSettings.instance.currentLocale.languageCode).format(date),
    };
  }
}

class _HistoryEmpty extends StatelessWidget {
  const _HistoryEmpty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 40, 22, 24),
      child: Text(
        context.t.leaderboard.history.empty,
        textAlign: TextAlign.center,
        style: GoogleFonts.spectral(fontSize: 17, color: context.palette.text.primary),
      ),
    );
  }
}

class _HistoryLoading extends StatelessWidget {
  const _HistoryLoading();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AppShimmer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 24),
        children: [
          Container(height: 56, width: 140, color: colors.background.dynamic),
          const SizedBox(height: 20),
          Container(height: 110, color: colors.background.dynamic),
          const SizedBox(height: 26),
          for (var i = 0; i < 5; i++) ...[
            Container(height: 44, color: colors.background.dynamic),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _HistoryError extends StatelessWidget {
  const _HistoryError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.leaderboard.history;

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 28, 22, 24),
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.text.primary, width: 1.5),
              bottom: BorderSide(color: colors.divider),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            children: [
              Text(
                t.error,
                textAlign: TextAlign.center,
                style: GoogleFonts.spectral(fontSize: 17, color: colors.text.primary),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onRetry,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.text.primary, width: 1.5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, size: 18, color: colors.text.primary),
                      const SizedBox(width: 8),
                      Text(
                        t.retry.toUpperCase(),
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: colors.text.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
