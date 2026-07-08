import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';
import 'package:quiz/app/di/di.dart';

final startDayConfigProvider = Provider<StartDayConfig>((ref) {
  final remoteConfig = getIt<FirebaseRemoteConfigService>();
  return _parseStartDayConfig(remoteConfig.fetchByKey('start_day_config'));
});

class StartDayConfig {
  const StartDayConfig({
    required this.questionCount,
    required this.estimatedMinutes,
  });

  final int questionCount;
  final int estimatedMinutes;
}

const _fallbackConfig = StartDayConfig(
  questionCount: 10,
  estimatedMinutes: 4,
);

StartDayConfig _parseStartDayConfig(String raw) {
  if (raw.isEmpty) return _fallbackConfig;

  try {
    final json = jsonDecode(raw);
    if (json is! Map<String, dynamic>) return _fallbackConfig;

    final questionCount = _readPositiveInt(json['question_count']);
    final estimatedMinutes = _readPositiveInt(json['estimated_minutes']);
    if (questionCount == null || estimatedMinutes == null) {
      return _fallbackConfig;
    }

    return StartDayConfig(
      questionCount: questionCount,
      estimatedMinutes: estimatedMinutes,
    );
  } on FormatException {
    return _fallbackConfig;
  }
}

int? _readPositiveInt(Object? value) {
  final parsed = switch (value) {
    int value => value,
    String value => int.tryParse(value),
    _ => null,
  };
  if (parsed == null || parsed <= 0) return null;
  return parsed;
}
