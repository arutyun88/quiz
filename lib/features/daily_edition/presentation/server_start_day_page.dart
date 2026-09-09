import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_result/presentation/widgets/daily_result_report.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/features/home/presentation/widgets/start_day_header.dart';
import 'package:quiz/gen/strings.g.dart';

class ServerStartDayPage extends ConsumerWidget {
  const ServerStartDayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dailyEditionProvider);
    final gamification = ref.watch(gamificationProvider);
    final run = switch (state) {
      DailyEditionActiveState(:final run) ||
      DailyEditionSummaryState(:final run) ||
      DailyEditionFailedState(:final run?) =>
        run,
      _ => null,
    };
    final colors = context.palette;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: colors.background.static,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StartDayHeader(
                streak: gamification.whenOrNull(
                      data: (data) => data.streakDays,
                    ) ??
                    0,
                level: gamification.whenOrNull(data: (data) => data.level),
                subtitle: run == null
                    ? context.t.onboarding.daily_issue
                    : _formatEditionDate(run.editionDate),
              ),
              const AppDivider(indent: 22, endIndent: 22),
              Expanded(
                child: _buildBody(
                  context,
                  ref,
                  state,
                  gamification.whenOrNull(data: (data) => data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    DailyEditionState state,
    UserLevelEntity? gamification,
  ) {
    return switch (state) {
      DailyEditionInitialState() ||
      DailyEditionLoadingState() =>
        const QuizLoading(),
      DailyEditionFailedState(:final failure) => QuizError(failure: failure),
      DailyEditionActiveState(:final run, :final assignment) => _RunOverview(
          run: run,
          fallbackTopic: assignment.topic,
          streakDays: gamification?.streakDays ?? 0,
          notice: gamification?.streakNotice,
          onStart: () async {
            final started =
                await ref.read(dailyEditionProvider.notifier).startEdition();
            if (started && context.mounted) context.goNamed('quiz');
          },
        ),
      DailyEditionSummaryState(:final summary) => _SummaryOverview(
          summary: summary,
          onContinue: () => _continueFromSummary(context, ref, summary),
        ),
    };
  }

  Future<void> _continueFromSummary(
    BuildContext context,
    WidgetRef ref,
    DailySummaryEntity summary,
  ) async {
    switch (summary.continuation.nextAction) {
      case DailyContinuationAction.playQuestion:
        await ref.read(dailyEditionProvider.notifier).continueEdition();
        if (context.mounted &&
            ref.read(dailyEditionProvider) is DailyEditionActiveState) {
          context.goNamed('quiz');
        }
      case DailyContinuationAction.watchRewarded:
      case DailyContinuationAction.waitForRewarded:
      case DailyContinuationAction.limitReached:
        if (context.mounted) context.goNamed('daily-limit');
      case DailyContinuationAction.completeMain:
      case DailyContinuationAction.closed:
      case DailyContinuationAction.unknown:
        if (context.mounted) context.goNamed('rating');
    }
  }
}

String _formatEditionDate(String value) {
  final date = DateTime.tryParse(value);
  if (date == null) return value;
  final locale = LocaleSettings.instance.currentLocale.languageCode;
  final weekday = DateFormat.E(locale).format(date).toUpperCase();
  final dayMonth = DateFormat('d MMMM', locale).format(date).toUpperCase();
  return '$weekday · $dayMonth';
}

class _RunOverview extends StatelessWidget {
  const _RunOverview({
    required this.run,
    required this.fallbackTopic,
    required this.streakDays,
    required this.notice,
    required this.onStart,
  });

  final DailyRunEntity run;
  final String? fallbackTopic;
  final int streakDays;
  final StreakNoticeEntity? notice;
  final Future<void> Function() onStart;

  @override
  Widget build(BuildContext context) {
    final t = context.t.start_day;
    final topics = run.topics.isNotEmpty
        ? run.topics.map((topic) => topic.name).toList(growable: false)
        : [if (fallbackTopic case final topic?) topic];
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.ready_title,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              color: context.palette.text.accent,
            ),
          ),
          const SizedBox(height: 8),
          _IssueCountRow(questionCount: run.requiredCount),
          _TopicChips(topics: topics),
          const SizedBox(height: 24),
          if (notice case final notice?)
            _StreakNoticeBlock(notice: notice)
          else ...[
            Text(
              t.last_session_stats_title,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                letterSpacing: 2,
                color: context.palette.text.accent,
              ),
            ),
            const SizedBox(height: 8),
            if (run.previousDaySummary case final summary?) ...[
              _StatsRow(summary: summary),
              if (streakDays > 0) const _StreakWarning(),
            ] else
              const _NoPreviousDaySummary(),
          ],
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: AppButtonV2(
              label: notice?.type == StreakNoticeType.streakLost
                  ? t.start_new_streak_button
                  : t.start_button,
              onTap: (complete) async {
                await onStart();
                complete();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _IssueCountRow extends StatelessWidget {
  const _IssueCountRow({required this.questionCount});

  final int questionCount;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.start_day;
    final estimatedMinutes = (questionCount * 0.4).ceil().clamp(1, 99);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          questionCount.toString(),
          style: GoogleFonts.unbounded(
            fontSize: 72,
            fontWeight: FontWeight.w800,
            color: colors.text.primary,
            height: 0.8,
            letterSpacing: -2,
          ),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t.question_count_label(n: questionCount),
                style: GoogleFonts.unbounded(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colors.text.primary,
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                t.estimated_time(n: estimatedMinutes),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  letterSpacing: 1,
                  color: colors.text.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopicChips extends StatelessWidget {
  const _TopicChips({required this.topics});

  static const _collapsedVisibleCount = 3;
  static const _expandedVisibleCount = 4;
  final List<String> topics;

  @override
  Widget build(BuildContext context) {
    if (topics.isEmpty) return const SizedBox.shrink();
    final visibleCount = topics.length <= _expandedVisibleCount
        ? _expandedVisibleCount
        : _collapsedVisibleCount;
    final visible = topics.take(visibleCount);
    final restCount = topics.length - visibleCount;
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final topic in visible) _TopicChip(label: topic.toUpperCase()),
          if (restCount > 0) _TopicChip(label: '+$restCount', muted: true),
        ],
      ),
    );
  }
}

class _TopicChip extends StatelessWidget {
  const _TopicChip({required this.label, this.muted = false});

  final String label;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors.divider),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      child: Text(
        label,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 9,
          letterSpacing: 1,
          color: muted ? colors.text.secondary : colors.text.primary,
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.summary});

  final PreviousDaySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.start_day;
    final rank = summary.rank;
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.text.primary, width: 1.5)),
      ),
      child: Row(
        children: [
          _StatCell(
            value: rank == null ? '—' : '#$rank',
            label: t.rank_label,
          ),
          _StatCell(
            value: summary.points.toString(),
            label: t.points_label,
            leftBorder: true,
          ),
          _StatCell(
            value: '${(summary.accuracy * 100).round()}%',
            label: t.accuracy_label,
            leftBorder: true,
            accent: true,
          ),
        ],
      ),
    );
  }
}

class _NoPreviousDaySummary extends StatelessWidget {
  const _NoPreviousDaySummary();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.start_day;
    final textStyle =
        GoogleFonts.spectral(fontSize: 13, color: colors.text.primary);
    final accentStyle = GoogleFonts.spectral(
      fontSize: 13,
      fontStyle: FontStyle.italic,
      color: colors.text.primary,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: colors.text.primary, width: 1.5)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
          child: Text.rich(
            t.no_previous_summary_notice(
              accent: (text) => TextSpan(text: text, style: accentStyle),
            ),
            style: textStyle,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.divider),
              bottom: BorderSide(color: colors.text.primary, width: 1.5),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
          child: Row(
            children: [
              Icon(Icons.bolt, size: 18, color: colors.text.accent),
              const SizedBox(width: 10),
              Expanded(
                child: Text.rich(
                  t.no_previous_summary_advice(
                    accent: (text) => TextSpan(text: text, style: accentStyle),
                  ),
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.value,
    required this.label,
    this.leftBorder = false,
    this.accent = false,
  });

  final String value;
  final String label;
  final bool leftBorder;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Expanded(
      child: Container(
        decoration: leftBorder
            ? BoxDecoration(
                border: Border(left: BorderSide(color: colors.divider)))
            : null,
        padding: EdgeInsets.fromLTRB(leftBorder ? 14 : 0, 12, 0, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: GoogleFonts.unbounded(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: accent ? colors.text.accent : colors.text.primary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 8,
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

class _StreakWarning extends StatelessWidget {
  const _StreakWarning();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.divider),
          bottom: BorderSide(color: colors.text.primary, width: 1.5),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
      child: Row(
        children: [
          Icon(Icons.local_fire_department, size: 18, color: colors.base.gold),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              context.t.start_day.streak_warning(
                accent: (text) => TextSpan(
                  text: text,
                  style: GoogleFonts.spectral(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: colors.text.primary,
                  ),
                ),
              ),
              style: GoogleFonts.spectral(
                  fontSize: 13, color: colors.text.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakNoticeBlock extends StatelessWidget {
  const _StreakNoticeBlock({required this.notice});

  final StreakNoticeEntity notice;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.start_day;
    final textStyle = GoogleFonts.spectral(
      fontSize: 13,
      color: colors.text.primary,
    );
    final accentStyle = GoogleFonts.spectral(
      fontSize: 13,
      fontStyle: FontStyle.italic,
      color: colors.text.primary,
    );
    final TextSpan noticeText;
    final TextSpan adviceText;
    final IconData adviceIcon;
    final Color adviceIconColor;
    switch (notice.type) {
      case StreakNoticeType.freezeApplied:
        noticeText = t.freeze_applied_notice(
          accent: (text) => TextSpan(text: text, style: accentStyle),
          left: TextSpan(text: notice.freezesLeft.toString()),
          total: TextSpan(text: notice.freezesTotal.toString()),
        );
        if (notice.freezesLeft > 0) {
          adviceText = t.freeze_applied_advice(
            accent: (text) => TextSpan(text: text, style: accentStyle),
          );
          adviceIcon = Icons.ac_unit;
          adviceIconColor = colors.text.accent;
        } else {
          adviceText = t.freeze_applied_last_advice(
            accent: (text) => TextSpan(text: text, style: accentStyle),
          );
          adviceIcon = Icons.ac_unit;
          adviceIconColor = colors.text.accent;
        }
      case StreakNoticeType.streakLost:
        final days =
            TextSpan(text: t.streak_lost_days(n: notice.lostStreakDays));
        noticeText = t.streak_lost_notice(
          accent: (text) => TextSpan(text: text, style: accentStyle),
          days: days,
        );
        adviceText = t.streak_lost_advice(
          accent: (text) => TextSpan(text: text, style: accentStyle),
        );
        adviceIcon = Icons.local_fire_department_outlined;
        adviceIconColor = colors.text.danger;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: colors.text.primary, width: 1.5)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
          child: Text.rich(noticeText, style: textStyle),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.divider),
              bottom: BorderSide(color: colors.text.primary, width: 1.5),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
          child: Row(
            children: [
              Icon(adviceIcon, size: 18, color: adviceIconColor),
              const SizedBox(width: 10),
              Expanded(child: Text.rich(adviceText, style: textStyle)),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryOverview extends StatelessWidget {
  const _SummaryOverview({required this.summary, required this.onContinue});

  final DailySummaryEntity summary;
  final Future<void> Function() onContinue;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20),
              child: DailyResultReport(
                summary: summary,
                onReview: () => context.goNamed('profile-review'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          AppButtonV2(
            label: _buttonLabel(context),
            onTap: (complete) async {
              await onContinue();
              complete();
            },
          ),
          const SizedBox(height: 12),
          Text(
            _canContinue ? t.continue_footer : t.footer,
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              letterSpacing: 1,
              color: colors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }

  bool get _canContinue => switch (summary.continuation.nextAction) {
        DailyContinuationAction.playQuestion ||
        DailyContinuationAction.watchRewarded ||
        DailyContinuationAction.waitForRewarded ||
        DailyContinuationAction.limitReached =>
          true,
        _ => false,
      };

  String _buttonLabel(BuildContext context) {
    final t = context.t.daily_result;
    return switch (summary.continuation.nextAction) {
      DailyContinuationAction.playQuestion => t.continue_button,
      DailyContinuationAction.watchRewarded ||
      DailyContinuationAction.waitForRewarded ||
      DailyContinuationAction.limitReached =>
        t.more_questions_button,
      _ => t.rating_button,
    };
  }
}
