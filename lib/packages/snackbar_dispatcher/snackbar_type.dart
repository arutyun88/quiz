/// Enumeration of snackbar message types.
///
/// Each type represents a category of message with specific semantic meaning.
enum SnackbarType {
  /// Information message.
  /// Used for neutral information, hints, statuses.
  info,

  /// Success message.
  /// Used to confirm successful operations.
  success,

  /// Warning message.
  /// Used for potential issues that don't block functionality.
  warning,

  /// Error message.
  /// Used for critical errors and problems.
  error,

  /// Processing message.
  /// Used to display time-consuming processes.
  processing,
}
