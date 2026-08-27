import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/features/leaderboard/domain/entity/season_history_entity.dart';
import 'package:quiz/features/leaderboard/presentation/provider/season_history_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class SeasonHistoryView extends ConsumerWidget {
  const SeasonHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(seasonHistoryProvider);
    return switch (state) {
      SeasonHistoryLoadingState() => const _HistoryLoading(),
      SeasonHistoryDataState() => _HistoryData(
          state: state,
          onLoadMore: ref.read(seasonHistoryProvider.notifier).loadMore,
        ),
      SeasonHistoryFailedState() => _HistoryError(
          onRetry: ref.read(seasonHistoryProvider.notifier).fetch,
        ),
    };
  }
}

class _HistoryData extends StatelessWidget {
  const _HistoryData({required this.state, required this.onLoadMore});

  final SeasonHistoryDataState state;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    if (state.items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            context.t.leaderboard.history_empty,
            textAlign: TextAlign.center,
            style: GoogleFonts.spectral(
              fontSize: 17,
              color: context.palette.text.secondary,
            ),
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
      children: [
        for (final season in state.items) _SeasonCard(season: season),
        if (state.hasMore)
          _HistoryAction(
            label: context.t.leaderboard.load_more,
            loading: state.isLoadingMore,
            onTap: onLoadMore,
          ),
        if (state.failure != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              context.t.leaderboard.load_more_failed,
              textAlign: TextAlign.center,
              style: GoogleFonts.spectral(
                fontSize: 14,
                color: context.palette.text.danger,
              ),
            ),
          ),
      ],
    );
  }
}

class _SeasonCard extends StatelessWidget {
  const _SeasonCard({required this.season});

  final SeasonHistoryEntity season;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final delta = season.ratingDelta;
    final deltaText = delta > 0 ? '+$delta' : '$delta';
    final accuracy = (season.accuracy * 100).round();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colors.card.background,
        border: Border.all(color: colors.card.border),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${_date(season.startsAt)} — ${_date(season.endsAt)}',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: colors.text.secondary,
                  ),
                ),
              ),
              if (season.isCurrent)
                Text(
                  context.t.leaderboard.current_badge.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: colors.text.accent,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  season.ratingAfter.toString(),
                  style: GoogleFonts.unbounded(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    height: 1,
                    color: colors.text.primary,
                  ),
                ),
              ),
              Text(
                deltaText,
                style: GoogleFonts.unbounded(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color:
                      delta >= 0 ? colors.answer.success : colors.text.danger,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            context.t.leaderboard.season_rating.toUpperCase(),
            style: _labelStyle(context),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _Metric(
                label: context.t.leaderboard.rank_header,
                value: season.rank?.toString() ??
                    context.t.leaderboard.provisional_short,
              ),
              _Metric(
                label: context.t.leaderboard.best_rating,
                value: season.bestRating.toString(),
              ),
              _Metric(
                label: context.t.leaderboard.accuracy_label,
                value: '$accuracy%',
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            context.t.leaderboard.season_answers(
              correct: season.correctAnswers,
              total: season.officialAnswers,
            ),
            style: GoogleFonts.spectral(
              fontSize: 13,
              color: colors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value,
                style: GoogleFonts.unbounded(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: context.palette.text.primary,
                )),
            const SizedBox(height: 3),
            Text(label.toUpperCase(), style: _labelStyle(context)),
          ],
        ),
      );
}

TextStyle _labelStyle(BuildContext context) => GoogleFonts.jetBrainsMono(
      fontSize: 8,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.7,
      color: context.palette.text.secondary,
    );

String _date(DateTime value) {
  final utc = value.toUtc();
  String two(int number) => number.toString().padLeft(2, '0');
  return '${two(utc.day)}.${two(utc.month)}.${utc.year}';
}

class _HistoryAction extends StatelessWidget {
  const _HistoryAction({
    required this.label,
    required this.onTap,
    this.loading = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: loading ? null : onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.palette.text.primary, width: 1.5),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: loading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.palette.text.primary,
                  ),
                )
              : Text(
                  label.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: context.palette.text.primary,
                  ),
                ),
        ),
      );
}

class _HistoryLoading extends StatelessWidget {
  const _HistoryLoading();

  @override
  Widget build(BuildContext context) => AppShimmer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
          children: [
            for (var i = 0; i < 4; i++) ...[
              Container(height: 155, color: context.palette.background.dynamic),
              const SizedBox(height: 12),
            ],
          ],
        ),
      );
}

class _HistoryError extends StatelessWidget {
  const _HistoryError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.t.leaderboard.history_load_failed,
                textAlign: TextAlign.center,
                style: GoogleFonts.spectral(
                  fontSize: 17,
                  color: context.palette.text.primary,
                ),
              ),
              const SizedBox(height: 16),
              _HistoryAction(
                label: context.t.leaderboard.retry,
                onTap: onRetry,
              ),
            ],
          ),
        ),
      );
}
