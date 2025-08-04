import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/snackbar/domain/snackbar_message.dart';
import 'package:quiz/features/snackbar/provider/snackbar_provider.dart';

/// Утилиты для создания типизированных сообщений снэкбаров.
///
/// Предоставляет статические методы для создания стандартных типов уведомлений:
/// - Информационные сообщения
/// - Сообщения об успехе
/// - Сообщения об ошибках
/// - Предупреждения
/// - Индикаторы загрузки
///
/// Каждый метод автоматически генерирует уникальный ID на основе текущего времени
/// и устанавливает подходящие настройки для конкретного типа сообщения.
///
/// Пример использования:
/// ```dart
/// // Создание информационного сообщения
/// final infoMessage = SnackbarMessages.info('Данные обновлены');
///
/// // Создание сообщения об ошибке с действиями
/// final errorMessage = SnackbarMessages.error(
///   'Не удалось загрузить данные',
///   actions: [SnackbarAction(label: 'Повторить', onPressed: () => retry())],
/// );
/// ```
///
/// ---
///
/// Utilities for creation of typed snackbar messages.
///
/// Provides static methods for creating standard notification types:
/// - Information messages
/// - Success messages
/// - Error messages
/// - Warnings
/// - Loading indicators
///
/// Each method automatically generates unique ID based on current time
/// and sets appropriate settings for specific message type.
///
/// Usage example:
/// ```dart
/// // Create information message
/// final infoMessage = SnackbarMessages.info('Data updated');
///
/// // Create error message with actions
/// final errorMessage = SnackbarMessages.error(
///   'Failed to load data',
///   actions: [SnackbarAction(label: 'Retry', onPressed: () => retry())],
/// );
/// ```
class SnackbarMessages {
  /// Создает сообщение типа [SnackbarType.info] с автоматически сгенерированным ID.
  /// Информационные сообщения имеют обычный приоритет и используются для
  /// отображения нейтральной информации пользователю.
  ///
  /// Параметры:
  /// - [message] - текст сообщения для отображения
  /// - [duration] - время отображения (по умолчанию используется стандартное)
  ///
  /// Возвращает: [SnackbarMessage] настроенный как информационное сообщение
  ///
  /// Пример:
  /// ```dart
  /// final message = SnackbarMessages.info('Профиль обновлен');
  /// ref.read(snackbarProvider.notifier).showSnackbar(message);
  /// ```
  ///
  /// ---
  ///
  /// Creates message of type [SnackbarType.info] with auto-generated ID.
  /// Information messages have normal priority and are used to
  /// display neutral information to the user.
  ///
  /// Parameters:
  /// - [message] - message text to display
  /// - [duration] - display duration (uses standard by default)
  ///
  /// Returns: [SnackbarMessage] configured as information message
  ///
  /// Example:
  /// ```dart
  /// final message = SnackbarMessages.info('Profile updated');
  /// ref.read(snackbarProvider.notifier).showSnackbar(message);
  /// ```
  static SnackbarMessage info(
    String message, {
    Duration? duration,
  }) =>
      BasicSnackbarMessage(
        id: 'info_${DateTime.now().millisecondsSinceEpoch}',
        message: message,
        type: SnackbarType.info,
        duration: duration,
      );

  /// Создает сообщение типа [SnackbarType.success] с коротким временем отображения (2 секунды).
  /// Сообщения об успехе используются для подтверждения успешного выполнения операций.
  ///
  /// Параметры:
  /// - [message] - текст сообщения об успешном выполнении
  /// - [duration] - время отображения (по умолчанию 2 секунды)
  ///
  /// Возвращает: [SnackbarMessage] настроенный как сообщение об успехе
  ///
  /// Пример:
  /// ```dart
  /// final message = SnackbarMessages.success('Файл успешно сохранен');
  /// ref.read(snackbarProvider.notifier).showSnackbar(message);
  /// ```
  ///
  /// ---
  ///
  /// Creates message of type [SnackbarType.success] with short display duration (2 seconds).
  /// Success messages are used to confirm successful operation completion.
  ///
  /// Parameters:
  /// - [message] - successful operation message text
  /// - [duration] - display duration (2 seconds by default)
  ///
  /// Returns: [SnackbarMessage] configured as success message
  ///
  /// Example:
  /// ```dart
  /// final message = SnackbarMessages.success('File saved successfully');
  /// ref.read(snackbarProvider.notifier).showSnackbar(message);
  /// ```
  static SnackbarMessage success(
    String message, {
    Duration? duration,
  }) =>
      BasicSnackbarMessage(
        id: 'success_${DateTime.now().millisecondsSinceEpoch}',
        message: message,
        type: SnackbarType.success,
        duration: duration ?? Duration(seconds: 2),
      );

  /// Создает сообщение типа [SnackbarType.error] с высоким приоритетом и увеличенным
  /// временем отображения (4 секунды). Поддерживает добавление действий для
  /// восстановления после ошибки.
  ///
  /// Особенности:
  /// - Автоматически устанавливается высокий приоритет
  /// - Увеличенное время отображения для важных ошибок
  /// - Поддержка действий (повтор, отмена, подробности и т.д.)
  ///
  /// Параметры:
  /// - [message] - описание ошибки
  /// - [duration] - время отображения (по умолчанию 4 секунды)
  /// - [actions] - список действий для восстановления
  ///
  /// Возвращает: [SnackbarMessage] настроенный как сообщение об ошибке
  ///
  /// Пример:
  /// ```dart
  /// final message = SnackbarMessages.error(
  ///   'Не удалось подключиться к серверу',
  ///   actions: [
  ///     SnackbarAction(label: 'Повторить', onPressed: () => retry()),
  ///     SnackbarAction(label: 'Настройки', onPressed: () => openSettings()),
  ///   ],
  /// );
  /// ```
  ///
  /// ---
  ///
  /// Creates message of type [SnackbarType.error] with high priority and extended
  /// display duration (4 seconds). Supports adding actions for
  /// error recovery.
  ///
  /// Features:
  /// - Automatically sets high priority
  /// - Extended display time for important errors
  /// - Support for actions (retry, cancel, details, etc.)
  ///
  /// Parameters:
  /// - [message] - error description
  /// - [duration] - display duration (4 seconds by default)
  /// - [actions] - list of recovery actions
  ///
  /// Returns: [SnackbarMessage] configured as error message
  ///
  /// Example:
  /// ```dart
  /// final message = SnackbarMessages.error(
  ///   'Failed to connect to server',
  ///   actions: [
  ///     SnackbarAction(label: 'Retry', onPressed: () => retry()),
  ///     SnackbarAction(label: 'Settings', onPressed: () => openSettings()),
  ///   ],
  /// );
  /// ```
  static SnackbarMessage error(
    String message, {
    Duration? duration,
    List<SnackbarAction>? actions,
  }) =>
      BasicSnackbarMessage(
        id: 'error_${DateTime.now().millisecondsSinceEpoch}',
        message: message,
        type: SnackbarType.error,
        duration: duration ?? const Duration(seconds: 4),
        priority: SnackbarPriority.high,
        actions: actions,
      );

  /// Создает сообщение типа [SnackbarType.warning] со средним временем отображения (3 секунды).
  /// Предупреждения используются для информирования пользователя о потенциальных
  /// проблемах или важных изменениях, которые требуют внимания.
  ///
  /// Идеально подходит для:
  /// - Предупреждений о несохраненных данных
  /// - Уведомлений о низком заряде батареи
  /// - Информации о временных ограничениях
  /// - Предупреждений о изменениях в работе приложения
  ///
  /// Параметры:
  /// - [message] - текст предупреждения
  /// - [duration] - время отображения (по умолчанию 3 секунды)
  ///
  /// Возвращает: [SnackbarMessage] настроенный как предупреждение
  ///
  /// Пример:
  /// ```dart
  /// final message = SnackbarMessages.warning('У вас есть несохраненные изменения');
  /// ref.read(snackbarProvider.notifier).showSnackbar(message);
  /// ```
  ///
  /// ---
  ///
  /// Creates message of type [SnackbarType.warning] with medium display duration (3 seconds).
  /// Warnings are used to inform user about potential
  /// issues or important changes that require attention.
  ///
  /// Perfect for:
  /// - Unsaved data warnings
  /// - Low battery notifications
  /// - Temporary limitations information
  /// - App behavior change warnings
  ///
  /// Parameters:
  /// - [message] - warning text
  /// - [duration] - display duration (3 seconds by default)
  ///
  /// Returns: [SnackbarMessage] configured as warning
  ///
  /// Example:
  /// ```dart
  /// final message = SnackbarMessages.warning('You have unsaved changes');
  /// ref.read(snackbarProvider.notifier).showSnackbar(message);
  /// ```
  static SnackbarMessage warning(
    String message, {
    Duration? duration,
  }) =>
      BasicSnackbarMessage(
        id: 'warning_${DateTime.now().millisecondsSinceEpoch}',
        message: message,
        type: SnackbarType.warning,
        duration: duration ?? const Duration(seconds: 3),
      );

  /// Создает персистентное сообщение типа [SnackbarType.loading], которое остается
  /// видимым до явного скрытия. Поддерживает пользовательский ID для удобного
  /// управления конкретными индикаторами загрузки.
  ///
  /// Особенности:
  /// - Персистентное отображение (не исчезает автоматически)
  /// - Поддержка пользовательского ID для точного управления
  /// - Автоматическая генерация ID при отсутствии пользовательского
  ///
  /// Полезно для:
  /// - Индикации долгих операций (загрузка файлов, синхронизация)
  /// - Отображения прогресса выполнения задач
  /// - Блокировки интерфейса во время критических операций
  ///
  /// Параметры:
  /// - [message] - текст индикатора загрузки
  /// - [customId] - пользовательский ID (опционально)
  ///
  /// Возвращает: [SnackbarMessage] настроенный как индикатор загрузки
  ///
  /// Пример:
  /// ```dart
  /// // Показываем индикатор загрузки
  /// final loadingMessage = SnackbarMessages.loading(
  ///   'Загрузка данных...',
  ///   customId: 'data_loading',
  /// );
  /// ref.read(snackbarProvider.notifier).showSnackbar(loadingMessage);
  ///
  /// // Позже скрываем по ID
  /// ref.read(snackbarProvider.notifier).hideSnackbar('data_loading');
  /// ```
  ///
  /// ---
  ///
  /// Creates persistent message of type [SnackbarType.loading] that remains
  /// visible until explicitly hidden. Supports custom ID for convenient
  /// management of specific loading indicators.
  ///
  /// Features:
  /// - Persistent display (doesn't disappear automatically)
  /// - Custom ID support for precise control
  /// - Automatic ID generation when custom ID is absent
  ///
  /// Useful for:
  /// - Long operation indication (file loading, sync)
  /// - Task progress display
  /// - UI blocking during critical operations
  ///
  /// Parameters:
  /// - [message] - loading indicator text
  /// - [customId] - custom ID (optional)
  ///
  /// Returns: [SnackbarMessage] configured as loading indicator
  ///
  /// Example:
  /// ```dart
  /// // Show loading indicator
  /// final loadingMessage = SnackbarMessages.loading(
  ///   'Loading data...',
  ///   customId: 'data_loading',
  /// );
  /// ref.read(snackbarProvider.notifier).showSnackbar(loadingMessage);
  ///
  /// // Later hide by ID
  /// ref.read(snackbarProvider.notifier).hideSnackbar('data_loading');
  /// ```
  static SnackbarMessage loading(
    String message, {
    String? customId,
  }) =>
      BasicSnackbarMessage(
        id: customId ?? 'loading_${DateTime.now().millisecondsSinceEpoch}',
        message: message,
        type: SnackbarType.loading,
        persistent: true,
      );
}

/// Миксин для упрощения работы со снэкбарами в виджетах.
///
/// Предоставляет удобные методы для показа различных типов уведомлений
/// без необходимости создавать сообщения вручную. Все методы принимают
/// [WidgetRef] для доступа к провайдеру снэкбаров.
///
/// Использование миксина позволяет:
/// - Сократить количество кода для показа стандартных уведомлений
/// - Обеспечить единообразный API во всех виджетах
/// - Упростить управление индикаторами загрузки
/// - Централизовать логику работы со снэкбарами
///
/// Пример подключения:
/// ```dart
/// class MyWidget extends ConsumerWidget with SnackbarMixin {
///   @override
///   Widget build(BuildContext context, WidgetRef ref) {
///     return ElevatedButton(
///       onPressed: () => showSuccess(ref, 'Операция выполнена!'),
///       child: Text('Выполнить'),
///     );
///   }
/// }
/// ```
///
/// ---
///
/// Mixin for simplifying snackbar usage in widgets.
///
/// Provides convenient methods for showing different notification types
/// without need to create messages manually. All methods accept
/// [WidgetRef] for accessing snackbar provider.
///
/// Using the mixin allows to:
/// - Reduce code amount for showing standard notifications
/// - Ensure consistent API across all widgets
/// - Simplify loading indicator management
/// - Centralize snackbar logic
///
/// Connection example:
/// ```dart
/// class MyWidget extends ConsumerWidget with SnackbarMixin {
///   @override
///   Widget build(BuildContext context, WidgetRef ref) {
///     return ElevatedButton(
///       onPressed: () => showSuccess(ref, 'Operation completed!'),
///       child: Text('Execute'),
///     );
///   }
/// }
/// ```
mixin SnackbarMixin {
  /// Показывает информационное сообщение.
  ///
  /// Использует [SnackbarMessages.info] для создания сообщения и
  /// автоматически показывает его через провайдер снэкбаров.
  ///
  /// Параметры:
  /// - [ref] - ссылка на провайдер виджета
  /// - [message] - текст информационного сообщения
  /// - [duration] - время отображения (опционально)
  ///
  /// Пример:
  /// ```dart
  /// showInfo(ref, 'Данные обновлены');
  /// ```
  ///
  /// ---
  ///
  /// Shows information message.
  ///
  /// Uses [SnackbarMessages.info] to create message and
  /// automatically shows it through snackbar provider.
  ///
  /// Parameters:
  /// - [ref] - widget provider reference
  /// - [message] - information message text
  /// - [duration] - display duration (optional)
  ///
  /// Example:
  /// ```dart
  /// showInfo(ref, 'Data updated');
  /// ```
  void showInfo(
    WidgetRef ref,
    String message, {
    Duration? duration,
  }) {
    ref.read(snackbarProvider.notifier).showSnackbar(
          SnackbarMessages.info(
            message,
            duration: duration,
          ),
        );
  }

  /// Показывает сообщение об успехе.
  ///
  /// Использует [SnackbarMessages.success] для создания сообщения с
  /// подходящими настройками для уведомлений об успешных операциях.
  ///
  /// Параметры:
  /// - [ref] - ссылка на провайдер виджета
  /// - [message] - текст сообщения об успехе
  /// - [duration] - время отображения (по умолчанию 2 секунды)
  ///
  /// Пример:
  /// ```dart
  /// showSuccess(ref, 'Файл успешно загружен');
  /// ```
  ///
  /// ---
  ///
  /// Shows success message.
  ///
  /// Uses [SnackbarMessages.success] to create message with
  /// appropriate settings for successful operation notifications.
  ///
  /// Parameters:
  /// - [ref] - widget provider reference
  /// - [message] - success message text
  /// - [duration] - display duration (2 seconds by default)
  ///
  /// Example:
  /// ```dart
  /// showSuccess(ref, 'File uploaded successfully');
  /// ```
  void showSuccess(
    WidgetRef ref,
    String message, {
    Duration? duration,
  }) {
    ref.read(snackbarProvider.notifier).showSnackbar(
          SnackbarMessages.success(
            message,
            duration: duration,
          ),
        );
  }

  /// Показывает сообщение об ошибке.
  ///
  /// Использует [SnackbarMessages.error] для создания сообщения с высоким
  /// приоритетом и поддержкой действий для восстановления после ошибки.
  ///
  /// Параметры:
  /// - [ref] - ссылка на провайдер виджета
  /// - [message] - описание ошибки
  /// - [duration] - время отображения (по умолчанию 4 секунды)
  /// - [actions] - действия для восстановления (опционально)
  ///
  /// Пример:
  /// ```dart
  /// showError(
  ///   ref,
  ///   'Не удалось сохранить файл',
  ///   actions: [
  ///     SnackbarAction(label: 'Повторить', onPressed: () => saveFile()),
  ///   ],
  /// );
  /// ```
  ///
  /// ---
  ///
  /// Shows error message.
  ///
  /// Uses [SnackbarMessages.error] to create message with high
  /// priority and support for recovery actions.
  ///
  /// Parameters:
  /// - [ref] - widget provider reference
  /// - [message] - error description
  /// - [duration] - display duration (4 seconds by default)
  /// - [actions] - recovery actions (optional)
  ///
  /// Example:
  /// ```dart
  /// showError(
  ///   ref,
  ///   'Failed to save file',
  ///   actions: [
  ///     SnackbarAction(label: 'Retry', onPressed: () => saveFile()),
  ///   ],
  /// );
  /// ```
  void showError(
    WidgetRef ref,
    String message, {
    Duration? duration,
    List<SnackbarAction>? actions,
  }) {
    ref.read(snackbarProvider.notifier).showSnackbar(
          SnackbarMessages.error(
            message,
            duration: duration,
            actions: actions,
          ),
        );
  }

  /// Показывает предупреждение.
  ///
  /// Использует [SnackbarMessages.warning] для создания предупреждающего
  /// сообщения со средним временем отображения.
  ///
  /// Параметры:
  /// - [ref] - ссылка на провайдер виджета
  /// - [message] - текст предупреждения
  /// - [duration] - время отображения (по умолчанию 3 секунды)
  ///
  /// Пример:
  /// ```dart
  /// showWarning(ref, 'Осталось мало места на диске');
  /// ```
  ///
  /// ---
  ///
  /// Shows warning message.
  ///
  /// Uses [SnackbarMessages.warning] to create warning
  /// message with medium display duration.
  ///
  /// Parameters:
  /// - [ref] - widget provider reference
  /// - [message] - warning text
  /// - [duration] - display duration (3 seconds by default)
  ///
  /// Example:
  /// ```dart
  /// showWarning(ref, 'Low disk space remaining');
  /// ```
  void showWarning(
    WidgetRef ref,
    String message, {
    Duration? duration,
  }) {
    ref.read(snackbarProvider.notifier).showSnackbar(
          SnackbarMessages.warning(
            message,
            duration: duration,
          ),
        );
  }

  /// Показывает индикатор загрузки.
  ///
  /// Создает персистентное сообщение, которое остается видимым
  /// до явного скрытия через [hideLoading] или другие методы скрытия.
  ///
  /// Параметры:
  /// - [ref] - ссылка на провайдер виджета
  /// - [message] - текст индикатора загрузки
  /// - [id] - пользовательский ID для управления
  ///
  /// Пример:
  /// ```dart
  /// // Показываем загрузку
  /// showLoading(ref, 'Загрузка данных...', id: 'main_loading');
  ///
  /// // После завершения скрываем
  /// hideLoading(ref, 'main_loading');
  /// ```
  ///
  /// ---
  ///
  /// Shows loading indicator.
  ///
  /// Creates persistent message that remains visible
  /// until explicitly hidden via [hideLoading] or other hide methods.
  ///
  /// Parameters:
  /// - [ref] - widget provider reference
  /// - [message] - loading indicator text
  /// - [id] - custom ID for management
  ///
  /// Example:
  /// ```dart
  /// // Show loading
  /// showLoading(ref, 'Loading data...', id: 'main_loading');
  ///
  /// // Hide after completion
  /// hideLoading(ref, 'main_loading');
  /// ```
  void showLoading(
    WidgetRef ref,
    String message, {
    required String id,
  }) {
    ref.read(snackbarProvider.notifier).showSnackbar(
          SnackbarMessages.loading(
            message,
            customId: id,
          ),
        );
  }

  /// Скрывает индикатор загрузки по ID.
  ///
  /// Удаляет конкретное сообщение загрузки из списка активных уведомлений.
  /// Используется в паре с [showLoading] для управления жизненным циклом
  /// индикаторов загрузки.
  ///
  /// Параметры:
  /// - [ref] - ссылка на провайдер виджета
  /// - [id] - идентификатор индикатора загрузки для скрытия
  ///
  /// Пример:
  /// ```dart
  /// hideLoading(ref, 'data_sync_loading');
  /// ```
  ///
  /// ---
  ///
  /// Hides loading indicator by ID.
  ///
  /// Removes specific loading message from active notifications list.
  /// Used together with [showLoading] to manage loading indicator lifecycle.
  ///
  /// Parameters:
  /// - [ref] - widget provider reference
  /// - [id] - loading indicator identifier to hide
  ///
  /// Example:
  /// ```dart
  /// hideLoading(ref, 'data_sync_loading');
  /// ```
  void hideLoading(
    WidgetRef ref, {
    required String id,
  }) {
    ref.read(snackbarProvider.notifier).hideSnackbar(
          id,
        );
  }

  /// Очищает все активные снэкбары.
  ///
  /// Полностью сбрасывает состояние уведомлений, удаляя все сообщения
  /// включая персистентные индикаторы загрузки. Полезно для очистки
  /// интерфейса при переходах между экранами или при критических ошибках.
  ///
  /// Параметры:
  /// - [ref] - ссылка на провайдер виджета
  ///
  /// Пример:
  /// ```dart
  /// // Очищаем все уведомления при выходе из экрана
  /// clearAllSnackbars(ref);
  /// ```
  ///
  /// ---
  ///
  /// Clears all active snackbars.
  ///
  /// Completely resets notifications state, removing all messages
  /// including persistent loading indicators. Useful for UI cleanup
  /// during screen transitions or critical errors.
  ///
  /// Parameters:
  /// - [ref] - widget provider reference
  ///
  /// Example:
  /// ```dart
  /// // Clear all notifications when leaving screen
  /// clearAllSnackbars(ref);
  /// ```
  void clearAllSnackbars(WidgetRef ref) {
    ref.read(snackbarProvider.notifier).clearAll();
  }
}
