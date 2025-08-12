import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/snackbar_message.dart';
import '../provider/snackbar_provider.dart';
import 'snackbar_adapter.dart';

// Заглушка для NetworkState и networkProvider
class NetworkState {
  final bool isConnected;
  const NetworkState({required this.isConnected});
}

class NetworkNotifier extends StateNotifier<NetworkState> {
  NetworkNotifier() : super(const NetworkState(isConnected: true));

  void retry() {}
}

final networkProvider = StateNotifierProvider<NetworkNotifier, NetworkState>((ref) => NetworkNotifier());

class NetworkSnackbarMessage extends SnackbarMessage {
  const NetworkSnackbarMessage({
    required super.id,
    required super.message,
    required super.type,
    super.duration,
    super.priority = SnackbarPriority.high,
    super.actions,
  }) : super(groupId: 'network');

  factory NetworkSnackbarMessage.connectionLost(VoidCallback? onRetry) {
    return NetworkSnackbarMessage(
      id: 'network_lost',
      message: 'Соединение потеряно',
      type: SnackbarType.error,
      duration: const Duration(seconds: 5),
      priority: SnackbarPriority.critical,
      actions: onRetry != null
          ? [
              SnackbarAction(
                label: 'Повторить',
                onPressed: onRetry,
                textColor: Colors.white,
              ),
            ]
          : null,
    );
  }

  factory NetworkSnackbarMessage.connectionRestored() {
    return const NetworkSnackbarMessage(
      id: 'network_restored',
      message: 'Соединение восстановлено',
      type: SnackbarType.success,
      duration: Duration(seconds: 2),
      priority: SnackbarPriority.normal,
    );
  }
}

// Адаптер для сетевого состояния
class NetworkSnackbarAdapter extends SnackbarAdapter {
  const NetworkSnackbarAdapter();

  @override
  String get id => 'network_adapter';

  @override
  void initialize(WidgetRef ref) {
    ref.listen<NetworkState>(networkProvider, (previous, current) {
      final snackbarNotifier = ref.read(snackbarProvider.notifier);

      if (previous?.isConnected != current.isConnected) {
        if (!current.isConnected) {
          final message = NetworkSnackbarMessage.connectionLost(
            () => ref.read(networkProvider.notifier).retry(),
          );
          snackbarNotifier.showSnackbar(message);
        } else if (previous?.isConnected == false) {
          // Подключение восстановлено
          snackbarNotifier.hideGroup('network'); // Скрываем ошибки сети
          final message = NetworkSnackbarMessage.connectionRestored();
          snackbarNotifier.showSnackbar(message);
        }
      }
    });
  }
}
