import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/question/domain/use_case/sync_cached_answers_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sync_state.dart';
part 'sync_notifier.dart';
part 'sync_provider.freezed.dart';

final syncProvider = StateNotifierProvider<SyncNotifier, SyncState>(
  (ref) => SyncNotifier(
    connectivityService: getIt<ConnectivityService>(),
    syncCachedAnswersUseCase: getIt<SyncCachedAnswersUseCase>(),
    prefs: getIt<SharedPreferences>(),
  ),
);
