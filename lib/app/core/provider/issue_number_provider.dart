import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';

final issueNumberProvider = Provider<int>((ref) {
  const key = 'app_launch_date';
  final raw = getIt<FirebaseRemoteConfigService>().fetchByKey(key);
  if (raw.isEmpty) return 1;
  final launchDate = DateTime.tryParse(raw);
  if (launchDate == null) return 1;
  final now = DateTime.now();
  final days = DateTime(now.year, now.month, now.day)
      .difference(DateTime(launchDate.year, launchDate.month, launchDate.day))
      .inDays;
  return days + 1;
});
