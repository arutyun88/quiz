import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_result/presentation/widgets/daily_result_report.dart';
import 'package:quiz/gen/strings.g.dart';

class ServerDailyResultPage extends StatelessWidget {
  const ServerDailyResultPage({
    super.key,
    required this.summary,
    required this.onContinue,
  });

  final DailySummaryEntity summary;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    final canContinue = switch (summary.continuation.nextAction) {
      DailyContinuationAction.playQuestion ||
      DailyContinuationAction.watchRewarded ||
      DailyContinuationAction.waitForRewarded ||
      DailyContinuationAction.limitReached =>
        true,
      _ => false,
    };

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _Header(),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
                child: DailyResultReport(summary: summary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
              child: Column(
                children: [
                  AppButtonV2(
                    label: _buttonLabel(
                      context,
                      summary.continuation.nextAction,
                    ),
                    onTap: (complete) {
                      complete();
                      onContinue();
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    canContinue ? t.continue_footer : t.footer,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
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
      ),
    );
  }

  String _buttonLabel(BuildContext context, DailyContinuationAction action) {
    final t = context.t.daily_result;
    return switch (action) {
      DailyContinuationAction.playQuestion => t.continue_button,
      DailyContinuationAction.watchRewarded ||
      DailyContinuationAction.waitForRewarded ||
      DailyContinuationAction.limitReached =>
        t.more_questions_button,
      _ => t.home_button,
    };
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'QUIZ',
              children: [
                TextSpan(
                  text: '.',
                  style: TextStyle(color: colors.text.accent),
                ),
              ],
            ),
            style: GoogleFonts.unbounded(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: colors.text.primary,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.goNamed('home'),
            child: Icon(Icons.close, size: 22, color: colors.text.primary),
          ),
        ],
      ),
    );
  }
}
