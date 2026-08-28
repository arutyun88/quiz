import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:quiz/app/core/services/remote_config_defaults.dart';

enum MobileRemoteConfigSource { firebase, bundledDefaults }

enum MobileRemoteConfigStatus { notRefreshed, success, failure, throttle }

typedef RemoteConfigDefaultsLoader = Future<Map<String, Object>> Function();

Future<Map<String, Object>> loadBundledRemoteConfigDefaults() async {
  final raw = await rootBundle.loadString(
    'assets/config/remote_config_defaults.json',
  );
  final decoded = jsonDecode(raw);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('Remote Config defaults must be a JSON object');
  }
  return normalizeRemoteConfigDefaults(decoded);
}

/// Typed, fail-safe access to non-authoritative mobile experience parameters.
///
/// Daily quotas, entitlement, rewarded grants, rating, streak, age access, and
/// navigation eligibility must never be read from Firebase Remote Config.
class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService(
    this._remoteConfig, {
    RemoteConfigDefaultsLoader? loadDefaults,
  }) : _loadDefaults = loadDefaults ?? loadBundledRemoteConfigDefaults;

  static const int defaultGuestDemoQuestionCount = 3;

  final FirebaseRemoteConfig _remoteConfig;
  final RemoteConfigDefaultsLoader _loadDefaults;
  Map<String, Object> _bundledDefaults = emergencyRemoteConfigDefaults;
  StreamSubscription<RemoteConfigUpdate>? _updatesSubscription;

  MobileRemoteConfigSource _source = MobileRemoteConfigSource.bundledDefaults;
  MobileRemoteConfigStatus _status = MobileRemoteConfigStatus.notRefreshed;
  DateTime? _syncDate;

  MobileRemoteConfigSource get source => _source;
  MobileRemoteConfigStatus get status => _status;
  DateTime? get syncDate => _syncDate;

  Future<void> init() async {
    try {
      _bundledDefaults = await _loadDefaults();
    } on Object {
      _bundledDefaults = emergencyRemoteConfigDefaults;
    }

    try {
      await _remoteConfig.setDefaults(_bundledDefaults);
      await _remoteConfig.ensureInitialized();
      final activated = await _remoteConfig.activate();
      if (activated) _markFirebaseActive();
    } on Object {
      _source = MobileRemoteConfigSource.bundledDefaults;
    }

    _listenForUpdates();
    unawaited(refresh());
  }

  Future<void> refresh() async {
    try {
      await _remoteConfig.fetchAndActivate();
      _markFirebaseActive();
    } on Object {
      _status = switch (_remoteConfig.lastFetchStatus) {
        RemoteConfigFetchStatus.throttle => MobileRemoteConfigStatus.throttle,
        _ => MobileRemoteConfigStatus.failure,
      };
    }
  }

  int get guestDemoQuestionCount {
    final remote = parseGuestDemoQuestionCount(
      _remoteConfig.getInt(guestDemoQuestionCountKey),
    );
    final bundled = parseGuestDemoQuestionCount(
      _bundledDefaults[guestDemoQuestionCountKey],
    );
    return remote ?? bundled ?? defaultGuestDemoQuestionCount;
  }

  DateTime? get appLaunchDate {
    final remote = parseAppLaunchDate(
      _remoteConfig.getString(appLaunchDateKey),
    );
    final bundled = parseAppLaunchDate(_bundledDefaults[appLaunchDateKey]);
    final raw = remote?.isNotEmpty == true ? remote : bundled;
    if (raw == null || raw.isEmpty) return null;
    final parsed = DateTime.parse(raw);
    return DateTime.utc(parsed.year, parsed.month, parsed.day);
  }

  void _listenForUpdates() {
    try {
      _updatesSubscription ??= _remoteConfig.onConfigUpdated.listen(
        (_) async {
          try {
            await _remoteConfig.activate();
            _markFirebaseActive();
          } on Object {
            _status = MobileRemoteConfigStatus.failure;
          }
        },
        onError: (Object _) {
          _status = MobileRemoteConfigStatus.failure;
        },
      );
    } on Object {
      _status = MobileRemoteConfigStatus.failure;
    }
  }

  void _markFirebaseActive() {
    _source = MobileRemoteConfigSource.firebase;
    _status = MobileRemoteConfigStatus.success;
    _syncDate = DateTime.now().toUtc();
  }
}
