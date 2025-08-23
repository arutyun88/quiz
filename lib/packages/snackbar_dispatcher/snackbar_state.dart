part of 'snackbar_controller.dart';

/// State for managing snackbars.
/// Stores a list of messages and their last shown times.
///
/// ---
///
/// Состояние для управления snackbar.
/// Хранит список сообщений и время их последнего показа.
class SnackbarState {
  /// List of messages to display
  ///
  /// ---
  ///
  /// Список сообщений для отображения
  final List<SnackbarMessage> messages;

  /// Last shown times of messages (key - message ID).
  /// Used to prevent showing duplicate messages too frequently
  ///
  /// ---
  ///
  /// Время последнего показа сообщений (ключ - ID сообщения).
  /// Используется для предотвращения слишком частого показа дублирующихся сообщений
  final Map<String, DateTime> lastShownTimes;

  SnackbarState({
    this.messages = const [],
    this.lastShownTimes = const {},
  });

  SnackbarState copyWith({
    List<SnackbarMessage>? messages,
    Map<String, DateTime>? lastShownTimes,
  }) {
    return SnackbarState(
      messages: messages ?? this.messages,
      lastShownTimes: lastShownTimes ?? this.lastShownTimes,
    );
  }

  /// Returns messages sorted by priority and time.
  ///
  /// Sorting algorithm:
  /// 1. By priority (critical → high → normal → low)
  /// 2. By insertion time (newer messages above older ones)
  ///
  /// This ensures important messages are displayed at the top of the list.
  ///
  /// ---
  ///
  /// Возвращает сообщения, отсортированные по приоритету и времени.
  ///
  /// Алгоритм сортировки:
  /// 1. По приоритету (критический → высокий → обычный → низкий)
  /// 2. По времени добавления (новые сообщения выше старых)
  ///
  /// Это гарантирует, что важные сообщения отображаются вверху списка.
  List<SnackbarMessage> get sortedMessages {
    final sorted = List<SnackbarMessage>.from(messages);
    sorted.sort((a, b) {
      // First by priority (descending)
      // Сначала по приоритету (убывающий)
      final priorityCompare = b.priority.value.compareTo(a.priority.value);
      if (priorityCompare != 0) return priorityCompare;

      // Then by insertion time (newer first)
      // Затем по времени добавления (новые сверху)
      return messages.indexOf(b).compareTo(messages.indexOf(a));
    });
    return sorted;
  }

  /// Groups messages by group identifier.
  ///
  /// Returns a map where:
  /// - Key: message groupId (can be null for ungrouped messages)
  /// - Value: list of messages in this group, sorted by priority
  ///
  /// Useful for:
  /// - Managing related notifications (network, sync)
  /// - Group message hiding
  /// - Limiting messages count per group
  ///
  /// ---
  ///
  /// Группирует сообщения по идентификатору группы.
  ///
  /// Возвращает карту, где:
  /// - Ключ: groupId сообщения (может быть null для негруппированных сообщений)
  /// - Значение: список сообщений в этой группе, отсортированный по приоритету
  ///
  /// Полезно для:
  /// - Управления связанными уведомлениями (сеть, синхронизация)
  /// - Скрытия сообщений группы
  /// - Ограничения количества сообщений на группу
  Map<String?, List<SnackbarMessage>> get groupedMessages {
    final Map<String?, List<SnackbarMessage>> groups = {};
    for (final message in sortedMessages) {
      final group = message.groupId;
      groups[group] = [...(groups[group] ?? []), message];
    }
    return groups;
  }
}
