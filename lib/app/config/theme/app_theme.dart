import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/app_text_style.dart';
import 'package:quiz/app/config/theme/palette.dart';

enum AppThemeMode { light, dark }

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme._({
    required this.palette,
    required this.themeMode,
  });

  final Palette palette;
  final AppThemeMode themeMode;

  static ThemeData light = _base(theme: _light);

  static ThemeData dark = _base(theme: _dark);

  static get _light => AppTheme._(
        palette: Palette.light,
        themeMode: AppThemeMode.light,
      );

  static get _dark => AppTheme._(
        palette: Palette.dark,
        themeMode: AppThemeMode.dark,
      );

  static ThemeData _base({
    required AppTheme theme,
  }) {
    return ThemeData(
      extensions: [theme, theme.palette, AppTextStyle.base],
      scaffoldBackgroundColor: theme.palette.background.static,
      brightness: switch (theme.themeMode) {
        AppThemeMode.light => Brightness.light,
        AppThemeMode.dark => Brightness.dark,
      },
    );
  }

  @override
  ThemeExtension<AppTheme> copyWith({
    Palette? palette,
    AppThemeMode? themeMode,
  }) {
    return AppTheme._(
      palette: palette ?? this.palette,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  AppTheme lerp(covariant AppTheme? other, double t) {
    if (other case AppTheme other) {
      return AppTheme._(
        palette: palette.lerp(other.palette, t),
        themeMode: other.themeMode,
      );
    }
    return this;
  }
}
