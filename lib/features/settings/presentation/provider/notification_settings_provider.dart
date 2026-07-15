import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Notification preferences (Б4г). Stored locally for now: push delivery is a
/// separate future task, the toggles only persist the user's choice.
enum NotificationSetting {
  dailyIssue('notifications.daily_issue', true),
  streakRisk('notifications.streak_risk', true),
  rankChange('notifications.rank_change', false),
  promo('notifications.promo', false);

  const NotificationSetting(this.prefsKey, this.defaultValue);

  final String prefsKey;
  final bool defaultValue;
}

final notificationSettingsProvider =
    StateNotifierProvider<NotificationSettingsNotifier, Map<NotificationSetting, bool>>(
  (ref) => NotificationSettingsNotifier(prefs: getIt<SharedPreferences>()),
);

class NotificationSettingsNotifier extends StateNotifier<Map<NotificationSetting, bool>> {
  final SharedPreferences _prefs;

  NotificationSettingsNotifier({required SharedPreferences prefs})
      : _prefs = prefs,
        super({
          for (final setting in NotificationSetting.values)
            setting: prefs.getBool(setting.prefsKey) ?? setting.defaultValue,
        });

  Future<void> toggle(NotificationSetting setting, bool value) async {
    state = {...state, setting: value};
    await _prefs.setBool(setting.prefsKey, value);
  }
}
