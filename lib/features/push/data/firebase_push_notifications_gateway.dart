import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/device_id_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/features/observability/domain/logger.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/features/push/domain/repository/push_repository.dart';
import 'package:quiz/gen/strings.g.dart';

@LazySingleton(as: PushNotificationsGateway)
final class FirebasePushNotificationsGateway
    implements PushNotificationsGateway {
  FirebasePushNotificationsGateway({
    required FirebaseMessaging messaging,
    required PushRepository repository,
    required DeviceIdService deviceIdService,
    required SettingsLocalStorageService settingsStorage,
  })  : _messaging = messaging,
        _repository = repository,
        _installationId = deviceIdService.deviceId,
        _settingsStorage = settingsStorage;

  final FirebaseMessaging _messaging;
  final PushRepository _repository;
  final String _installationId;
  final SettingsLocalStorageService _settingsStorage;
  final StreamController<PushDestination> _openedDestinations =
      StreamController.broadcast();
  final StreamController<PushMessage> _receivedMessages =
      StreamController.broadcast();

  StreamSubscription<String>? _tokenSubscription;
  StreamSubscription<RemoteMessage>? _openedSubscription;
  StreamSubscription<RemoteMessage>? _foregroundSubscription;
  Timer? _registrationRetryTimer;
  String? _pendingRegistrationToken;
  int _registrationRetryAttempt = 0;
  bool _active = false;
  bool _initialMessageRead = false;

  @override
  Stream<PushDestination> get openedDestinations => _openedDestinations.stream;

  @override
  Stream<PushMessage> get receivedMessages => _receivedMessages.stream;

  @override
  Future<PushPermissionStatus> permissionStatus() async => _mapPermission(
      (await _messaging.getNotificationSettings()).authorizationStatus);

  @override
  Future<PushPermissionStatus> requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
    final status = _mapPermission(settings.authorizationStatus);
    if (status == PushPermissionStatus.authorized) {
      await activate();
    }
    return status;
  }

  @override
  Future<void> activate() async {
    _active = true;
    _tokenSubscription ??= _messaging.onTokenRefresh.listen(
      (token) => unawaited(_register(token)),
      onError: (Object error, StackTrace stackTrace) => log.error(
        'Push token refresh failed',
        error: error,
        stackTrace: stackTrace,
        data: {'operation': 'push_token_refresh'},
      ),
    );
    _openedSubscription ??= FirebaseMessaging.onMessageOpenedApp.listen(
      _emitDestination,
    );
    _foregroundSubscription ??= FirebaseMessaging.onMessage.listen(
      _emitMessage,
    );

    if (!_initialMessageRead) {
      _initialMessageRead = true;
      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) _emitDestination(initialMessage);
    }

    if (await permissionStatus() != PushPermissionStatus.authorized) return;
    if (Platform.isIOS && await _messaging.getAPNSToken() == null) return;

    final token = await _messaging.getToken();
    if (token != null) await _register(token);
  }

  @override
  Future<void> unregister() async {
    final result = await _repository.unregisterDevice(_installationId);
    if (result case ResultFailed(error: final failure)) {
      log.failure(
        failure,
        failure,
        stackTrace: StackTrace.current,
        message: 'Push device unregister failed',
        extra: {'operation': 'push_device_unregister'},
      );
    }
    await deactivate();
  }

  @override
  Future<void> deactivate() async {
    _active = false;
    _pendingRegistrationToken = null;
    _registrationRetryAttempt = 0;
    _registrationRetryTimer?.cancel();
    _registrationRetryTimer = null;
    await _tokenSubscription?.cancel();
    _tokenSubscription = null;
    await _openedSubscription?.cancel();
    _openedSubscription = null;
    await _foregroundSubscription?.cancel();
    _foregroundSubscription = null;
  }

  Future<void> _register(String token) async {
    if (!_active) return;
    _pendingRegistrationToken = token;
    _registrationRetryTimer?.cancel();
    _registrationRetryTimer = null;
    final result = await _repository.registerDevice(
      installationId: _installationId,
      registrationToken: token,
      platform: Platform.isIOS ? 'IOS' : 'ANDROID',
      locale: _settingsStorage.fetchLocale() ??
          LocaleSettings.currentLocale.languageCode,
    );
    if (!_active || _pendingRegistrationToken != token) return;
    switch (result) {
      case ResultOk():
        _registrationRetryAttempt = 0;
        log.info(
          'Push device registered'.attach({
            'operation': 'push_device_register',
            'platform': Platform.isIOS ? 'IOS' : 'ANDROID',
          }),
        );
      case ResultFailed(error: final failure):
        log.failure(
          failure,
          failure,
          stackTrace: StackTrace.current,
          message: 'Push device registration failed',
          extra: {
            'operation': 'push_device_register',
            'retry_attempt': _registrationRetryAttempt,
          },
        );
        _scheduleRegistrationRetry(token);
    }
  }

  void _scheduleRegistrationRetry(String token) {
    const delays = <Duration>[
      Duration(seconds: 5),
      Duration(seconds: 15),
      Duration(minutes: 1),
      Duration(minutes: 5),
    ];
    final index = _registrationRetryAttempt.clamp(0, delays.length - 1);
    _registrationRetryAttempt++;
    _registrationRetryTimer = Timer(delays[index], () {
      if (_active && _pendingRegistrationToken == token) {
        unawaited(_register(token));
      }
    });
  }

  void _emitDestination(RemoteMessage message) {
    final destination = resolvePushOpenDestination(message.data);
    log.info(
      'Push opened'.attach({
        'message_id': message.messageId,
        'type': message.data['type'],
        'destination': message.data['destination'],
      }),
    );
    if (destination != null) _openedDestinations.add(destination);
  }

  void _emitMessage(RemoteMessage message) {
    log.info(
      'Push received in foreground'.attach({
        'message_id': message.messageId,
        'type': message.data['type'],
        'destination': message.data['destination'],
      }),
    );
    final notification = message.notification;
    final title = notification?.title ?? message.data['title']?.toString();
    final body = notification?.body ?? message.data['body']?.toString();
    if (title == null && body == null) return;
    _receivedMessages.add(
      PushMessage(
        title: title ?? 'QUIZ',
        body: body ?? '',
        destination: resolvePushOpenDestination(message.data),
      ),
    );
  }

  static PushPermissionStatus _mapPermission(AuthorizationStatus status) =>
      switch (status) {
        AuthorizationStatus.authorized ||
        AuthorizationStatus.provisional =>
          PushPermissionStatus.authorized,
        AuthorizationStatus.denied => PushPermissionStatus.denied,
        AuthorizationStatus.notDetermined => PushPermissionStatus.notDetermined,
      };
}
