import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/achievements/presentation/provider/achievements_provider.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';
import 'package:quiz/features/question/domain/service/question_id_service.dart';
import 'package:quiz/features/question/domain/use_case/sync_cached_question_locale_use_case.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeQuestionSyncProvider = StateNotifierProvider<LocaleQuestionSyncNotifier, LocaleQuestionSyncState>(
  (ref) => LocaleQuestionSyncNotifier(
    ref: ref,
    connectivityService: getIt<ConnectivityService>(),
    prefs: getIt<SharedPreferences>(),
    syncUseCase: SyncCachedQuestionLocaleUseCaseImpl(
      questionDao: getIt<QuestionDao>(),
      questionRepository: getIt<QuestionRepository>(),
      connectivityService: getIt<ConnectivityService>(),
      questionIdService: getIt<QuestionIdService>(),
    ),
  ),
);

enum LocaleQuestionSyncStatus {
  idle,
  waitingConnection,
  syncing,
  synchronized,
  failed,
}

class LocaleQuestionSyncState {
  const LocaleQuestionSyncState({
    required this.status,
    required this.cachedCount,
    required this.syncedCount,
    this.failure,
  });

  const LocaleQuestionSyncState.idle()
      : status = LocaleQuestionSyncStatus.idle,
        cachedCount = 0,
        syncedCount = 0,
        failure = null;

  final LocaleQuestionSyncStatus status;
  final int cachedCount;
  final int syncedCount;
  final Failure? failure;

  bool get isSyncing => status == LocaleQuestionSyncStatus.syncing;

  LocaleQuestionSyncState copyWith({
    LocaleQuestionSyncStatus? status,
    int? cachedCount,
    int? syncedCount,
    Failure? failure,
    bool clearFailure = false,
  }) {
    return LocaleQuestionSyncState(
      status: status ?? this.status,
      cachedCount: cachedCount ?? this.cachedCount,
      syncedCount: syncedCount ?? this.syncedCount,
      failure: clearFailure ? null : failure ?? this.failure,
    );
  }
}

class LocaleQuestionSyncNotifier extends StateNotifier<LocaleQuestionSyncState> {
  static const String _pendingLocaleQuestionSyncKey = 'pending_locale_question_sync';

  final Ref _ref;
  final ConnectivityService _connectivityService;
  final SharedPreferences _prefs;
  final SyncCachedQuestionLocaleUseCase _syncUseCase;

  StreamSubscription<InternetStatus>? _connectivitySubscription;
  bool _isSyncing = false;

  LocaleQuestionSyncNotifier({
    required Ref ref,
    required ConnectivityService connectivityService,
    required SharedPreferences prefs,
    required SyncCachedQuestionLocaleUseCase syncUseCase,
  })  : _ref = ref,
        _connectivityService = connectivityService,
        _prefs = prefs,
        _syncUseCase = syncUseCase,
        super(const LocaleQuestionSyncState.idle()) {
    _initConnectivityListener();
    _syncPendingIfConnected();
  }

  Future<void> syncAfterLocaleChange() async {
    await _prefs.setBool(_pendingLocaleQuestionSyncKey, true);
    await _syncPendingIfConnected(showWaitingState: true);
  }

  Future<void> retry() async {
    await _prefs.setBool(_pendingLocaleQuestionSyncKey, true);
    await _syncPendingIfConnected(showWaitingState: true);
  }

  void resetVisibleState() {
    if (!_prefs.containsKey(_pendingLocaleQuestionSyncKey)) {
      state = const LocaleQuestionSyncState.idle();
    }
  }

  void _initConnectivityListener() {
    _connectivitySubscription = _connectivityService.onStatusChange.listen((status) {
      if (status == InternetStatus.connected && _hasPendingSync) {
        _syncPendingIfConnected();
      }
    });
  }

  bool get _hasPendingSync => _prefs.getBool(_pendingLocaleQuestionSyncKey) ?? false;

  Future<void> _syncPendingIfConnected({bool showWaitingState = false}) async {
    if (!_hasPendingSync || _isSyncing) {
      return;
    }

    final hasInternet = await _connectivityService.hasInternetConnection();
    if (!hasInternet) {
      if (showWaitingState) {
        state = state.copyWith(
          status: LocaleQuestionSyncStatus.waitingConnection,
          clearFailure: true,
        );
      }
      return;
    }

    _isSyncing = true;
    state = state.copyWith(
      status: LocaleQuestionSyncStatus.syncing,
      clearFailure: true,
    );

    final result = await _syncUseCase.sync();

    switch (result) {
      case ResultOk(:final data):
        await _prefs.remove(_pendingLocaleQuestionSyncKey);
        state = state.copyWith(
          status: LocaleQuestionSyncStatus.synchronized,
          cachedCount: data.cachedCount,
          syncedCount: data.syncedCount,
          clearFailure: true,
        );
        // A public achievements page can stay mounted in the rating tab stack,
        // keeping its autoDispose provider alive with the previous locale.
        _ref.invalidate(publicAchievementsProvider);
        if (data.cachedCount > 0 || data.syncedCount > 0) {
          await _reloadQuestion();
        }
      case ResultFailed(:final error) when error is NoConnectionFailure:
        state = state.copyWith(
          status: LocaleQuestionSyncStatus.waitingConnection,
          failure: error,
        );
      case ResultFailed(:final error):
        state = state.copyWith(
          status: LocaleQuestionSyncStatus.failed,
          failure: error,
        );
    }

    _isSyncing = false;
  }

  Future<void> _reloadQuestion() async {
    _ref.invalidate(questionProvider);
    await Future<void>.delayed(Duration.zero);
    await _ref.read(questionProvider.notifier).fetch();
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }
}
