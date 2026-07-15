import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/gen/strings.g.dart';

enum _ThemeOption { light, system, dark }

class ThemeModeSwitcher extends ConsumerWidget {
  const ThemeModeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final t = context.t.profile.settings;

    final selected = theme.scope == ThemeScope.system
        ? _ThemeOption.system
        : theme.data == AppTheme.dark
            ? _ThemeOption.dark
            : _ThemeOption.light;

    void toggle(_ThemeOption option) {
      ref.read(themeProvider.notifier).toggle(switch (option) {
            _ThemeOption.light => ThemeEvent.user(AppTheme.light),
            _ThemeOption.system => const ThemeEvent.system(),
            _ThemeOption.dark => ThemeEvent.user(AppTheme.dark),
          });
    }

    return Row(
      children: [
        _Option(
          icon: Icons.light_mode_outlined,
          label: t.theme_light,
          isSelected: selected == _ThemeOption.light,
          onTap: () => toggle(_ThemeOption.light),
        ),
        const SizedBox(width: 8),
        _Option(
          icon: Icons.brightness_auto_outlined,
          label: t.theme_system,
          isSelected: selected == _ThemeOption.system,
          onTap: () => toggle(_ThemeOption.system),
        ),
        const SizedBox(width: 8),
        _Option(
          icon: Icons.dark_mode_outlined,
          label: t.theme_dark,
          isSelected: selected == _ThemeOption.dark,
          onTap: () => toggle(_ThemeOption.dark),
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final foreground = isSelected ? colors.background.static : colors.text.secondary;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: isSelected
              ? BoxDecoration(
                  color: colors.text.primary,
                  border: Border.all(color: colors.text.primary, width: 1.5),
                )
              : BoxDecoration(border: Border.all(color: colors.divider)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: foreground),
              const SizedBox(width: 7),
              Text(
                label.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  letterSpacing: 1,
                  color: foreground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
