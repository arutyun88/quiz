import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileThemeSwitchWidget extends ConsumerWidget {
  const ProfileThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.profile.settings.application.theme.title,
          style: context.textStyle.body14Regular,
        ),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.profile.settings.application.theme.switcher.as_system,
                    style: context.textStyle.body12Regular,
                  ),
                  const SizedBox(width: 4.0),
                  Switch.adaptive(
                    value: theme.scope == ThemeScope.system,
                    onChanged: (value) => ref.read(themeProvider.notifier).toggle(
                          value ? const ThemeEvent.system() : ThemeEvent.user(theme.data),
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 8.0),
              const Spacer(),
              GestureDetector(
                onTap: () => ref.read(themeProvider.notifier).toggle(
                      ThemeEvent.user(AppTheme.light),
                    ),
                child: Icon(
                  Icons.sunny,
                  color: theme.data == AppTheme.light
                      ? context.appTheme.palette.switchColor.active
                      : context.appTheme.palette.switchColor.inactive,
                ),
              ),
              const SizedBox(width: 24.0),
              GestureDetector(
                onTap: () => ref.read(themeProvider.notifier).toggle(
                      ThemeEvent.user(AppTheme.dark),
                    ),
                child: Icon(
                  Icons.nightlight,
                  color: theme.data == AppTheme.dark
                      ? context.appTheme.palette.switchColor.active
                      : context.appTheme.palette.switchColor.inactive,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
