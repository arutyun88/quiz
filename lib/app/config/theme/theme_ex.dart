import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/config/theme/palette.dart';

extension ThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;

  Palette get palette => appTheme.palette;
}

extension AppThemeModeX on AppThemeMode {
  T themed<T>({required T light, required T dark}) {
    return switch (this) {
      AppThemeMode.light => light,
      AppThemeMode.dark => dark,
    };
  }

  bool get isLight => this == AppThemeMode.light;

  bool get isDark => this == AppThemeMode.dark;
}
