part of 'theme_provider.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.user(ThemeData theme) = _ThemeUserEvent;

  const factory ThemeEvent.system() = _ThemeSystemEvent;
}
