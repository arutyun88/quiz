import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/presentation/question_answer_state.dart';
import 'package:quiz/features/question_report/presentation/widgets/question_report_submitted_banner.dart';
import 'package:quiz/gen/strings.g.dart';

enum AnswerRevealFailureKind { error, offline }

class AnswerRevealFailure {
  const AnswerRevealFailure({
    required this.title,
    required this.message,
    required this.kind,
  });

  final String title;
  final String message;
  final AnswerRevealFailureKind kind;
}

class AnswerRevealBottomSheet extends StatelessWidget {
  const AnswerRevealBottomSheet({
    super.key,
    required this.question,
    required this.sentState,
    required this.onNext,
    this.isFinalAction = false,
    this.ratingDelta,
    this.partnerBlock,
    this.onReport,
    this.reportSubmitted = false,
  });

  final QuestionEntity question;
  final QuestionAnswerSentState sentState;
  final FutureOr<AnswerRevealFailure?> Function() onNext;
  final bool isFinalAction;
  final int? ratingDelta;
  final Widget? partnerBlock;
  final Future<bool> Function()? onReport;
  final bool reportSubmitted;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final sheetColors = palette.bottomSheet;
    final correctAnswer = _correctAnswerText();

    return ColoredBox(
      color: sheetColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _AnswerRevealHeader(
            isCorrect: sentState.isCorrect,
            xp: sentState.xp,
            streakDelta: sentState.streakDelta,
            ratingDelta: ratingDelta,
          ),
          _AnswerExplanationPanel(
            correctAnswer: correctAnswer,
            description: sentState.description,
            partnerBlock: partnerBlock,
            onReport: onReport,
            reportSubmitted: reportSubmitted,
            onNext: onNext,
            isFinalAction: isFinalAction,
          ),
        ],
      ),
    );
  }

  String _correctAnswerText() {
    for (final answer in question.answers) {
      if (answer.id == sentState.correctAnswerId) {
        return answer.text;
      }
    }
    return sentState.answer.text;
  }
}

class _AnswerRevealHeader extends StatelessWidget {
  const _AnswerRevealHeader({
    required this.isCorrect,
    required this.xp,
    required this.streakDelta,
    required this.ratingDelta,
  });

  final bool isCorrect;
  final int xp;
  final int streakDelta;
  final int? ratingDelta;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final sheetColors = palette.bottomSheet;
    final t = context.t.question.answer_reveal;
    final rewardParts = [
      if (ratingDelta case final delta?) _formatRatingDelta(delta),
      if (xp > 0) t.xp_bonus(xp: xp),
      if (streakDelta > 0) t.streak_bonus(n: streakDelta),
    ];
    final rewardText = rewardParts.isEmpty ? null : rewardParts.join(' · ');

    return Container(
      color: sheetColors.headerBackground,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isCorrect ? t.correct : t.incorrect,
            style: GoogleFonts.unbounded(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: sheetColors.headerForeground,
              letterSpacing: 0.5,
            ),
          ),
          if (rewardText != null) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                rewardText,
                textAlign: TextAlign.end,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  letterSpacing: 1,
                  color: palette.answer.successMint,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatRatingDelta(int delta) {
    if (delta > 0) return 'Δ +$delta';
    if (delta < 0) return 'Δ −${delta.abs()}';
    return 'Δ 0';
  }
}

class _AnswerExplanationPanel extends StatefulWidget {
  const _AnswerExplanationPanel({
    required this.correctAnswer,
    required this.description,
    required this.partnerBlock,
    required this.onReport,
    required this.reportSubmitted,
    required this.onNext,
    required this.isFinalAction,
  });

  final String correctAnswer;
  final String? description;
  final Widget? partnerBlock;
  final Future<bool> Function()? onReport;
  final bool reportSubmitted;
  final FutureOr<AnswerRevealFailure?> Function() onNext;
  final bool isFinalAction;

  @override
  State<_AnswerExplanationPanel> createState() =>
      _AnswerExplanationPanelState();
}

class _AnswerExplanationPanelState extends State<_AnswerExplanationPanel> {
  bool _retry = false;
  bool _reportInFlight = false;
  bool _reportSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final sheetColors = palette.bottomSheet;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.correctAnswer.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              letterSpacing: 2,
              color: palette.text.accent,
            ),
          ),
          if (widget.description case String description?) ...[
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.spectral(
                fontSize: 16,
                height: 1.5,
                color: sheetColors.foreground,
              ),
            ),
          ],
          if (widget.partnerBlock case final partnerBlock?) partnerBlock,
          if (widget.onReport case final onReport?) ...[
            const SizedBox(height: 14),
            if (_reportSubmitted || widget.reportSubmitted)
              const QuestionReportSubmittedBanner()
            else
              _ReportAction(
                title: context.t.question.report.entry_title,
                message: context.t.question.report.entry_message,
                onTap: () => _submitReport(onReport),
              ),
          ],
          const SizedBox(height: 18),
          AppButtonV2(
            label: _retry
                ? context.t.question.answer_reveal.retry
                : widget.isFinalAction
                    ? context.t.question.answer_reveal.finish_issue
                    : context.t.question.answer_reveal.next_question,
            backgroundColor: sheetColors.buttonBackground,
            foregroundColor: sheetColors.buttonForeground,
            onTap: (_) => _advance(),
          ),
        ],
      ),
    );
  }

  Future<void> _submitReport(Future<bool> Function() onReport) async {
    if (_reportInFlight) return;
    _reportInFlight = true;
    try {
      final submitted = await onReport();
      if (!mounted || !submitted) return;
      setState(() => _reportSubmitted = true);
      await _advance(dismissNotices: false);
    } finally {
      _reportInFlight = false;
    }
  }

  Future<void> _advance({bool dismissNotices = true}) async {
    if (dismissNotices) AppSnackBar.dismissAboveRoutes();
    final failure = await widget.onNext();
    if (!mounted || failure == null) return;
    setState(() => _retry = true);
    switch (failure.kind) {
      case AnswerRevealFailureKind.error:
        AppSnackBar.showError(
          context,
          title: failure.title,
          message: failure.message,
          aboveRoutes: true,
        );
      case AnswerRevealFailureKind.offline:
        AppSnackBar.showOffline(
          context,
          title: failure.title,
          message: failure.message,
          aboveRoutes: true,
        );
    }
  }
}

class _ReportAction extends StatelessWidget {
  const _ReportAction({
    required this.title,
    required this.message,
    required this.onTap,
  });

  final String title;
  final String message;
  final FutureOr<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Semantics(
      button: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: palette.divider),
          ),
          padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4,
                height: 48,
                color: palette.text.accent,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.15,
                        color: palette.text.accent,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: GoogleFonts.spectral(
                        fontSize: 13,
                        height: 1.2,
                        color: palette.text.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: palette.text.primary, width: 1.25),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 22,
                  color: palette.text.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
