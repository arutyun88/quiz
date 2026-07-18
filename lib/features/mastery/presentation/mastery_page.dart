import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';
import 'package:quiz/features/mastery/presentation/provider/mastery_provider.dart';
import 'package:quiz/features/user/presentation/provider/quiz_plus_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class MasteryPage extends ConsumerWidget {
  const MasteryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(masteryProvider);
    final hasQuizPlus = ref.watch(quizPlusProvider);

    return AppScaffold(
      title: context.t.mastery.title,
      body: switch (state) {
        BaseLoadingState() => const _MasteryLoading(),
        BaseDataState(:final data) => _MasteryView(mastery: data, locked: !hasQuizPlus),
        _ => _MasteryError(onRetry: () => ref.read(masteryProvider.notifier).fetch()),
      },
    );
  }
}

class _MasteryView extends StatelessWidget {
  const _MasteryView({required this.mastery, required this.locked});

  final MasteryEntity mastery;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final t = context.t.mastery;

    if (mastery.topics.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Text(
            t.empty,
            textAlign: TextAlign.center,
            style: GoogleFonts.spectral(fontSize: 17, color: context.palette.text.primary),
          ),
        ),
      );
    }

    final content = ListView(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
      children: [
        Text(
          '// ${t.topics_section.toUpperCase()}',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            color: context.palette.text.accent,
          ),
        ),
        for (var i = 0; i < mastery.topics.length; i++)
          _TopicRow(
            topic: mastery.topics[i],
            isBest: i == 0 && mastery.topics.length > 1,
            isWeakest: i == mastery.topics.length - 1 && mastery.topics.length > 1,
          ),
        if (mastery.weakest case final MasteryTopicEntity weakest) _WeakestBlock(weakest: weakest),
        if (mastery.weeklyAccuracyDelta != null || mastery.bestDayOfWeek != null)
          _StatsRow(
            weeklyAccuracyDelta: mastery.weeklyAccuracyDelta,
            bestDayOfWeek: mastery.bestDayOfWeek,
          ),
      ],
    );

    if (!locked) return content;

    return _LockedMasteryView(content: content);
  }
}

class _TopicRow extends StatelessWidget {
  const _TopicRow({
    required this.topic,
    required this.isBest,
    required this.isWeakest,
  });

  final MasteryTopicEntity topic;
  final bool isBest;
  final bool isWeakest;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final color = isBest
        ? colors.answer.success
        : isWeakest
            ? colors.text.danger
            : colors.text.primary;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  topic.name,
                  style: GoogleFonts.spectral(
                    fontSize: 17,
                    color: isWeakest ? color : colors.text.primary,
                  ),
                ),
              ),
              Text(
                '${(topic.accuracy * 100).round()}%',
                style: GoogleFonts.unbounded(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Container(
              height: 6,
              color: colors.background.dynamic,
              alignment: AlignmentDirectional.centerStart,
              child: FractionallySizedBox(
                widthFactor: topic.accuracy.clamp(0.0, 1.0),
                heightFactor: 1,
                child: ColoredBox(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeakestBlock extends StatelessWidget {
  const _WeakestBlock({required this.weakest});

  final MasteryTopicEntity weakest;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.mastery;

    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.text.primary, width: 1.5),
          bottom: BorderSide(color: colors.text.primary, width: 1.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '↳ ${t.weakest_label.toUpperCase()}',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              color: colors.text.danger,
            ),
          ),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              style: GoogleFonts.spectral(fontSize: 19, height: 1.35, color: colors.text.primary),
              children: [
                TextSpan(text: '${weakest.name} — '),
                TextSpan(
                  text: t.weakest_accuracy(percent: (weakest.accuracy * 100).round()),
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(text: t.weakest_tail),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.weeklyAccuracyDelta,
    required this.bestDayOfWeek,
  });

  final double? weeklyAccuracyDelta;
  final int? bestDayOfWeek;

  String get _deltaText {
    final percent = (weeklyAccuracyDelta! * 100).round();
    return percent > 0 ? '+$percent%' : '$percent%';
  }

  String _bestDayText(String locale) {
    // 2024-01-01 is a Monday; shift to the ISO day of week we got
    final date = DateTime(2024, 1, bestDayOfWeek!);
    final name = DateFormat.E(locale).format(date);
    return name.isEmpty ? name : name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final locale = LocaleSettings.instance.currentLocale.languageCode;
    final t = context.t.mastery;

    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (weeklyAccuracyDelta != null)
            Expanded(
              child: _Stat(value: _deltaText, label: t.weekly_delta_label),
            ),
          if (bestDayOfWeek != null)
            Expanded(
              child: Container(
                decoration: weeklyAccuracyDelta != null
                    ? BoxDecoration(
                        border: BorderDirectional(start: BorderSide(color: context.palette.divider)),
                      )
                    : null,
                padding: weeklyAccuracyDelta != null ? const EdgeInsetsDirectional.only(start: 14) : null,
                child: _Stat(value: _bestDayText(locale), label: t.best_day_label),
              ),
            ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.unbounded(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: context.palette.text.primary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: context.palette.text.secondary,
          ),
        ),
      ],
    );
  }
}

/// Locked mastery (Б8/Б8б): the stats are blurred under a gradient scrim,
/// while the Quiz+ panel lives in the root overlay so it covers the bottom
/// tab bar of the shell.
class _LockedMasteryView extends StatefulWidget {
  const _LockedMasteryView({required this.content});

  final Widget content;

  @override
  State<_LockedMasteryView> createState() => _LockedMasteryViewState();
}

class _LockedMasteryViewState extends State<_LockedMasteryView> {
  OverlayEntry? _panelEntry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _panelEntry = OverlayEntry(
        builder: (_) => const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _PaywallPanel(),
        ),
      );
      Overlay.of(context, rootOverlay: true).insert(_panelEntry!);
    });
  }

  @override
  void dispose() {
    _panelEntry?.remove();
    _panelEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrim = context.palette.background.static;

    return Stack(
      fit: StackFit.expand,
      children: [
        IgnorePointer(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: widget.content,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.3],
              colors: [scrim.withValues(alpha: 0), scrim.withValues(alpha: 0.65)],
            ),
          ),
        ),
      ],
    );
  }
}

/// Quiz+ panel (Б8/Б8б), rendered in the root overlay on top of the tab bar.
/// The CTA will lead to the paywall once phase 9 lands.
class _PaywallPanel extends StatelessWidget {
  const _PaywallPanel();

  static const _panelDivider = Color(0xFF3A372E);
  static const _panelSecondaryText = Color(0xFFCFCABB);

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: colors.bottomSheet.headerBackground,
        child: SafeArea(
          top: false,
          minimum: const EdgeInsets.fromLTRB(22, 20, 22, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text(
                      'QUIZ+',
                      style: GoogleFonts.unbounded(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: colors.bottomSheet.headerForeground,
                      ),
                    ),
                  ),
                  Text(
                    context.t.mastery.paywall.tagline.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      color: colors.text.accent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                context.t.mastery.paywall.description,
                style: GoogleFonts.spectral(
                  fontSize: 16,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                  color: _panelSecondaryText,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1, thickness: 1, color: _panelDivider),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      context.t.mastery.paywall.cta.toUpperCase(),
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        color: colors.bottomSheet.headerForeground,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward, size: 20, color: colors.bottomSheet.headerForeground),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MasteryLoading extends StatelessWidget {
  const _MasteryLoading();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AppShimmer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
        children: [
          Container(width: 130, height: 10, color: colors.background.dynamic),
          for (var i = 0; i < 4; i++) ...[
            const SizedBox(height: 16),
            Container(height: 17, color: colors.background.dynamic),
            const SizedBox(height: 7),
            Container(height: 6, color: colors.background.dynamic),
          ],
          const SizedBox(height: 24),
          Container(height: 90, color: colors.background.dynamic),
        ],
      ),
    );
  }
}

class _MasteryError extends StatelessWidget {
  const _MasteryError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

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
                context.t.mastery.error,
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
                        context.t.mastery.retry.toUpperCase(),
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
