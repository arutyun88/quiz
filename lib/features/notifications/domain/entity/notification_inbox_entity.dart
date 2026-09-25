enum InboxNotificationType { achievementUnlocked, levelUp, system, unknown }

enum InboxNotificationDestination {
  home,
  rating,
  profile,
  achievements,
  review,
  none,
}

class NotificationInboxEntity {
  const NotificationInboxEntity({
    required this.items,
    required this.total,
    required this.offset,
    required this.limit,
  });

  final List<InboxNotificationEntity> items;
  final int total;
  final int offset;
  final int limit;
}

class InboxNotificationEntity {
  const InboxNotificationEntity({
    required this.id,
    required this.type,
    required this.payload,
    required this.destination,
    required this.isRead,
    required this.createdAt,
  });

  final String id;
  final InboxNotificationType type;
  final Map<String, dynamic> payload;
  final InboxNotificationDestination destination;
  final bool isRead;
  final DateTime createdAt;

  InboxNotificationEntity copyWith({bool? isRead}) => InboxNotificationEntity(
        id: id,
        type: type,
        payload: payload,
        destination: destination,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt,
      );
}
