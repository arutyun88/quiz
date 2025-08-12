import 'package:flutter/material.dart';

/// Абстрактный базовый класс для всех типов снэкбар-сообщений.
///
/// Определяет общую структуру и свойства для всех уведомлений в системе.
/// Содержит основные поля для идентификации, отображения и управления
/// жизненным циклом сообщений.
///
/// Наследники должны реализовать конкретную логику для различных типов
/// уведомлений (сетевые, синхронизация, обновления и т.д.).
///
/// ---
///
/// Abstract base class for all snackbar message types.
///
/// Defines common structure and properties for all notifications in the system.
/// Contains basic fields for identification, display and lifecycle management
/// of messages.
///
/// Inheritors should implement specific logic for different types
/// of notifications (network, sync, updates, etc.).
abstract class SnackbarMessage {
  /// Уникальный идентификатор сообщения.
  ///
  /// Используется для:
  /// - Предотвращения дублирования сообщений
  /// - Обновления существующих сообщений
  /// - Программного скрытия конкретного сообщения
  ///
  /// Рекомендуется использовать описательные имена, например:
  /// 'network_error', 'sync_progress', 'download_complete'
  ///
  /// ---
  ///
  /// Unique message identifier.
  ///
  /// Used for:
  /// - Preventing message duplication
  /// - Updating existing messages
  /// - Programmatic hiding of specific message
  ///
  /// Recommended to use descriptive names, e.g.:
  /// 'network_error', 'sync_progress', 'download_complete'
  final String id;

  /// Текст сообщения для отображения пользователю.
  ///
  /// ---
  ///
  /// Message text to display to user.
  final String message;

  /// Тип сообщения, определяющий его внешний вид и поведение.
  ///
  /// Влияет на:
  /// - Цвет фона и иконку
  /// - Время автоматического скрытия
  ///
  /// ---
  ///
  /// Message type that determines its appearance and behavior.
  ///
  /// Affects:
  /// - Background color and icon
  /// - Auto-hide duration
  final SnackbarType type;

  /// Время отображения сообщения перед автоматическим скрытием.
  ///
  /// Если не указано, используется значение по умолчанию для данного типа:
  /// - info: 2 секунды
  /// - success: 2 секунды
  /// - warning: 3 секунды
  /// - error: 4 секунды
  /// - loading: бесконечно (пока не скрыто вручную)
  ///
  /// Null означает, что сообщение не будет скрыто автоматически.
  ///
  /// ---
  ///
  /// Display duration before automatic hiding.
  ///
  /// If not specified, default value for the type is used:
  /// - info: 2 seconds
  /// - success: 2 seconds
  /// - warning: 3 seconds
  /// - error: 4 seconds
  /// - loading: infinite (until manually hidden)
  ///
  /// Null means message won't be hidden automatically.
  final Duration? duration;

  /// Пользовательская иконка для отображения в сообщении.
  ///
  /// Если не указана, используется иконка по умолчанию для данного типа:
  /// - info: Icons.info
  /// - success: Icons.check_circle
  /// - warning: Icons.warning
  /// - error: Icons.error
  /// - loading: CircularProgressIndicator
  ///
  /// ---
  ///
  /// Custom icon to display in message.
  ///
  /// If not specified, default icon for the type is used:
  /// - info: Icons.info
  /// - success: Icons.check_circle
  /// - warning: Icons.warning
  /// - error: Icons.error
  /// - loading: CircularProgressIndicator
  final Widget? icon;

  /// Приоритет сообщения для определения порядка отображения.
  ///
  /// Сообщения с более высоким приоритетом отображаются выше.
  ///
  /// Приоритеты по убыванию:
  /// - critical: критические ошибки, требующие немедленного внимания
  /// - high: важные уведомления
  /// - normal: обычные сообщения (по умолчанию)
  /// - low: второстепенная информация
  ///
  /// ---
  ///
  /// Message priority for display order determination.
  ///
  /// Messages with higher priority are displayed above others.
  ///
  /// Priorities in descending order:
  /// - critical: critical errors requiring immediate attention
  /// - high: important notifications
  /// - normal: regular messages (default)
  /// - low: secondary information
  final SnackbarPriority priority;

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
  ///
  /// ---
  ///
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
  final bool persistent;

  /// Список интерактивных действий (кнопок) в сообщении.
  ///
  /// Позволяет пользователю выполнить связанные действия прямо
  /// из уведомления без перехода на другой экран.
  ///
  /// Примеры использования:
  /// - "Повторить" для ошибок сети
  /// - "Отменить" для процессов загрузки
  /// - "Обновить" для уведомлений о новых версиях
  /// - "Подробнее" для информационных сообщений
  ///
  /// ---
  ///
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
  final List<SnackbarAction>? actions;

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
  /// ограничиваться по количеству одновременно показываемых.
  ///
  /// ---
  ///
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
  final String? groupId;

  /// Создает новое снэкбар-сообщение с заданными параметрами.
  ///
  /// Обязательные параметры:
  /// - [id] - уникальный идентификатор
  /// - [message] - текст для отображения
  /// - [type] - тип сообщения
  ///
  /// ---
  ///
  /// Creates new snackbar message with given parameters.
  ///
  /// Required parameters:
  /// - [id] - unique identifier
  /// - [message] - text to display
  /// - [type] - message type
  const SnackbarMessage({
    required this.id,
    required this.message,
    required this.type,
    this.duration,
    this.icon,
    this.priority = SnackbarPriority.normal,
    this.persistent = false,
    this.actions,
    this.groupId,
  });
}

/// Перечисление типов снэкбар-сообщений.
///
/// Каждый тип имеет свои визуальные характеристики
/// и время автоматического скрытия
///
/// ---
///
/// Enumeration of snackbar message types.
///
/// Each type has its visual characteristics
/// and auto-hide duration
enum SnackbarType {
  /// Информационное сообщение.
  /// Используется для нейтральной информации, подсказок, статусов.
  ///
  /// Information message.
  /// Used for neutral information, hints, statuses.
  info,

  /// Сообщение об успехе.
  /// Используется для подтверждения успешных операций.
  ///
  /// Success message.
  /// Used to confirm successful operations.
  success,

  /// Предупреждение.
  /// Используется для потенциальных проблем, которые не блокируют работу.
  ///
  /// Warning message.
  /// Used for potential issues that don't block functionality.
  warning,

  /// Сообщение об ошибке.
  /// Используется для критических ошибок и проблем.
  ///
  /// Error message.
  /// Used for critical errors and problems.
  error,

  /// Сообщение о загрузке.
  /// Используется для отображения процессов, требующих времени.
  ///
  /// Loading message.
  /// Used to display time-consuming processes.
  loading,
}

/// Перечисление приоритетов снэкбар-сообщений.
///
/// Определяет важность сообщения и влияет на:
/// - Порядок отображения (высокий приоритет выше)
/// - Поведение при превышении лимитов сообщений
///
/// ---
///
/// Enumeration of snackbar message priorities.
///
/// Determines message importance and affects:
/// - Display order (high priority above others)
/// - Behavior when message limits are exceeded
enum SnackbarPriority {
  /// Низкий приоритет (значение 0).
  /// Для второстепенной информации, которая может быть пропущена.
  ///
  /// Low priority (value 0).
  /// For secondary information that can be missed.
  low(0),

  /// Обычный приоритет (значение 1).
  /// Для стандартных уведомлений и информационных сообщений.
  ///
  /// Normal priority (value 1).
  /// For standard notifications and informational messages.
  normal(1),

  /// Высокий приоритет (значение 2).
  /// Для важных уведомлений, требующих внимания пользователя.
  ///
  /// High priority (value 2).
  /// For important notifications requiring user attention.
  high(2),

  /// Критический приоритет (значение 3).
  /// Для критических ошибок и ситуаций, требующих немедленных действий.
  ///
  /// Critical priority (value 3).
  /// For critical errors and situations requiring immediate action.
  critical(3);

  const SnackbarPriority(this.value);

  /// Числовое значение приоритета для сравнения и сортировки.
  /// Большее значение означает более высокий приоритет.
  ///
  /// Numeric priority value for comparison and sorting.
  /// Higher value means higher priority.
  final int value;
}

/// Класс для интерактивных действий в снэкбар-сообщениях.
///
/// Представляет кнопку с текстом и обработчиком нажатия,
/// которая отображается внутри снэкбара для выполнения
/// связанных с уведомлением действий.
///
/// ---
///
/// Class for interactive actions in snackbar messages.
///
/// Represents a button with text and tap handler,
/// displayed inside snackbar to perform
/// notification-related actions.
class SnackbarAction {
  /// Текст кнопки действия.
  ///
  /// ---
  ///
  /// Action button text.
  final String label;

  /// Обработчик нажатия на кнопку действия.
  ///
  /// Вызывается при нажатии пользователем на кнопку.
  /// Может выполнять любые действия: навигацию, API-вызовы,
  /// изменение состояния приложения и т.д.
  ///
  /// После выполнения действия снэкбар может быть автоматически
  /// скрыт (зависит от настройки persistent).
  ///
  /// ---
  ///
  /// Action button tap handler.
  ///
  /// Called when user taps the button.
  /// Can perform any actions: navigation, API calls,
  /// app state changes, etc.
  ///
  /// After action execution snackbar may be automatically
  /// hidden (depends on persistent setting).
  final VoidCallback onPressed;

  /// Цвет текста кнопки действия.
  ///
  /// Если не указан, используется цвет по умолчанию.
  /// Можно использовать для выделения основного действия или
  /// создания визуальной иерархии между действиями.
  ///
  /// ---
  ///
  /// Action button text color.
  ///
  /// If not specified, default color is used.
  /// Can be used to highlight primary action or
  /// create visual hierarchy between actions.
  final Color? textColor;

  /// Создает новое действие для снэкбар-сообщения.
  ///
  /// Обязательные параметры:
  /// - [label] - текст кнопки
  /// - [onPressed] - обработчик нажатия
  ///
  /// Пример:
  /// ```dart
  /// SnackbarAction(
  ///   label: 'Повторить',
  ///   onPressed: () => retryOperation(),
  ///   textColor: Colors.yellow,
  /// )
  /// ```
  ///
  /// ---
  ///
  /// Creates new action for snackbar message.
  ///
  /// Required parameters:
  /// - [label] - button text
  /// - [onPressed] - tap handler
  ///
  /// Example:
  /// ```dart
  /// SnackbarAction(
  ///   label: 'Retry',
  ///   onPressed: () => retryOperation(),
  ///   textColor: Colors.yellow,
  /// )
  /// ```
  const SnackbarAction({
    required this.label,
    required this.onPressed,
    this.textColor,
  });
}

/// Базовая реализация [SnackbarMessage] для простых уведомлений.
///
/// Предоставляет конкретную реализацию абстрактного класса [SnackbarMessage]
/// без дополнительной логики. Подходит для создания обычных уведомлений,
/// когда не требуется специализированное поведение.
///
/// Для более сложных сценариев рекомендуется создавать специализированные
/// классы (например, NetworkSnackbarMessage, SyncSnackbarMessage).
///
/// ---
///
/// Basic [SnackbarMessage] implementation for simple notifications.
///
/// Provides concrete implementation of abstract [SnackbarMessage] class
/// without additional logic. Suitable for creating regular notifications
/// when specialized behavior is not required.
///
/// For more complex scenarios, it's recommended to create specialized
/// classes (e.g., NetworkSnackbarMessage, SyncSnackbarMessage).
class BasicSnackbarMessage extends SnackbarMessage {
  /// Создает базовое снэкбар-сообщение.
  ///
  /// Принимает все те же параметры, что и родительский класс,
  /// и передает их без изменений. Используется как простая
  /// конкретная реализация для обычных уведомлений.
  ///
  /// Пример использования:
  /// ```dart
  /// final message = BasicSnackbarMessage(
  ///   id: 'welcome',
  ///   message: 'Добро пожаловать в приложение!',
  ///   type: SnackbarType.info,
  ///   duration: Duration(seconds: 3),
  /// );
  /// ```
  ///
  /// ---
  ///
  /// Creates basic snackbar message.
  ///
  /// Accepts all same parameters as parent class
  /// and passes them unchanged. Used as simple
  /// concrete implementation for regular notifications.
  ///
  /// Usage example:
  /// ```dart
  /// final message = BasicSnackbarMessage(
  ///   id: 'welcome',
  ///   message: 'Welcome to the app!',
  ///   type: SnackbarType.info,
  ///   duration: Duration(seconds: 3),
  /// );
  /// ```
  const BasicSnackbarMessage({
    required super.id,
    required super.message,
    required super.type,
    super.duration,
    super.icon,
    super.priority,
    super.persistent,
    super.actions,
    super.groupId,
  });
}
