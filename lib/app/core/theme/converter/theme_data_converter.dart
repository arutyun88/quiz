import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/config/theme/app_theme.dart';

class ThemeDataConverter implements JsonConverter<ThemeData, String> {
  const ThemeDataConverter();

  @override
  ThemeData fromJson(String json) => json == 'dark' ? AppTheme.dark : AppTheme.light;

  @override
  String toJson(ThemeData object) => object == AppTheme.dark ? 'dark' : 'light';
}
