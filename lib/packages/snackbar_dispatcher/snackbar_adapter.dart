import 'package:quiz/packages/snackbar_dispatcher/snackbar_controller.dart';

/// Abstract base class for snackbar adapters.
///
/// Adapters allow connecting external data sources or events
/// to the snackbar system. They monitor app state changes
/// and automatically show corresponding notifications.
///
/// Typical adapter examples:
/// - Network adapter (monitors internet connection)
/// - Sync adapter (tracks data synchronization process)
/// - Update adapter (checks for new version availability)
/// - Auth adapter (reacts to login status changes)
///
/// ---
///
/// Абстрактный базовый класс для адаптеров snackbar.
///
/// Адаптеры позволяют подключать внешние источники данных или события
/// к системе snackbar. Они отслеживают изменения состояния приложения
/// и автоматически показывают соответствующие уведомления.
///
/// Типичные примеры адаптеров:
/// - Сетевой адаптер (отслеживает интернет-соединение)
/// - Адаптер синхронизации (отслеживает процесс синхронизации данных)
/// - Адаптер обновлений (проверяет доступность новых версий)
/// - Адаптер аутентификации (реагирует на изменения статуса входа)
abstract class SnackbarAdapter {
  /// Unique adapter identifier.
  ///
  /// Used for:
  /// - Adapter identification in system
  /// - Finding and managing specific adapters
  /// - Debugging and logging
  ///
  /// Must be unique within application.
  ///
  /// ---
  ///
  /// Уникальный идентификатор адаптера.
  ///
  /// Используется для:
  /// - Идентификации адаптера в системе
  /// - Поиска и управления конкретными адаптерами
  /// - Отладки и логирования
  ///
  /// Должен быть уникальным в рамках приложения.
  String get id;

  /// Initializes adapter with access to snackbar controller.
  ///
  /// Called once when adapter is registered in the system.
  /// Here adapter should:
  /// - Subscribe to necessary data sources
  /// - Set up change listeners
  /// - Initialize internal resources
  ///
  /// Parameters:
  /// - [controller] - snackbar controller for showing notifications
  ///
  /// Implementation example:
  /// ```dart
  /// @override
  /// void initialize(SnackbarController controller) {
  ///   _connectivitySubscription = Connectivity()
  ///     .onConnectivityChanged
  ///     .listen((result) {
  ///       if (result == ConnectivityResult.none) {
  ///         controller.showSnackbar(
  ///           BasicSnackbarMessage(
  ///             id: 'network_lost',
  ///             message: 'Connection lost',
  ///             type: SnackbarType.error,
  ///             priority: SnackbarPriority.critical,
  ///           ),
  ///         );
  ///       }
  ///     });
  /// }
  /// ```
  ///
  /// ---
  ///
  /// Инициализирует адаптер с доступом к контроллеру snackbar.
  ///
  /// Вызывается один раз при регистрации адаптера в системе.
  /// Здесь адаптер должен:
  /// - Подписаться на необходимые источники данных
  /// - Настроить слушатели изменений
  /// - Инициализировать внутренние ресурсы
  ///
  /// Параметры:
  /// - [controller] - контроллер snackbar для показа уведомлений
  ///
  /// Пример реализации:
  /// ```dart
  /// @override
  /// void initialize(SnackbarController controller) {
  ///   _connectivitySubscription = Connectivity()
  ///     .onConnectivityChanged
  ///     .listen((result) {
  ///       if (result == ConnectivityResult.none) {
  ///         controller.showSnackbar(
  ///           BasicSnackbarMessage(
  ///             id: 'network_lost',
  ///             message: 'Соединение потеряно',
  ///             type: SnackbarType.error,
  ///             priority: SnackbarPriority.critical,
  ///           ),
  ///         );
  ///       }
  ///     });
  /// }
  /// ```
  void initialize(SnackbarController controller);

  /// Releases adapter resources when it's removed.
  ///
  /// Called when adapter is no longer needed.
  ///
  /// Does nothing by default. Override in inheritors
  /// if special cleanup logic is required.
  ///
  /// Implementation example:
  /// ```dart
  /// @override
  /// void dispose() {
  ///   _networkSubscription?.cancel();
  ///   _timer?.cancel();
  ///   _saveState();
  /// }
  /// ```
  ///
  /// ---
  ///
  /// Освобождает ресурсы адаптера при его удалении.
  ///
  /// Вызывается, когда адаптер больше не нужен.
  ///
  /// По умолчанию ничего не делает. Переопределите в наследниках,
  /// если требуется специальная логика очистки.
  ///
  /// Пример реализации:
  /// ```dart
  /// @override
  /// void dispose() {
  ///   _networkSubscription?.cancel();
  ///   _timer?.cancel();
  ///   _saveState();
  /// }
  /// ```
  void dispose() {}
}
