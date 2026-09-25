class InboxNotificationDto {
  const InboxNotificationDto({
    required this.id,
    required this.type,
    required this.payload,
    required this.destination,
    required this.isRead,
    required this.createdAt,
  });

  factory InboxNotificationDto.fromJson(Map<String, dynamic> json) =>
      InboxNotificationDto(
        id: json['id'] as String,
        type: json['type'] as String,
        payload: Map<String, dynamic>.from(
          json['payload'] as Map? ?? const <String, dynamic>{},
        ),
        destination: json['destination'] as String?,
        isRead: json['read'] as bool? ?? false,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );

  final String id;
  final String type;
  final Map<String, dynamic> payload;
  final String? destination;
  final bool isRead;
  final DateTime createdAt;
}
