import 'package:flutter/material.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_message.dart';

part 'snackbar_state.dart';

/// Controller for managing snackbars.
///
/// Main features:
/// - Show and hide snackbars
/// - Message priority management
/// - Spam prevention for duplicate messages
/// - Limit concurrent message count
/// - Group related notifications
///
/// Uses [ChangeNotifier] pattern for reactive state management.
///
/// ---
///
/// Контроллер для управления snackbar.
///
/// Основные возможности:
/// - Показ и скрытие snackbar
/// - Управление приоритетом сообщений
/// - Предотвращение спама для дублирующихся сообщений
/// - Ограничение количества одновременных сообщений
/// - Группировка связанных уведомлений
///
/// Использует паттерн [ChangeNotifier] для реактивного управления состоянием.
class SnackbarController extends ChangeNotifier {
  SnackbarState _state = SnackbarState(
    messages: [],
    lastShownTimes: {},
  );

  /// Current snackbar state (read-only).
  ///
  /// ---
  ///
  /// Текущее состояние snackbar (только для чтения).
  SnackbarState get state => SnackbarState(
        messages: List.unmodifiable(_state.messages),
        lastShownTimes: Map.unmodifiable(_state.lastShownTimes),
      );

  /// Settings for message spam prevention.
  ///
  /// - [_spamPreventionDuration] - minimum interval between showing identical messages
  /// - [_maxMessagesPerGroup] - maximum messages per group
  /// - [_maxTotalMessages] - total maximum messages on screen
  ///
  /// ---
  ///
  /// - [_spamPreventionDuration] - минимальный интервал между показами одинаковых сообщений
  /// - [_maxMessagesPerGroup] - максимальное количество сообщений в группе
  /// - [_maxTotalMessages] - общее максимальное количество сообщений на экране
  static const Duration _spamPreventionDuration = Duration(seconds: 2);
  static const int _maxMessagesPerGroup = 3;
  static const int _maxTotalMessages = 10;

  /// Shows a snackbar message to the user.
  ///
  /// Adds the message to the internal state and notifies listeners about the change.
  /// Implements spam prevention, message replacement, and limits management.
  ///
  /// Features:
  /// - Spam prevention (2-second interval between identical messages)
  /// - Message replacement (same ID messages are replaced)
  /// - Group limits (max 3 messages per group)
  /// - Total limits (max 10 messages total)
  /// - Priority-based cleanup (low-priority messages removed first)
  ///
  /// Parameters:
  /// - [message] - the message to display
  ///
  /// ---
  ///
  /// Показывает snackbar сообщение пользователю.
  ///
  /// Добавляет сообщение во внутреннее состояние и уведомляет слушателей об изменении.
  /// Реализует защиту от спама, замену сообщений и управление лимитами.
  ///
  /// Возможности:
  /// - Защита от спама (2-секундный интервал между одинаковыми сообщениями)
  /// - Замена сообщений (сообщения с одинаковым ID заменяются)
  /// - Лимиты групп (максимум 3 сообщения в группе)
  /// - Общие лимиты (максимум 10 сообщений всего)
  /// - Очистка по приоритету (низкоприоритетные сообщения удаляются первыми)
  ///
  /// Параметры:
  /// - [message] - сообщение для отображения
  void showSnackbar(SnackbarMessage message) {
    if (_isSpam(message)) {
      return;
    }

    // Remove previous message with same id
    // Удаляем предыдущее сообщение с тем же id
    var filteredMessages = _state.messages.where((m) => m.id != message.id).toList();

    // Limit messages count per group
    // Ограничиваем количество сообщений в группе
    if (message.groupId != null) {
      final groupMessages = filteredMessages.where((m) => m.groupId == message.groupId).toList();
      if (groupMessages.length >= _maxMessagesPerGroup) {
        // Remove oldest message in group
        // Удаляем самое старое сообщение из группы
        final oldestInGroup = groupMessages.first;
        filteredMessages.removeWhere((m) => m.id == oldestInGroup.id);
      }
    }

    // Limit total messages
    // Ограничиваем общее количество сообщений
    if (filteredMessages.length >= _maxTotalMessages) {
      // Remove oldest low-priority messages
      // Удаляем самые старые сообщения с низким приоритетом
      filteredMessages.sort((a, b) => a.priority.value.compareTo(b.priority.value));
      filteredMessages = filteredMessages.skip(1).toList();
    }

    // Add new message and update shown time
    // Добавляем новое сообщение и обновляем время показа
    final newLastShownTimes = Map<String, DateTime>.from(_state.lastShownTimes);
    newLastShownTimes[message.id] = DateTime.now();

    _state = _state.copyWith(
      messages: [...filteredMessages, message],
      lastShownTimes: newLastShownTimes,
    );

    notifyListeners();
  }

  /// Hides snackbar by identifier.
  ///
  /// Removes message with specified ID from active messages list.
  /// If message is not found, method does nothing.
  ///
  /// Parameters:
  /// - [id] - identifier of message to hide
  ///
  /// ---
  ///
  /// Скрывает snackbar по идентификатору.
  ///
  /// Удаляет сообщение с указанным ID из списка активных сообщений.
  /// Если сообщение не найдено, метод ничего не делает.
  ///
  /// Параметры:
  /// - [id] - идентификатор сообщения для скрытия
  void hideSnackbar(String id) {
    final filteredMessages = _state.messages.where((m) => m.id != id).toList();
    _state = _state.copyWith(messages: filteredMessages);
    notifyListeners();
  }

  /// Removes all messages with specified groupId from active messages list.
  /// Useful for bulk hiding of related notifications
  /// (e.g., all network notifications or sync notifications).
  ///
  /// Parameters:
  /// - [groupId] - group identifier to hide
  ///
  /// ---
  ///
  /// Скрывает все снэкбары в указанной группе.
  ///
  /// Удаляет все сообщения с указанным groupId из списка активных сообщений.
  /// Полезно для массового скрытия связанных уведомлений
  /// (например, все сетевые уведомления или уведомления синхронизации).
  ///
  /// Параметры:
  /// - [groupId] - идентификатор группы для скрытия
  void hideGroup(String groupId) {
    final filteredMessages = _state.messages.where((m) => m.groupId != groupId).toList();
    _state = _state.copyWith(messages: filteredMessages);
    notifyListeners();
  }

  /// Clears all snackbars.
  ///
  /// Completely resets the state, removing all active messages and their display history.
  /// Used for complete interface cleanup.
  ///
  /// ---
  ///
  /// Очищает все снэкбары.
  ///
  /// Полностью сбрасывает состояние, удаляя все активные сообщения и историю их показа.
  /// Используется для полной очистки интерфейса.
  void clearAll() {
    _state = const SnackbarState();
    notifyListeners();
  }

  /// Clears all non-persistent snackbars, keeping only persistent ones.
  ///
  /// This method filters the current message list, removing all messages
  /// with `persistent = false` and keeping only those with `persistent = true`.
  ///
  /// Useful for:
  /// - Clearing temporary notifications when changing screens
  /// - Removing old messages after data updates
  /// - Periodic UI cleanup from accumulated notifications
  ///
  /// Persistent messages (downloads, critical errors) remain visible.
  ///
  /// ---
  ///
  /// Очищает все непостоянные (non-persistent) снэкбары, оставляя только персистентные.
  ///
  /// Метод фильтрует текущий список сообщений, удаляя все сообщения
  /// с `persistent = false` и сохраняя только те, у которых `persistent = true`.
  ///
  /// Полезно для:
  /// - Очистки временных уведомлений при смене экрана
  /// - Удаления старых сообщений после обновления данных
  /// - Периодической очистки UI от накопившихся уведомлений
  ///
  /// Персистентные сообщения (загрузки, критические ошибки) остаются видимыми.
  void clearNonPersistent() {
    final persistentMessages = _state.messages.where((m) => m.persistent).toList();
    _state = _state.copyWith(messages: persistentMessages);
    notifyListeners();
  }

  /// Checks if message is spam.
  ///
  /// Message is considered spam if it was shown too frequently
  /// (interval between shows is less than [_spamPreventionDuration]).
  ///
  /// Algorithm:
  /// 1. Gets last shown time of message by its ID
  /// 2. If message is shown for first time, returns false
  /// 3. Compares current time with last shown time
  /// 4. If difference is less than threshold, returns true (spam)
  ///
  /// Parameters:
  /// - [message] - message to check
  ///
  /// Returns: true if message is spam, false otherwise
  ///
  /// ---
  ///
  /// Проверяет, является ли сообщение спамом.
  ///
  /// Сообщение считается спамом, если оно показано слишком часто
  /// (интервал между показами меньше [_spamPreventionDuration]).
  ///
  /// Алгоритм:
  /// 1. Получает время последнего показа сообщения по его ID
  /// 2. Если сообщение показано впервые, возвращает false
  /// 3. Сравнивает текущее время с временем последнего показа
  /// 4. Если разница меньше порога, возвращает true (спам)
  ///
  /// Параметры:
  /// - [message] - сообщение для проверки
  ///
  /// Возвращает: true, если сообщение является спамом, false в противном случае
  bool _isSpam(SnackbarMessage message) {
    final lastShown = state.lastShownTimes[message.id];
    if (lastShown == null) return false;

    return DateTime.now().difference(lastShown) < _spamPreventionDuration;
  }
}
