import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/presentation/provider/achievements_provider.dart';
import 'package:quiz/gen/strings.g.dart';

const _categoryOrder = ['BEGINNER', 'PROGRESS', 'ACCURACY', 'STREAK', 'POINTS'];

class PublicAchievementsPage extends ConsumerWidget {
  const PublicAchievementsPage({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PublicAchievementsView(
        state: ref.watch(publicAchievementsProvider(userId)),
        onRetry: ref.read(publicAchievementsProvider(userId).notifier).fetch,
      );
}

class PublicAchievementsView extends StatelessWidget {
  const PublicAchievementsView({
    super.key,
    required this.state,
    required this.onRetry,
  });

  final BaseState<PageEntity<UserAchievementEntity>> state;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final items = switch (state) {
      BaseDataState(:final data) =>
        data.items.where((achievement) => achievement.unlocked).toList(),
      _ => null,
    };

    return Scaffold(
      backgroundColor: context.palette.background.static,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _Header(),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: switch (state) {
                BaseLoadingState() => const _AchievementsLoading(),
                BaseDataState() when items!.isEmpty =>
                  const _AchievementsEmpty(),
                BaseDataState() => _AchievementsList(items: items!),
                _ => _AchievementsError(onRetry: onRetry),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: context.pop,
              child: Icon(
                Icons.arrow_back,
                size: 22,
                color: context.palette.text.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                context.t.achievements.title.toUpperCase(),
                style: GoogleFonts.unbounded(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                  color: context.palette.text.primary,
                ),
              ),
            ),
          ],
        ),
      );
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
    final categories = _categoryOrder
        .where(grouped.containsKey)
        .followedBy(grouped.keys.where((key) => !_categoryOrder.contains(key)))
        .toList();

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 22),
          child: _CategorySection(
            label: _categoryLabel(category, context.t),
            items: grouped[category]!,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            color: colors.text.accent,
            child: Icon(
              Icons.check,
              size: 20,
              color: colors.background.static,
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
                    color: colors.text.primary,
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
              ],
            ),
          ),
          if (achievement.points case final int points) ...[
            const SizedBox(width: 14),
            Text(
              context.t.achievements.xp_reward(points: points),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: colors.text.accent,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AchievementsEmpty extends StatelessWidget {
  const _AchievementsEmpty();

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.emoji_events_outlined,
                size: 40,
                color: context.palette.text.secondary,
              ),
              const SizedBox(height: 16),
              Text(
                context.t.achievements.public_empty,
                textAlign: TextAlign.center,
                style: GoogleFonts.spectral(
                  fontSize: 17,
                  color: context.palette.text.secondary,
                ),
              ),
            ],
          ),
        ),
      );
}

class _AchievementsLoading extends StatelessWidget {
  const _AchievementsLoading();

  @override
  Widget build(BuildContext context) => AppShimmer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
          children: [
            Container(
              width: 90,
              height: 10,
              color: context.palette.background.dynamic,
            ),
            const SizedBox(height: 24),
            for (var i = 0; i < 3; i++) ...[
              Container(
                height: 64,
                color: context.palette.background.dynamic,
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      );
}

class _AchievementsError extends StatelessWidget {
  const _AchievementsError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.t.achievements.error,
                style: GoogleFonts.spectral(
                  fontSize: 17,
                  color: context.palette.text.primary,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onRetry,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.palette.text.primary,
                      width: 1.5,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Text(
                    context.t.achievements.retry.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: context.palette.text.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
