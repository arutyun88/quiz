import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/app_progress_ring.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
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
                subtitle: run?.editionDate ?? context.t.onboarding.daily_issue,
              ),
              const AppDivider(indent: 22, endIndent: 22),
              Expanded(child: _buildBody(context, state)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, DailyEditionState state) {
    return switch (state) {
      DailyEditionInitialState() ||
      DailyEditionLoadingState() =>
        const QuizLoading(),
      DailyEditionFailedState(:final failure) => QuizError(failure: failure),
      DailyEditionActiveState(:final run, :final assignment) => _RunOverview(
          run: run,
          topic: assignment.topic,
          onStart: () => context.goNamed('quiz'),
        ),
      DailyEditionSummaryState(:final summary) => _SummaryOverview(
          summary: summary,
        ),
    };
  }
}

class _RunOverview extends StatelessWidget {
  const _RunOverview({
    required this.run,
    required this.topic,
    required this.onStart,
  });

  final DailyRunEntity run;
  final String? topic;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final t = context.t.start_day;
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 30, 22, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          const SizedBox(height: 20),
          _EditionProgress(
            resolvedCount: run.resolvedCount,
            requiredCount: run.requiredCount,
          ),
          if (topic case final topic?) ...[
            const SizedBox(height: 18),
            Text(
              topic.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                letterSpacing: 1.5,
                color: context.palette.text.secondary,
              ),
            ),
          ],
          const Spacer(),
          AppButtonV2(
            label: t.start_button,
            onTap: (complete) {
              complete();
              onStart();
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class _SummaryOverview extends StatelessWidget {
  const _SummaryOverview({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 30, 22, 30),
      child: Column(
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
          const SizedBox(height: 20),
          _EditionProgress(
            resolvedCount: summary.resolvedCount,
            requiredCount: summary.requiredCount,
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colors.text.primary, width: 1.5),
                bottom: BorderSide(color: colors.text.primary, width: 1.5),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SummaryValue(
                  value: summary.correctCount.toString(),
                  label: t.correct_label,
                ),
                _SummaryValue(value: '+${summary.totalXp}', label: 'XP'),
              ],
            ),
          ),
          const Spacer(),
          Text(
            t.footer,
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
}

class _EditionProgress extends StatelessWidget {
  const _EditionProgress({
    required this.resolvedCount,
    required this.requiredCount,
  });

  final int resolvedCount;
  final int requiredCount;

  @override
  Widget build(BuildContext context) {
    final progress = requiredCount == 0
        ? 0.0
        : (resolvedCount / requiredCount).clamp(0.0, 1.0);
    return Center(
      child: AppProgressRing(
        size: 200,
        progress: progress,
        value: resolvedCount.toString(),
        label: context.t.daily_result.ring_label(total: requiredCount),
        valueFontSize: 64,
      ),
    );
  }
}

class _SummaryValue extends StatelessWidget {
  const _SummaryValue({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.unbounded(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: context.palette.text.primary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 9,
            letterSpacing: 0.5,
            color: context.palette.text.secondary,
          ),
        ),
      ],
    );
  }
}
