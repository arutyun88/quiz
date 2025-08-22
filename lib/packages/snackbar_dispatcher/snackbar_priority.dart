/// Enumeration of snackbar message priorities.
///
/// Determines message importance and affects:
/// - Display order (high priority above others)
/// - Behavior when message limits are exceeded
///
/// Examples:
/// ```dart
/// // Compare priorities
/// if (message1.priority.value > message2.priority.value) {
///   // message1 has higher priority
/// }
/// 
/// // Sort by priority
/// messages.sort((a, b) => a.priority.value.compareTo(b.priority.value));
/// ```
///
/// ---
///
/// Перечисление приоритетов сообщений snackbar.
///
/// Определяет важность сообщения и влияет на:
/// - Порядок отображения (высокий приоритет выше остальных)
/// - Поведение при превышении лимитов сообщений
///
/// Примеры:
/// ```dart
/// // Сравнение приоритетов
/// if (message1.priority.value > message2.priority.value) {
///   // message1 имеет более высокий приоритет
/// }
/// 
/// // Сортировка по приоритету
/// messages.sort((a, b) => a.priority.value.compareTo(b.priority.value));
/// ```
enum SnackbarPriority {
  /// Low priority (value 0).
  /// For secondary information that can be missed.
  ///
  /// ---
  ///
  /// Низкий приоритет (значение 0).
  /// Для второстепенной информации, которую можно пропустить.
  low(value: 0),

  /// Normal priority (value 1).
  /// For standard notifications and informational messages.
  ///
  /// ---
  ///
  /// Обычный приоритет (значение 1).
  /// Для стандартных уведомлений и информационных сообщений.
  normal(value: 1),

  /// High priority (value 2).
  /// For important notifications requiring user attention.
  ///
  /// ---
  ///
  /// Высокий приоритет (значение 2).
  /// Для важных уведомлений, требующих внимания пользователя.
  high(value: 2),

  /// Critical priority (value 3).
  /// For critical errors and situations requiring immediate action.
  ///
  /// ---
  ///
  /// Критический приоритет (значение 3).
  /// Для критических ошибок и ситуаций, требующих немедленных действий.
  critical(value: 3);

  const SnackbarPriority({
    required this.value,
  });

  /// Numeric priority value for comparison and sorting.
  /// Higher value means higher priority.
  ///
  /// ---
  ///
  /// Числовое значение приоритета для сравнения и сортировки.
  /// Более высокое значение означает более высокий приоритет.
  final int value;

  /// Converts numeric value to SnackbarPriority.
  /// 
  /// Throws [StateError] if the value is not valid.
  /// Valid values are: 0, 1, 2, 3
  ///
  /// ---
  ///
  /// Преобразует числовое значение в SnackbarPriority.
  /// 
  /// Выбрасывает [StateError], если значение недопустимо.
  /// Допустимые значения: 0, 1, 2, 3
  static SnackbarPriority fromValue(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}
