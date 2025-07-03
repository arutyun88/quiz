part of 'sync_provider.dart';

class SyncNotifier extends StateNotifier<SyncState> {
  static const String _lastSyncTimeKey = 'last_sync_time';

  final ConnectivityService _connectivityService;
  final SyncCachedAnswersUseCase _syncCachedAnswersUseCase;
  final SharedPreferences _prefs;

  StreamSubscription<InternetStatus>? _connectivitySubscription;
  bool _wasDisconnected = false;

  SyncNotifier({
    required ConnectivityService connectivityService,
    required SyncCachedAnswersUseCase syncCachedAnswersUseCase,
    required SharedPreferences prefs,
  })  : _connectivityService = connectivityService,
        _syncCachedAnswersUseCase = syncCachedAnswersUseCase,
        _prefs = prefs,
        super(
          SyncState(
            status: SyncStatus.syncing,
            lastSyncTime: DateTime.tryParse(prefs.getString(_lastSyncTimeKey) ?? ''),
          ),
        ) {
    _initConnectivityListener();
  }

  void _initConnectivityListener() {
    _connectivitySubscription = _connectivityService.onStatusChange.listen((status) {
      final isConnected = status == InternetStatus.connected;

      if (isConnected && _wasDisconnected) {
        _sync();
        _wasDisconnected = false;
      } else if (!isConnected) {
        _wasDisconnected = true;
        state = state.copyWith(status: SyncStatus.noInternetConnection);
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  Future<void> _sync() async {
    state = state.copyWith(status: SyncStatus.syncing);

    final answersSyncResult = await _syncCachedAnswersUseCase.sync();

    switch (answersSyncResult) {
      case ResultOk():
        final syncTime = DateTime.now();
        state = state.copyWith(
          status: SyncStatus.synchronized,
          lastSyncTime: syncTime,
        );
        await _prefs.setString(_lastSyncTimeKey, syncTime.toString());
      case ResultFailed():
        state = state.copyWith(status: SyncStatus.syncFailed);
    }
  }
}
