import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/app_refresh_indicator.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/presentation/provider/achievements_provider.dart';
import 'package:quiz/features/achievements/presentation/widgets/achievement_state_views.dart';
import 'package:quiz/gen/strings.g.dart';

const _categoryOrder = ['BEGINNER', 'PROGRESS', 'ACCURACY', 'STREAK', 'POINTS'];

class AchievementsPage extends ConsumerStatefulWidget {
  const AchievementsPage({super.key});

  @override
  ConsumerState<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends ConsumerState<AchievementsPage> {
  @override
  void initState() {
    super.initState();
    // Silent refetch on open: the provider outlives the page, so its state can
    // hold data fetched with a previous X-Lang locale.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(achievementsProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final state = ref.watch(achievementsProvider);
    final items = switch (state) {
      BaseDataState(:final data) when data.items.isNotEmpty => data.items,
      _ => null,
    };
    final isLoading = state is BaseLoadingState;

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(items: items, loading: isLoading),
            _UnlockedBar(items: items, loading: isLoading),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: AppRefreshIndicator(
                onRefresh: () async {
                  final refreshed =
                      await ref.read(achievementsProvider.notifier).refresh();
                  if (!refreshed && context.mounted) {
                    AppSnackBar.showError(
                      context,
                      title: context.t.achievements.refresh_error_title,
                      message: context.t.achievements.refresh_error_message,
                    );
                  }
                },
                child: switch (state) {
                  BaseLoadingState() => const AchievementsLoadingView(),
                  BaseDataState(:final data) when data.items.isEmpty =>
                    AchievementsErrorView(
                      onRetry: ref.read(achievementsProvider.notifier).fetch,
                    ),
                  BaseDataState() => _AchievementsList(items: items!),
                  _ => AchievementsErrorView(
                      onRetry: ref.read(achievementsProvider.notifier).fetch,
                    ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.items, required this.loading});

  final List<UserAchievementEntity>? items;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final unlocked = items?.where((e) => e.unlocked).length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: context.pop,
            child: Icon(Icons.arrow_back, size: 22, color: colors.text.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              context.t.achievements.title.toUpperCase(),
              style: GoogleFonts.unbounded(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
                color: colors.text.primary,
              ),
            ),
          ),
          if (loading)
            AppShimmer(
              child: Container(
                width: 28,
                height: 12,
                color: colors.background.dynamic,
              ),
            )
          else if (unlocked != null)
            Text(
              '$unlocked/${items!.length}',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: colors.text.accent,
              ),
            ),
        ],
      ),
    );
  }
}

class _UnlockedBar extends StatelessWidget {
  const _UnlockedBar({required this.items, required this.loading});

  final List<UserAchievementEntity>? items;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final total = items?.length ?? 0;
    final unlocked = items?.where((e) => e.unlocked).length ?? 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
      child: loading
          ? AppShimmer(
              child: Container(
                height: 4,
                color: context.palette.background.dynamic,
              ),
            )
          : _ProgressBar(
              height: 4,
              fraction: total == 0 ? 0 : unlocked / total,
              fillColor: context.palette.text.accent,
            ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({
    required this.height,
    required this.fraction,
    required this.fillColor,
  });

  final double height;
  final double fraction;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        height: height,
        color: context.palette.background.dynamic,
        alignment: AlignmentDirectional.centerStart,
        child: FractionallySizedBox(
          widthFactor: fraction.clamp(0.0, 1.0),
          heightFactor: 1,
          child: ColoredBox(color: fillColor),
        ),
      ),
    );
  }
}

class _AchievementsList extends StatelessWidget {
  const _AchievementsList({required this.items});

  final List<UserAchievementEntity> items;

  @override
  Widget build(BuildContext context) {
    final grouped = <String, List<UserAchievementEntity>>{};
    for (final item in items) {
      grouped.putIfAbsent(item.category, () => []).add(item);
    }
    final orderedCategories = _categoryOrder
        .where(grouped.containsKey)
        .followedBy(grouped.keys.where((k) => !_categoryOrder.contains(k)))
        .toList();

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
      itemCount: orderedCategories.length,
      itemBuilder: (context, index) {
        final category = orderedCategories[index];

        return _AnimatedEntry(
          delay: Duration(milliseconds: 50 * index),
          child: Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : 22),
            child: _CategorySection(
              label: _categoryLabel(category, context.t),
              items: grouped[category]!,
            ),
          ),
        );
      },
    );
  }

  String _categoryLabel(String category, Translations t) => switch (category) {
        'BEGINNER' => t.achievements.categories.beginner,
        'PROGRESS' => t.achievements.categories.progress,
        'ACCURACY' => t.achievements.categories.accuracy,
        'STREAK' => t.achievements.categories.streak,
        'POINTS' => t.achievements.categories.points,
        _ => category,
      };
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({required this.label, required this.items});

  final String label;
  final List<UserAchievementEntity> items;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '// ${label.toUpperCase()}',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            color: colors.text.accent,
          ),
        ),
        const SizedBox(height: 10),
        for (var i = 0; i < items.length; i++)
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: i == 0
                    ? BorderSide(color: colors.text.primary, width: 1.5)
                    : BorderSide(color: colors.divider),
                bottom: i == items.length - 1
                    ? BorderSide(color: colors.divider)
                    : BorderSide.none,
              ),
            ),
            child: _AchievementRow(achievement: items[i]),
          ),
      ],
    );
  }
}

class _AchievementRow extends StatelessWidget {
  const _AchievementRow({required this.achievement});

  final UserAchievementEntity achievement;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final unlocked = achievement.unlocked;
    final hasProgress = !unlocked &&
        achievement.progressCurrent != null &&
        achievement.progressTarget != null;

    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment:
            hasProgress ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: unlocked
                ? BoxDecoration(color: colors.text.accent)
                : BoxDecoration(
                    border:
                        Border.all(color: colors.text.secondary, width: 1.5)),
            child: Icon(
              unlocked ? Icons.check : Icons.lock_outline,
              size: unlocked ? 20 : 18,
              color:
                  unlocked ? colors.background.static : colors.text.secondary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.name,
                  style: GoogleFonts.spectral(
                    fontSize: 18,
                    color:
                        unlocked ? colors.text.primary : colors.text.secondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  achievement.description.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: colors.text.secondary,
                  ),
                ),
                if (hasProgress) ...[
                  const SizedBox(height: 8),
                  _ProgressBar(
                    height: 3,
                    fraction: achievement.progressCurrent! /
                        achievement.progressTarget!,
                    fillColor: colors.text.secondary,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 14),
          if (hasProgress)
            Text(
              '${achievement.progressCurrent}/${achievement.progressTarget}',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: colors.text.secondary,
              ),
            )
          else if (achievement.points case final int points)
            Text(
              unlocked
                  ? context.t.achievements.xp_reward(points: points)
                  : '+$points',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: unlocked ? colors.text.accent : colors.text.secondary,
              ),
            ),
        ],
      ),
    );

    return unlocked ? row : Opacity(opacity: 0.55, child: row);
  }
}

class _AnimatedEntry extends StatefulWidget {
  const _AnimatedEntry({required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  State<_AnimatedEntry> createState() => _AnimatedEntryState();
}

class _AnimatedEntryState extends State<_AnimatedEntry>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
