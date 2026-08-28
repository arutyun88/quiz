import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/app_info_card.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyLimitPage extends StatelessWidget {
  const DailyLimitPage({
    super.key,
    required this.continuation,
    required this.isBusy,
    required this.onKeepPlaying,
    required this.onClose,
    required this.onRefresh,
    this.onWatchAd,
    this.adStatus,
  });

  final DailyContinuationEntity continuation;
  final bool isBusy;
  final VoidCallback onKeepPlaying;
  final VoidCallback onClose;
  final VoidCallback onRefresh;
  final VoidCallback? onWatchAd;
  final String? adStatus;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_limit;
    final canPlay =
        continuation.nextAction == DailyContinuationAction.playQuestion;
    final canRequestAd =
        continuation.nextAction == DailyContinuationAction.watchRewarded &&
            continuation.rewardedAdAvailable;

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(
              remaining: continuation.bonusQuestionsRemaining,
              maximum: continuation.rewardedVideosMax *
                  continuation.questionsPerReward,
              onClose: onClose,
            ),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 26, 22, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      t.extras_section,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        color: colors.text.secondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _GrantSlots(
                      used: continuation.rewardedVideosUsed,
                      maximum: continuation.rewardedVideosMax,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      t.slots_hint(
                        grants: continuation.rewardedVideosMax,
                        questions: continuation.questionsPerReward,
                      ),
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        color: colors.text.secondary,
                      ),
                    ),
                    const Spacer(),
                    _CountdownBlock(
                      continuation: continuation,
                      onExpired: onRefresh,
                    ),
                    const Spacer(),
                    if (canPlay)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: AppButtonV2(
                          label: t.keep_playing,
                          onTap: isBusy
                              ? null
                              : (complete) {
                                  complete();
                                  onKeepPlaying();
                                  return null;
                                },
                        ),
                      ),
                    if (canRequestAd)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: AppInfoCard(
                          icon: Icons.smart_display,
                          title: t.watch_ad,
                          caption: onWatchAd == null
                              ? t.ad_unavailable
                              : t.watch_ad_caption(
                                  n: continuation.questionsPerReward,
                                ),
                          trailingIcon:
                              onWatchAd == null ? null : Icons.arrow_forward,
                          onTap: isBusy ? null : onWatchAd,
                        ),
                      )
                    else if (!canPlay)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          t.ad_exhausted,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.spectral(
                            fontSize: 14,
                            color: colors.text.secondary,
                          ),
                        ),
                      ),
                    if (adStatus != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Text(
                          adStatus!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.spectral(
                            fontSize: 14,
                            color: colors.text.secondary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.remaining,
    required this.maximum,
    required this.onClose,
  });

  final int remaining;
  final int maximum;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final counterColor =
        remaining == 0 ? colors.text.danger : colors.text.primary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onClose,
            child: Icon(Icons.close, size: 22, color: colors.text.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              context.t.daily_limit.title,
              style: GoogleFonts.unbounded(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: colors.text.primary,
              ),
            ),
          ),
          Icon(Icons.bolt, size: 18, color: counterColor),
          const SizedBox(width: 6),
          Text(
            '$remaining/$maximum',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: counterColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _GrantSlots extends StatelessWidget {
  const _GrantSlots({required this.used, required this.maximum});

  final int used;
  final int maximum;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    if (maximum <= 0) return const SizedBox.shrink();

    return Row(
      children: [
        for (var i = 0; i < maximum; i++) ...[
          if (i > 0) const SizedBox(width: 7),
          Expanded(
            child: Container(
              height: 8,
              color: i < used ? colors.text.accent : colors.background.dynamic,
            ),
          ),
        ],
      ],
    );
  }
}

class _CountdownBlock extends StatefulWidget {
  const _CountdownBlock({
    required this.continuation,
    required this.onExpired,
  });

  final DailyContinuationEntity continuation;
  final VoidCallback onExpired;

  @override
  State<_CountdownBlock> createState() => _CountdownBlockState();
}

class _CountdownBlockState extends State<_CountdownBlock> {
  final Stopwatch _elapsed = Stopwatch();
  Timer? _timer;
  late Duration _remaining;
  bool _reportedExpiry = false;

  DateTime get _target => widget.continuation.nextAction ==
              DailyContinuationAction.waitForRewarded &&
          widget.continuation.rewardedAdNextAvailableAt != null
      ? widget.continuation.rewardedAdNextAvailableAt!
      : widget.continuation.closesAt;

  @override
  void initState() {
    super.initState();
    _elapsed.start();
    _remaining = _calculateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  @override
  void didUpdateWidget(covariant _CountdownBlock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.continuation.serverTime != widget.continuation.serverTime ||
        oldWidget.continuation.closesAt != widget.continuation.closesAt ||
        oldWidget.continuation.rewardedAdNextAvailableAt !=
            widget.continuation.rewardedAdNextAvailableAt) {
      _elapsed.reset();
      _reportedExpiry = false;
      _remaining = _calculateRemaining();
    }
  }

  void _tick() {
    if (!mounted) return;
    final next = _calculateRemaining();
    setState(() => _remaining = next);
    if (next == Duration.zero && !_reportedExpiry) {
      _reportedExpiry = true;
      widget.onExpired();
    }
  }

  Duration _calculateRemaining() {
    final serverNow = widget.continuation.serverTime.add(_elapsed.elapsed);
    final difference = _target.difference(serverNow);
    return difference.isNegative ? Duration.zero : difference;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _elapsed.stop();
    super.dispose();
  }

  String _format(Duration duration) {
    String two(int value) => value.toString().padLeft(2, '0');
    return '${two(duration.inHours)}:'
        '${two(duration.inMinutes % 60)}:'
        '${two(duration.inSeconds % 60)}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_limit;
    final waitsForAd = widget.continuation.nextAction ==
        DailyContinuationAction.waitForRewarded;

    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: colors.text.primary, width: 1.5),
          ),
          child: Icon(
            Icons.hourglass_empty,
            size: 30,
            color: colors.text.primary,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          t.completed_title,
          textAlign: TextAlign.center,
          style: GoogleFonts.unbounded(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            height: 1.15,
            color: colors.text.primary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          waitsForAd ? t.next_ad_in : t.next_issue_in,
          style: GoogleFonts.spectral(
            fontSize: 16,
            color: colors.text.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _format(_remaining),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: colors.text.accent,
          ),
        ),
      ],
    );
  }
}
