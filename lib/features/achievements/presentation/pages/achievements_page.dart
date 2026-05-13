import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/presentation/provider/achievements_provider.dart';
import 'package:quiz/gen/strings.g.dart';

const _categoryOrder = ['BEGINNER', 'PROGRESS', 'ACCURACY', 'STREAK', 'POINTS'];

const _categoryIcons = <String, IconData>{
  'BEGINNER': Icons.star_rounded,
  'PROGRESS': Icons.trending_up_rounded,
  'ACCURACY': Icons.gps_fixed,
  'STREAK': Icons.local_fire_department,
  'POINTS': Icons.emoji_events_rounded,
};

IconData _iconFor(String category) => _categoryIcons[category] ?? Icons.workspace_premium;

class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(achievementsProvider);

    return AppSubheaderedScaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(context.t.achievements.title),
      ),
      body: switch (state) {
        BaseLoadingState() => _LoadingList(),
        BaseDataState(:final data) => _AchievementsList(items: data.items),
        BaseFailedState() => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12.0,
              children: [
                Text(context.t.achievements.error),
                TextButton(
                  onPressed: () => ref.read(achievementsProvider.notifier).fetch(),
                  child: Text(context.t.achievements.retry),
                ),
              ],
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

// ── Loading ───────────────────────────────────────────────────────────────────

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
      itemBuilder: (_, __) => AppShimmer(
        child: AppWidget(child: SizedBox(height: 88.0, width: double.infinity)),
      ),
    );
  }
}

// ── List ─────────────────────────────────────────────────────────────────────

class _AchievementsList extends StatefulWidget {
  const _AchievementsList({required this.items});

  final List<UserAchievementEntity> items;

  @override
  State<_AchievementsList> createState() => _AchievementsListState();
}

class _AchievementsListState extends State<_AchievementsList> {
  late final Map<String, List<UserAchievementEntity>> _grouped;
  late final List<String> _orderedCategories;

  @override
  void initState() {
    super.initState();
    _grouped = {};
    for (final item in widget.items) {
      _grouped.putIfAbsent(item.category, () => []).add(item);
    }
    _orderedCategories = _categoryOrder
        .where(_grouped.containsKey)
        .followedBy(
          _grouped.keys.where((k) => !_categoryOrder.contains(k)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
      itemCount: _orderedCategories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
      itemBuilder: (context, index) {
        final category = _orderedCategories[index];
        final items = _grouped[category]!;

        return _AnimatedEntry(
          delay: Duration(milliseconds: 50 * index),
          child: _CategoryCard(
            category: category,
            items: items,
            categoryLabel: _categoryLabel(category, t),
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

// ── Category card (one AppWidget per category, like settings section) ─────────

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.items,
    required this.categoryLabel,
  });

  final String category;
  final List<UserAchievementEntity> items;
  final String categoryLabel;

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section title — mirrors UserSettingsWidget header style
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              categoryLabel,
              style: context.textStyle.heading18Bold,
            ),
          ),
          const Divider(),

          // Achievement rows
          ...List.generate(items.length, (i) {
            final achievement = items[i];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (i > 0) const Divider(),
                _AchievementRow(achievement: achievement, category: category),
              ],
            );
          }),
        ],
      ),
    );
  }
}

// ── Single achievement row ────────────────────────────────────────────────────

class _AchievementRow extends StatelessWidget {
  const _AchievementRow({
    required this.achievement,
    required this.category,
  });

  final UserAchievementEntity achievement;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        spacing: 12.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _iconFor(category),
            size: 18.0,
            color: context.palette.text.secondary,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2.0,
              children: [
                Text(
                  achievement.name,
                  style: context.textStyle.body14Regular,
                ),
                Text(
                  achievement.description,
                  style: context.textStyle.body12Regular.copyWith(
                    color: context.palette.text.secondary,
                  ),
                ),
              ],
            ),
          ),
          if (achievement.points case int points)
            Text(
              '+$points',
              style: context.textStyle.body14Regular.copyWith(
                color: context.palette.text.accent,
              ),
            ),
        ],
      ),
    );
  }
}

// ── Animated entry ────────────────────────────────────────────────────────────

class _AnimatedEntry extends StatefulWidget {
  const _AnimatedEntry({required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  State<_AnimatedEntry> createState() => _AnimatedEntryState();
}

class _AnimatedEntryState extends State<_AnimatedEntry> with SingleTickerProviderStateMixin {
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
