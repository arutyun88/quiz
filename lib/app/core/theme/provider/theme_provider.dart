import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/app/core/theme/converter/theme_data_converter.dart';
import 'package:quiz/app/di/di.dart';

part 'theme_state.dart';
part 'theme_event.dart';
part 'theme_provider.freezed.dart';
part 'theme_provider.g.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>(
  (ref) => ThemeNotifier(localStorage: getIt<SettingsLocalStorageService>()),
);

class ThemeNotifier extends StateNotifier<ThemeState> {
  final SettingsLocalStorageService _localStorage;

  ThemeNotifier({
    required SettingsLocalStorageService localStorage,
  })  : _localStorage = localStorage,
        super(_defaultState);

  void checkCurrentTheme() {
    final sState = _localStorage.fetchTheme();
    state = sState == null ? _defaultState : ThemeState.fromJson(jsonDecode(sState));
  }

  Future<void> toggle(ThemeEvent event) async {
    state = event.when(
      user: (theme) => ThemeState(
        data: theme,
        scope: ThemeScope.user,
      ),
      system: () => _defaultState,
    );
    _localStorage.saveTheme(jsonEncode(state.toJson()));
  }

  static ThemeState get _defaultState => ThemeState(
        data: SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
            ? AppTheme.dark
            : AppTheme.light,
        scope: ThemeScope.system,
      );
}
