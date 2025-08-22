/// Represents an action button that can be displayed in a snackbar.
///
/// SnackbarAction provides an interactive element within snackbar messages,
/// allowing users to perform actions without dismissing the notification.
/// Common use cases include:
/// - Confirming actions (e.g., "Undo" for deleted items)
/// - Navigation to related screens
/// - Dismissing or acknowledging notifications
/// - Performing quick operations
///
/// Example usage:
/// ```dart
/// SnackbarAction(
///   label: 'Undo',
///   onPressed: () => _undoDelete(),
/// )
/// ```
class SnackbarAction {
  /// Action button text.
  /// 
  /// The text displayed on the action button. Should be concise
  /// and clearly indicate what action will be performed.
  /// Recommended length: 1-3 words (e.g., "Undo", "View", "Retry").
  final String label;

  /// Action button tap handler.
  ///
  /// Called when user taps the button. Can perform any actions:
  /// - Navigation to other screens
  /// - API calls and data operations
  /// - App state changes
  /// - Dismissing the snackbar
  /// - Custom business logic
  ///
  /// Note: This callback is executed in the context where the snackbar
  /// was created, so ensure proper error handling and state management.
  final Function() onPressed;

  /// Creates a snackbar action button.
  ///
  /// [label] must not be null or empty.
  /// [onPressed] must not be null.
  const SnackbarAction({
    required this.label,
    required this.onPressed,
  });
}
