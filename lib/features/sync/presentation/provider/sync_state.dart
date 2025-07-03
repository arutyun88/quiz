part of 'sync_provider.dart';

enum SyncStatus { noInternetConnection, synchronized, syncFailed, syncing }

@freezed
class SyncState with _$SyncState {
  factory SyncState({
    required SyncStatus status,
    required DateTime? lastSyncTime,
  }) = _SyncSTate;
}
