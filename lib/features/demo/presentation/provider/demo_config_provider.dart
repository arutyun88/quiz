import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';
import 'package:quiz/app/di/di.dart';

final demoConfigProvider = Provider<DemoConfig>((ref) {
  final raw = getIt<FirebaseRemoteConfigService>().fetchByKey(
    'guest_demo_config',
  );
  return DemoConfig.fromRemote(raw);
});

final class DemoConfig {
  static const fallback = DemoConfig(questionCount: 3);

  final int questionCount;

  const DemoConfig({required this.questionCount});

  factory DemoConfig.fromRemote(String raw) {
    if (raw.isEmpty) return fallback;
    try {
      final json = jsonDecode(raw);
      if (json is! Map<String, dynamic>) return fallback;
      final value = json['question_count'];
      final count = switch (value) {
        int value => value,
        String value => int.tryParse(value),
        _ => null,
      };
      if (count == null || count < 1 || count > 10) return fallback;
      return DemoConfig(questionCount: count);
    } on FormatException {
      return fallback;
    }
  }
}
