enum PushPermissionStatus { notDetermined, denied, authorized }

enum PushDestination { home, dailyEdition, rating, review }

PushDestination? parsePushDestination(Map<String, dynamic> data) =>
    switch (data['destination']) {
      'HOME' => PushDestination.home,
      'DAILY_EDITION' => PushDestination.dailyEdition,
      'RATING' => PushDestination.rating,
      'REVIEW' => PushDestination.review,
      _ => null,
    };

abstract interface class PushNotificationsGateway {
  Stream<PushDestination> get openedDestinations;

  Future<PushPermissionStatus> permissionStatus();

  Future<PushPermissionStatus> requestPermission();

  Future<void> activate();

  Future<void> unregister();

  Future<void> deactivate();
}
