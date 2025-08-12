import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/snackbar/adapters/snackbar_adapter.dart';
import 'package:quiz/features/snackbar/domain/snackbar_message.dart';
import 'package:quiz/features/snackbar/provider/snackbar_provider.dart';
import 'package:quiz/features/sync/presentation/provider/sync_provider.dart';

class SyncSnackbarMessage extends SnackbarMessage {
  final SyncStatus status;

  const SyncSnackbarMessage({
    required super.id,
    required super.message,
    required this.status,
    super.priority = SnackbarPriority.normal,
    super.persistent = false,
  }) : super(
          type: SnackbarType.info,
          groupId: 'sync',
        );

  factory SyncSnackbarMessage.fromStatus(SyncStatus status) {
    return SyncSnackbarMessage(
      id: 'sync_${status.name}',
      message: switch (status) {
        SyncStatus.syncing => 'Синхронизация...',
        SyncStatus.synchronized => 'Синхронизация завершена успешно',
        SyncStatus.syncFailed => 'Ошибка синхронизации',
        SyncStatus.noInternetConnection => 'Нет подключения к интернету',
      },
      status: status,
      priority: status == SyncStatus.syncFailed ? SnackbarPriority.high : SnackbarPriority.normal,
      persistent: status == SyncStatus.syncing,
    );
  }
}

class SyncSnackbarAdapter extends SnackbarAdapter {
  const SyncSnackbarAdapter();

  @override
  String get id => 'sync_adapter';

  @override
  void initialize(WidgetRef ref) {
    ref.listen(
      syncProvider,
      (previous, current) {
        if (previous?.status != current.status) {
          final notifier = ref.read(snackbarProvider.notifier);

          switch (current.status) {
            case SyncStatus.syncing:
            case SyncStatus.synchronized:
            case SyncStatus.syncFailed:
              final message = SyncSnackbarMessage.fromStatus(current.status);
              notifier.showSnackbar(message);
            case SyncStatus.noInternetConnection:
              notifier.hideGroup('sync');
          }
        }
      },
    );
  }
}
