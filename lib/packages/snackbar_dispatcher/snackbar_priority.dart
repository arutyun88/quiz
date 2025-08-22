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
enum SnackbarPriority {
  /// Low priority (value 0).
  /// For secondary information that can be missed.
  low(value: 0),

  /// Normal priority (value 1).
  /// For standard notifications and informational messages.
  normal(value: 1),

  /// High priority (value 2).
  /// For important notifications requiring user attention.
  high(value: 2),

  /// Critical priority (value 3).
  /// For critical errors and situations requiring immediate action.
  critical(value: 3);

  const SnackbarPriority({
    required this.value,
  });

  /// Numeric priority value for comparison and sorting.
  /// Higher value means higher priority.
  final int value;

  /// Converts numeric value to SnackbarPriority.
  /// 
  /// Throws [StateError] if the value is not valid.
  /// Valid values are: 0, 1, 2, 3
  static SnackbarPriority fromValue(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}
