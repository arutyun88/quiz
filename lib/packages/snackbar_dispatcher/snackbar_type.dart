/// Enumeration of snackbar message types.
///
/// Each type represents a category of message with specific semantic meaning.
///
/// ---
///
/// Перечисление типов сообщений snackbar.
///
/// Каждый тип представляет категорию сообщения с определенным семантическим значением.
enum SnackbarType {
  /// Information message.
  /// Used for neutral information, hints, statuses.
  ///
  /// ---
  ///
  /// Информационное сообщение.
  /// Используется для нейтральной информации, подсказок, статусов.
  info,

  /// Success message.
  /// Used to confirm successful operations.
  ///
  /// ---
  ///
  /// Сообщение об успехе.
  /// Используется для подтверждения успешных операций.
  success,

  /// Warning message.
  /// Used for potential issues that don't block functionality.
  ///
  /// ---
  ///
  /// Предупреждающее сообщение.
  /// Используется для потенциальных проблем, которые не блокируют функциональность.
  warning,

  /// Error message.
  /// Used for critical errors and problems.
  ///
  /// ---
  ///
  /// Сообщение об ошибке.
  /// Используется для критических ошибок и проблем.
  error,

  /// Processing message.
  /// Used to display time-consuming processes.
  ///
  /// ---
  ///
  /// Сообщение о процессе.
  /// Используется для отображения длительных процессов.
  processing,
}
