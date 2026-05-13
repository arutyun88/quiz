import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class LevelBadgeWidget extends ConsumerWidget {
  const LevelBadgeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gamificationProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: child,
        ),
      ),
      child: switch (state) {
        BaseDataState(:final data) => GestureDetector(
            key: ValueKey(data.level),
            onTap: () => context.go('/profile'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: context.palette.background.dynamic,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.0,
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 20.0,
                    color: context.palette.text.accent,
                  ),
                  Text(
                    context.t.gamification.level_short(level: data.level),
                    style: context.textStyle.body14Regular,
                  ),
                ],
              ),
            ),
          ),
        _ => const SizedBox.shrink(key: ValueKey('empty')),
      },
    );
  }
}
