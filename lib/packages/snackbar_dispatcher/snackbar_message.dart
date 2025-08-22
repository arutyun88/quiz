import 'package:flutter/material.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_action.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_priority.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_type.dart';

/// Abstract base class for all snackbar message types.
///
/// Defines common structure and properties for all notifications in the system.
/// Contains basic fields for identification, display and lifecycle management
/// of messages.
///
/// Inheritors should implement specific logic for different types
/// of notifications (network, sync, updates, etc.).
///
/// ---
///
/// Абстрактный базовый класс для всех типов сообщений snackbar.
///
/// Определяет общую структуру и свойства для всех уведомлений в системе.
/// Содержит базовые поля для идентификации, отображения и управления
/// жизненным циклом сообщений.
///
/// Наследники должны реализовать специфическую логику для различных типов
/// уведомлений (сеть, синхронизация, обновления и т.д.).
abstract class SnackbarMessage {
  /// Unique message identifier.
  ///
  /// Used for:
  /// - Preventing message duplication
  /// - Updating existing messages
  /// - Programmatic hiding of specific message
  ///
  /// Recommended to use descriptive names, e.g.:
  /// 'network_error', 'sync_progress', 'download_complete'
  ///
  /// ---
  ///
  /// Уникальный идентификатор сообщения.
  ///
  /// Используется для:
  /// - Предотвращения дублирования сообщений
  /// - Обновления существующих сообщений
  /// - Программного скрытия конкретного сообщения
  ///
  /// Рекомендуется использовать описательные имена, например:
  /// 'network_error', 'sync_progress', 'download_complete'
  final String id;

  /// Message text to display to user.
  ///
  /// ---
  ///
  /// Текст сообщения для отображения пользователю.
  final String message;

  /// Message type that determines its appearance and behavior.
  ///
  /// Affects:
  /// - Background color and icon
  /// - Auto-hide duration
  ///
  /// ---
  ///
  /// Тип сообщения, определяющий его внешний вид и поведение.
  ///
  /// Влияет на:
  /// - Цвет фона и иконку
  /// - Время автоматического скрытия
  final SnackbarType type;

  /// Custom duration for message display.
  ///
  /// If not specified, default value for the type is used:
  /// - info: 2 seconds
  /// - success: 2 seconds
  /// - warning: 3 seconds
  /// - error: 4 seconds
  /// - processing: infinite (until manually hidden)
  ///
  /// ---
  ///
  /// Пользовательская продолжительность отображения сообщения.
  ///
  /// Если не указано, используется значение по умолчанию для типа:
  /// - info: 2 секунды
  /// - success: 2 секунды
  /// - warning: 3 секунды
  /// - error: 4 секунды
  /// - processing: бесконечно (до ручного скрытия)
  ///
  /// Null означает, что сообщение не будет скрыто автоматически.
  final Duration? _duration;

  /// Duration for message display.
  ///
  /// Returns custom duration if specified, otherwise returns default duration
  /// based on message type. Returns null for processing type to indicate
  /// that message should not be auto-hidden.
  ///
  /// ---
  ///
  /// Продолжительность отображения сообщения.
  ///
  /// Возвращает пользовательскую продолжительность, если указана, иначе
  /// возвращает продолжительность по умолчанию на основе типа сообщения.
  /// Возвращает null для типа processing, указывая что сообщение
  /// не должно автоматически скрываться.
  Duration? get duration {
    if (_duration != null) return _duration;

    return switch (type) {
      SnackbarType.info => const Duration(seconds: 2),
      SnackbarType.success => const Duration(seconds: 2),
      SnackbarType.warning => const Duration(seconds: 3),
      SnackbarType.error => const Duration(seconds: 4),
      SnackbarType.processing => null, // infinite - no auto-hide
    };
  }

  /// Custom icon to display in message.
  ///
  /// If not specified, default icon for the type is used:
  /// - info: Icons.info
  /// - success: Icons.check_circle
  /// - warning: Icons.warning
  /// - error: Icons.error
  /// - processing: CircularProgressIndicator
  ///
  /// ---
  ///
  /// Пользовательская иконка для отображения в сообщении.
  ///
  /// Если не указано, используется иконка по умолчанию для типа:
  /// - info: Icons.info
  /// - success: Icons.check_circle
  /// - warning: Icons.warning
  /// - error: Icons.error
  /// - processing: CircularProgressIndicator
  final Widget? _icon;

  /// Icon for message display.
  ///
  /// Returns custom icon if specified, otherwise returns default icon
  /// based on message type. This getter ensures that icon is never null
  /// and always provides a meaningful widget for display.
  ///
  /// ---
  ///
  /// Иконка для отображения сообщения.
  ///
  /// Возвращает пользовательскую иконку, если указана, иначе
  /// возвращает иконку по умолчанию на основе типа сообщения.
  /// Этот геттер гарантирует, что icon никогда не будет null и всегда
  /// предоставляет осмысленный виджет для отображения.
  Widget get icon {
    if (_icon != null) return _icon;

    return switch (type) {
      SnackbarType.info => const Icon(Icons.info),
      SnackbarType.success => const Icon(Icons.check_circle),
      SnackbarType.warning => const Icon(Icons.warning),
      SnackbarType.error => const Icon(Icons.error),
      SnackbarType.processing => const CircularProgressIndicator(),
    };
  }

  /// Message priority for display order determination.
  ///
  /// Messages with higher priority are displayed above others.
  ///
  /// Priorities in descending order:
  /// - critical: critical errors requiring immediate attention
  /// - high: important notifications
  /// - normal: regular messages (default)
  /// - low: secondary information
  ///
  /// ---
  ///
  /// Приоритет сообщения для определения порядка отображения.
  ///
  /// Сообщения с более высоким приоритетом отображаются выше остальных.
  ///
  /// Приоритеты в порядке убывания:
  /// - critical: критические ошибки, требующие немедленного внимания
  /// - high: важные уведомления
  /// - normal: обычные сообщения (по умолчанию)
  /// - low: второстепенная информация
  final SnackbarPriority priority;

  /// Determines if message should remain on screen permanently.
  ///
  /// If true:
  /// - Message is not auto-hidden by timer
  /// - Close button is shown for manual hiding
  /// - Remains visible when navigating between screens
  ///
  /// Used for:
  /// - Loading/sync processes
  /// - Critical errors
  /// - Important notifications requiring user action
  ///
  /// ---
  ///
  /// Определяет, должно ли сообщение оставаться на экране постоянно.
  ///
  /// Если true:
  /// - Сообщение не скрывается автоматически по таймеру
  /// - Показывается кнопка закрытия для ручного скрытия
  /// - Остается видимым при навигации между экранами
  ///
  /// Используется для:
  /// - Процессов загрузки/синхронизации
  /// - Критических ошибок
  /// - Важных уведомлений, требующих действий пользователя
  final bool persistent;

  /// List of interactive actions (buttons) in message.
  ///
  /// Allows user to perform related actions directly
  /// from notification without navigating to another screen.
  ///
  /// Usage examples:
  /// - "Retry" for network errors
  /// - "Cancel" for download processes
  /// - "Update" for new version notifications
  /// - "Learn more" for informational messages
  ///
  /// ---
  ///
  /// Список интерактивных действий (кнопок) в сообщении.
  ///
  /// Позволяет пользователю выполнять связанные действия напрямую
  /// из уведомления без перехода на другой экран.
  ///
  /// Примеры использования:
  /// - "Повторить" для сетевых ошибок
  /// - "Отменить" для процессов загрузки
  /// - "Обновить" для уведомлений о новых версиях
  /// - "Узнать больше" для информационных сообщений
  final List<SnackbarAction>? actions;

  /// Group identifier for related messages.
  ///
  /// Allows grouping related notifications and managing them
  /// as a single unit. Useful for:
  ///
  /// - Network operations ('network')
  /// - Data synchronization ('sync')
  /// - Update processes ('updates')
  /// - File downloads ('downloads')
  ///
  /// Messages in same group can replace each other or
  /// be limited by concurrent display count.
  ///
  /// ---
  ///
  /// Идентификатор группы для связанных сообщений.
  ///
  /// Позволяет группировать связанные уведомления и управлять ими
  /// как единым целым. Полезно для:
  ///
  /// - Сетевых операций ('network')
  /// - Синхронизации данных ('sync')
  /// - Процессов обновления ('updates')
  /// - Загрузки файлов ('downloads')
  ///
  /// Сообщения в одной группе могут заменять друг друга или
  /// быть ограничены количеством одновременного отображения.
  final String? groupId;

  /// Creates new snackbar message with given parameters.
  ///
  /// Required parameters:
  /// - [id] - unique identifier
  /// - [message] - text to display
  /// - [type] - message type
  ///
  /// ---
  ///
  /// Создает новое снэкбар-сообщение с заданными параметрами.
  ///
  /// Обязательные параметры:
  /// - [id] - уникальный идентификатор
  /// - [message] - текст для отображения
  /// - [type] - тип сообщения
  const SnackbarMessage({
    required this.id,
    required this.message,
    required this.type,
    Duration? duration,
    Widget? icon,
    this.priority = SnackbarPriority.normal,
    this.persistent = false,
    this.actions,
    this.groupId,
  })  : _duration = duration,
        _icon = icon;
}
