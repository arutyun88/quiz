part of 'theme_provider.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @ThemeDataConverter() required ThemeData data,
    required ThemeScope scope,
  }) = _ThemeState;

  factory ThemeState.fromJson(Map<String, dynamic> json) => _$ThemeStateFromJson(json);
}

enum ThemeScope { system, user }
