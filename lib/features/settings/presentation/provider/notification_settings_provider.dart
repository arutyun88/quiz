import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/push/domain/entity/notification_preferences_entity.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/features/push/domain/repository/push_repository.dart';

enum NotificationSetting { dailyIssue, streakRisk, rankChange, promo }

class NotificationSettingsState {
  const NotificationSettingsState({
    required this.preferences,
    required this.permission,
    this.loading = false,
    this.saving = false,
    this.failed = false,
  });

  static const defaults = NotificationPreferencesEntity(
    dailyEdition: true,
    streakRisk: true,
    rankChange: false,
    promotions: false,
  );

  final NotificationPreferencesEntity preferences;
  final PushPermissionStatus permission;
  final bool loading;
  final bool saving;
  final bool failed;

  bool value(NotificationSetting setting) => switch (setting) {
        NotificationSetting.dailyIssue => preferences.dailyEdition,
        NotificationSetting.streakRisk => preferences.streakRisk,
        NotificationSetting.rankChange => preferences.rankChange,
        NotificationSetting.promo => preferences.promotions,
      };

  NotificationSettingsState copyWith({
    NotificationPreferencesEntity? preferences,
    PushPermissionStatus? permission,
    bool? loading,
    bool? saving,
    bool? failed,
  }) =>
      NotificationSettingsState(
        preferences: preferences ?? this.preferences,
        permission: permission ?? this.permission,
        loading: loading ?? this.loading,
        saving: saving ?? this.saving,
        failed: failed ?? this.failed,
      );
}

final notificationSettingsProvider = StateNotifierProvider.autoDispose<
    NotificationSettingsNotifier, NotificationSettingsState>(
  (ref) => NotificationSettingsNotifier(
    repository: getIt<PushRepository>(),
    gateway: getIt<PushNotificationsGateway>(),
  ),
);

class NotificationSettingsNotifier
    extends StateNotifier<NotificationSettingsState> {
  NotificationSettingsNotifier({
    required PushRepository repository,
    required PushNotificationsGateway gateway,
  })  : _repository = repository,
        _gateway = gateway,
        super(const NotificationSettingsState(
          preferences: NotificationSettingsState.defaults,
          permission: PushPermissionStatus.notDetermined,
          loading: true,
        )) {
    unawaited(reload());
  }

  final PushRepository _repository;
  final PushNotificationsGateway _gateway;

  Future<void> reload() async {
    state = state.copyWith(loading: true, failed: false);
    final permission = await _gateway.permissionStatus();
    final result = await _repository.fetchPreferences();
    state = switch (result) {
      ResultOk(data: final preferences) => state.copyWith(
          preferences: preferences,
          permission: permission,
          loading: false,
        ),
      ResultFailed() => state.copyWith(
          permission: permission,
          loading: false,
          failed: true,
        ),
    };
  }

  Future<void> requestPermission() async {
    final permission = await _gateway.requestPermission();
    state = state.copyWith(permission: permission);
  }

  Future<void> toggle(NotificationSetting setting, bool value) async {
    if (state.saving) return;
    final current = state.preferences;
    final next = switch (setting) {
      NotificationSetting.dailyIssue => current.copyWith(dailyEdition: value),
      NotificationSetting.streakRisk => current.copyWith(streakRisk: value),
      NotificationSetting.rankChange => current.copyWith(rankChange: value),
      NotificationSetting.promo => current.copyWith(promotions: value),
    };
    state = state.copyWith(saving: true, failed: false);
    final result = await _repository.updatePreferences(next);
    state = switch (result) {
      ResultOk(data: final saved) => state.copyWith(
          preferences: saved,
          saving: false,
        ),
      ResultFailed() => state.copyWith(saving: false, failed: true),
    };
  }
}
