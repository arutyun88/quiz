enum PushPermissionStatus { notDetermined, denied, authorized }

enum PushDestination { home, dailyEdition, rating, review, notifications }

class PushMessage {
  const PushMessage({
    required this.title,
    required this.body,
    required this.destination,
  });

  final String title;
  final String body;
  final PushDestination? destination;
}

PushDestination? parsePushDestination(Map<String, dynamic> data) =>
    switch (data['destination']) {
      'HOME' => PushDestination.home,
      'DAILY_EDITION' => PushDestination.dailyEdition,
      'RATING' => PushDestination.rating,
      'REVIEW' => PushDestination.review,
      _ => null,
    };

PushDestination? resolvePushOpenDestination(Map<String, dynamic> data) {
  final destination = data['destination'];
  if (destination == null ||
      (destination is String && destination.trim().isEmpty)) {
    return PushDestination.notifications;
  }
  return parsePushDestination(data);
}

abstract interface class PushNotificationsGateway {
  Stream<PushDestination> get openedDestinations;

  Stream<PushMessage> get receivedMessages;

  Future<PushPermissionStatus> permissionStatus();

  Future<PushPermissionStatus> requestPermission();

  Future<void> activate();

  Future<void> unregister();

  Future<void> deactivate();
}
