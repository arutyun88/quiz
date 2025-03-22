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
      scaffoldBackgroundColor: theme.palette.background.dynamic,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          size: 16.0,
          color: theme.palette.text.primary,
        ),
        titleTextStyle: AppTextStyle.base.body16Semibold.copyWith(color: theme.palette.text.primary),
        backgroundColor: theme.palette.background.static,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
        ),
        shadowColor: theme.palette.shadow,
        surfaceTintColor: Colors.transparent,
      ),
      brightness: switch (theme.themeMode) {
        AppThemeMode.light => Brightness.light,
        AppThemeMode.dark => Brightness.dark,
      },
      textTheme: switch (theme.themeMode) {
        AppThemeMode.light => Typography.material2021().white,
        AppThemeMode.dark => Typography.material2021().black,
      }
          .apply(
        bodyColor: theme.palette.text.primary,
        displayColor: theme.palette.text.primary,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: theme.palette.background.static,
        titleTextStyle: AppTextStyle.base.heading18Semibold.copyWith(color: theme.palette.text.primary),
        contentTextStyle: AppTextStyle.base.body16Regular.copyWith(color: theme.palette.text.primary),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: theme.palette.background.dynamic,
        contentTextStyle: AppTextStyle.base.body14Regular.copyWith(color: theme.palette.text.primary),
      ),
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
