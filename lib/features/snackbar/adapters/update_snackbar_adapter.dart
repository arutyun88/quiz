import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/snackbar_message.dart';
import '../provider/snackbar_provider.dart';
import 'snackbar_adapter.dart';

// Заглушка для UpdateState и updateProvider (замените на реальные провайдеры)
class UpdateState {
  final bool hasUpdate;
  final bool isUpdating;
  final bool updateDismissed;
  final bool updateCompleted;

  const UpdateState({
    this.hasUpdate = false,
    this.isUpdating = false,
    this.updateDismissed = false,
    this.updateCompleted = false,
  });
}

class UpdateNotifier extends StateNotifier<UpdateState> {
  UpdateNotifier() : super(const UpdateState());

  void startUpdate() {
    state = const UpdateState(isUpdating: true);
  }

  void dismissUpdate() {
    state = const UpdateState(updateDismissed: true);
  }
}

final updateProvider = StateNotifierProvider<UpdateNotifier, UpdateState>((ref) => UpdateNotifier());

// Сообщения для обновлений приложения
class UpdateSnackbarMessage extends SnackbarMessage {
  const UpdateSnackbarMessage({
    required super.id,
    required super.message,
    super.actions,
  }) : super(
          type: SnackbarType.info,
          priority: SnackbarPriority.high,
          persistent: true,
          groupId: 'updates',
        );

  factory UpdateSnackbarMessage.available(VoidCallback onUpdate, VoidCallback onLater) {
    return UpdateSnackbarMessage(
      id: 'update_available',
      message: 'Доступно обновление приложения',
      actions: [
        SnackbarAction(
          label: 'Обновить',
          onPressed: onUpdate,
          textColor: Colors.white,
        ),
        SnackbarAction(
          label: 'Позже',
          onPressed: onLater,
          textColor: Colors.white70,
        ),
      ],
    );
  }
}

// Адаптер для обновлений приложения
class UpdateSnackbarAdapter extends SnackbarAdapter {
  const UpdateSnackbarAdapter();

  @override
  String get id => 'update_adapter';

  @override
  void initialize(WidgetRef ref) {
    ref.listen<UpdateState>(updateProvider, (previous, current) {
      final snackbarNotifier = ref.read(snackbarProvider.notifier);

      if (current.hasUpdate && !current.isUpdating && !current.updateDismissed) {
        final message = UpdateSnackbarMessage.available(
          () => ref.read(updateProvider.notifier).startUpdate(),
          () => ref.read(updateProvider.notifier).dismissUpdate(),
        );
        snackbarNotifier.showSnackbar(message);
      } else if (current.isUpdating) {
        const message = BasicSnackbarMessage(
          id: 'updating',
          message: 'Установка обновления...',
          type: SnackbarType.loading,
          persistent: true,
          groupId: 'updates',
        );
        snackbarNotifier.showSnackbar(message);
      } else if (current.updateCompleted) {
        snackbarNotifier.hideGroup('updates');
        const message = BasicSnackbarMessage(
          id: 'update_completed',
          message: 'Обновление установлено успешно',
          type: SnackbarType.success,
          duration: Duration(seconds: 3),
        );
        snackbarNotifier.showSnackbar(message);
      }
    });
  }
}
