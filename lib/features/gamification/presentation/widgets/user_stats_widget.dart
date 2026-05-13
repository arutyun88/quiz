import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/gen/strings.g.dart';

int _xpForLevel(int n) => 100 * n * (n - 1) ~/ 2;

class UserStatsWidget extends ConsumerWidget {
  const UserStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gamificationProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
      child: switch (state) {
        BaseLoadingState() => AppShimmer(
            key: const ValueKey('loading'),
            child: AppWidget(
              child: SizedBox(height: 200.0, width: double.infinity),
            ),
          ),
        BaseDataState(:final data) => _StatsCard(
            key: const ValueKey('data'),
            data: data,
          ),
        _ => const SizedBox.shrink(key: ValueKey('empty')),
      },
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({super.key, required this.data});

  final UserLevelEntity data;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final currentLevelXp = _xpForLevel(data.level);
    final nextLevelXp = _xpForLevel(data.level + 1);
    final xpProgress = ((data.experience - currentLevelXp) / (nextLevelXp - currentLevelXp)).clamp(0.0, 1.0);

    return AppWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.star_rounded, size: 16.0, color: context.palette.text.accent),
              const SizedBox(width: 4.0),
              Text(
                t.gamification.level(level: data.level),
                style: context.textStyle.heading18Bold,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: LinearProgressIndicator(
                  value: xpProgress,
                  minHeight: 6.0,
                  backgroundColor: context.palette.background.dynamic,
                  valueColor: AlwaysStoppedAnimation<Color>(context.palette.progress),
                ),
              ),
              Row(
                children: [
                  Text(
                    t.gamification.xp(
                      current: data.experience - currentLevelXp,
                      total: nextLevelXp - currentLevelXp,
                    ),
                    style: context.textStyle.body12Regular.copyWith(
                      color: context.palette.text.secondary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    t.gamification.xp_remaining(
                      remaining: nextLevelXp - data.experience,
                    ),
                    style: context.textStyle.body12Regular.copyWith(
                      color: context.palette.text.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 24.0),
          Row(
            children: [
              _Metric(
                value: '${data.streakDays}',
                label: t.gamification.streak_days,
                icon: Icons.local_fire_department,
                color: context.palette.text.accent,
              ),
              _VerticalDivider(),
              _Metric(
                value: '${data.questionsAnswered}',
                label: t.gamification.questions_answered,
                icon: Icons.menu_book_rounded,
              ),
              _VerticalDivider(),
              _Metric(
                value: '${data.correctAnswers}',
                label: t.gamification.correct_answers,
                icon: Icons.task_alt,
              ),
            ],
          ),
          const Divider(height: 24.0),
          Row(
            children: [
              _Metric(
                value: '${data.totalPoints}',
                label: t.gamification.points_label,
                icon: Icons.emoji_events_rounded,
                color: context.palette.text.accent,
              ),
              _VerticalDivider(),
              _Metric(
                value: '${(data.accuracy * 100).toStringAsFixed(1)}%',
                label: t.gamification.accuracy_label,
                icon: Icons.my_location,
              ),
            ],
          ),
          const Divider(height: 24.0),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.push('/profile/achievements'),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                children: [
                  Text(
                    t.gamification.achievements_link,
                    style: context.textStyle.body14Regular,
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next, color: context.palette.text.secondary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.value,
    required this.label,
    required this.icon,
    this.color,
  });

  final String value;
  final String label;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? context.palette.text.secondary;

    return Expanded(
      child: Column(
        spacing: 4.0,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.0,
            children: [
              Icon(icon, size: 20.0, color: iconColor),
              Text(value, style: context.textStyle.heading18Bold),
            ],
          ),
          Text(
            label,
            style: context.textStyle.body12Regular.copyWith(
              color: context.palette.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: VerticalDivider(
        width: 1.0,
        color: context.palette.background.dynamic,
      ),
    );
  }
}
