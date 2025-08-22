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
///
/// ---
///
/// Представляет кнопку действия, которая может отображаться в snackbar.
///
/// SnackbarAction предоставляет интерактивный элемент в сообщениях snackbar,
/// позволяя пользователям выполнять действия без закрытия уведомления.
/// Типичные случаи использования:
/// - Подтверждение действий (например, "Отменить" для удаленных элементов)
/// - Навигация к связанным экранам
/// - Закрытие или подтверждение уведомлений
/// - Выполнение быстрых операций
///
/// Пример использования:
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
  ///
  /// ---
  ///
  /// Текст кнопки действия.
  /// 
  /// Текст, отображаемый на кнопке действия. Должен быть кратки
  /// и четко указывать, какое действие будет выполнено.
  /// Рекомендуемая длина: 1-3 слова (например, "Отменить", "Просмотр", "Повторить").
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
  ///
  /// ---
  ///
  /// Обработчик нажатия кнопки действия.
  ///
  /// Вызывается при нажатии пользователем кнопки. Может выполнять любые действия:
  /// - Навигация к другим экранам
  /// - API вызовы и операции с данными
  /// - Изменения состояния приложения
  /// - Закрытие snackbar
  /// - Пользовательская бизнес-логика
  ///
  /// Примечание: Этот callback выполняется в контексте, где был создан snackbar,
  /// поэтому обеспечьте правильную обработку ошибок и управление состоянием.
  final Function() onPressed;

  /// Creates a snackbar action button.
  ///
  /// [label] must not be null or empty.
  /// [onPressed] must not be null.
  ///
  /// ---
  ///
  /// Создает кнопку действия snackbar.
  ///
  /// [label] не должен быть null или пустым.
  /// [onPressed] не должен быть null.
  const SnackbarAction({
    required this.label,
    required this.onPressed,
  });
}
