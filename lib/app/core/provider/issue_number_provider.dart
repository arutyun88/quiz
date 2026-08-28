import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';

final issueNumberProvider = Provider<int>((ref) {
  final launchDate = getIt<FirebaseRemoteConfigService>().appLaunchDate;
  if (launchDate == null) return 1;
  final now = DateTime.now().toUtc();
  final today = DateTime.utc(now.year, now.month, now.day);
  final days = today.difference(launchDate).inDays;
  return days < 0 ? 1 : days + 1;
});
