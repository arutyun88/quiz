import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';
import 'package:quiz/app/di/di.dart';

final demoConfigProvider = Provider<DemoConfig>((ref) {
  final questionCount =
      getIt<FirebaseRemoteConfigService>().guestDemoQuestionCount;
  return DemoConfig(questionCount: questionCount);
});

final class DemoConfig {
  static const fallback = DemoConfig(questionCount: 3);

  final int questionCount;

  const DemoConfig({required this.questionCount});
}
