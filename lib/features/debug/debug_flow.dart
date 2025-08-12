import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/debug/debug_questions_widget.dart';
import 'package:quiz/features/question/domain/use_case/sync_cached_answers_use_case.dart';
import 'package:quiz/features/snackbar/domain/snackbar_message.dart';
import 'package:quiz/features/snackbar/provider/snackbar_provider.dart';
import 'package:quiz/features/snackbar/utils/snackbar_utils.dart';

class DebugFlow extends StatelessWidget with SnackbarMixin {
  const DebugFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      appBar: AppBar(title: Text('Debug')),
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          DebugQuestionsWidget(),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          SliverToBoxAdapter(
            child: AppWidget(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Удалить БД'),
                    onTap: () => getIt<AppDatabase>().deleteDatabase(),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Синхронизировать'),
                    onTap: () => getIt<SyncCachedAnswersUseCase>().sync(),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          SliverToBoxAdapter(
            child: AppWidget(
              child: Consumer(
                builder: (context, ref, child) => Column(
                  children: [
                    AppButton(
                      onTap: () => showInfo(ref, 'Это информационное сообщение'),
                      child: const Text('Показать Info'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () => showSuccess(ref, 'Операция выполнена успешно!'),
                      child: const Text('Показать Success'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () => showError(
                        ref,
                        'Произошла ошибка',
                        actions: [
                          SnackbarAction(
                            label: 'Повторить',
                            onPressed: () => showInfo(ref, 'Повтор запущен'),
                          ),
                        ],
                      ),
                      child: const Text('Показать Error'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () => showWarning(ref, 'Внимание! Проверьте данные'),
                      child: const Text('Показать Warning'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () {
                        showLoading(ref, 'Загрузка данных...', id: 'data_loading');
                        Timer(const Duration(seconds: 3), () {
                          hideLoading(ref, id: 'data_loading');
                          showSuccess(ref, 'Данные загружены!');
                        });
                      },
                      child: const Text('Показать Loading'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () => AdvancedExampleUsage.showMultipleMessages(ref),
                      child: const Text('Показать несколько сообщений'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () => AdvancedExampleUsage.showCriticalAlert(ref),
                      child: const Text('Критическое уведомление'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () => AdvancedExampleUsage.showProgressWithUpdates(ref),
                      child: const Text('Прогресс с обновлениями'),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      onTap: () => clearAllSnackbars(ref),
                      child: const Text('Очистить все'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Примеры использования всех возможностей системы
class AdvancedExampleUsage {
  // Стекинг снэкбаров
  static void showMultipleMessages(WidgetRef ref) {
    final notifier = ref.read(snackbarProvider.notifier);

    notifier.showMultiple([
      const BasicSnackbarMessage(
        id: 'msg1',
        message: 'Первое сообщение',
        type: SnackbarType.info,
      ),
      const BasicSnackbarMessage(
        id: 'msg2',
        message: 'Второе сообщение',
        type: SnackbarType.success,
        priority: SnackbarPriority.high,
      ),
      const BasicSnackbarMessage(
        id: 'msg3',
        message: 'Третье сообщение',
        type: SnackbarType.warning,
        priority: SnackbarPriority.critical,
      ),
    ]);
  }

  // Приоритеты
  static void showCriticalAlert(WidgetRef ref) {
    final message = BasicSnackbarMessage(
      id: 'critical_alert',
      message: 'КРИТИЧЕСКАЯ ОШИБКА: Потеря данных!',
      type: SnackbarType.error,
      priority: SnackbarPriority.critical,
      persistent: true,
      actions: [
        SnackbarAction(
          label: 'Восстановить',
          onPressed: () => _handleDataRecovery(ref),
        ),
        SnackbarAction(
          label: 'Связаться с поддержкой',
          onPressed: () => _contactSupport(ref),
        ),
      ],
    );
    ref.read(snackbarProvider.notifier).showSnackbar(message);
  }

  // Персистентность
  static void showPersistentDownload(WidgetRef ref) {
    final message = BasicSnackbarMessage(
      id: 'download_progress',
      message: 'Загрузка файла... 45%',
      type: SnackbarType.loading,
      persistent: true,
      actions: [
        SnackbarAction(
          label: 'Отменить',
          onPressed: () => _cancelDownload(ref),
        ),
      ],
    );
    ref.read(snackbarProvider.notifier).showSnackbar(message);
  }

  // Групповые операции
  static void showBatchOperationProgress(WidgetRef ref) {
    final notifier = ref.read(snackbarProvider.notifier);

    // Показываем прогресс операции
    const progressMessage = BasicSnackbarMessage(
      id: 'batch_progress',
      message: 'Обработка файлов: 3 из 10',
      type: SnackbarType.loading,
      persistent: true,
      groupId: 'batch_operation',
    );
    notifier.showSnackbar(progressMessage);

    // Через некоторое время показываем результат
    Timer(const Duration(seconds: 5), () {
      notifier.hideGroup('batch_operation');

      const completedMessage = BasicSnackbarMessage(
        id: 'batch_completed',
        message: 'Все файлы обработаны успешно',
        type: SnackbarType.success,
        duration: Duration(seconds: 3),
      );
      notifier.showSnackbar(completedMessage);
    });
  }

  // Динамическое обновление сообщения
  static void showProgressWithUpdates(WidgetRef ref) {
    final notifier = ref.read(snackbarProvider.notifier);
    int progress = 0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      progress += 10;

      if (progress <= 100) {
        final message = BasicSnackbarMessage(
          id: 'dynamic_progress',
          message: 'Загрузка: $progress%',
          type: SnackbarType.loading,
          persistent: true,
        );
        notifier.updateMessage('dynamic_progress', message);
      } else {
        timer.cancel();
        notifier.hideSnackbar('dynamic_progress');

        const doneMessage = BasicSnackbarMessage(
          id: 'progress_done',
          message: 'Загрузка завершена!',
          type: SnackbarType.success,
        );
        notifier.showSnackbar(doneMessage);
      }
    });
  }

  // Обработчики действий
  static void _handleDataRecovery(WidgetRef ref) {
    debugPrint('Запуск восстановления данных...');
    ref.read(snackbarProvider.notifier).hideSnackbar('critical_alert');

    const recoveryMessage = BasicSnackbarMessage(
      id: 'data_recovery',
      message: 'Восстановление данных...',
      type: SnackbarType.loading,
      persistent: true,
    );
    ref.read(snackbarProvider.notifier).showSnackbar(recoveryMessage);
  }

  static void _contactSupport(WidgetRef ref) {
    debugPrint('Открытие формы обратной связи...');
    // Логика открытия поддержки
  }

  static void _cancelDownload(WidgetRef ref) {
    debugPrint('Отмена загрузки...');
    ref.read(snackbarProvider.notifier).hideSnackbar('download_progress');

    const cancelMessage = BasicSnackbarMessage(
      id: 'download_cancelled',
      message: 'Загрузка отменена',
      type: SnackbarType.warning,
      duration: Duration(seconds: 2),
    );
    ref.read(snackbarProvider.notifier).showSnackbar(cancelMessage);
  }
}
