import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/device_id_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/features/observability/domain/app_error_reporter.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/features/push/domain/repository/push_repository.dart';

@LazySingleton(as: PushNotificationsGateway)
final class FirebasePushNotificationsGateway
    implements PushNotificationsGateway {
  FirebasePushNotificationsGateway({
    required FirebaseMessaging messaging,
    required PushRepository repository,
    required DeviceIdService deviceIdService,
    required SettingsLocalStorageService settingsStorage,
    required AppErrorReporter errorReporter,
  })  : _messaging = messaging,
        _repository = repository,
        _installationId = deviceIdService.deviceId,
        _settingsStorage = settingsStorage,
        _errorReporter = errorReporter;

  final FirebaseMessaging _messaging;
  final PushRepository _repository;
  final String _installationId;
  final SettingsLocalStorageService _settingsStorage;
  final AppErrorReporter _errorReporter;
  final StreamController<PushDestination> _openedDestinations =
      StreamController.broadcast();

  StreamSubscription<String>? _tokenSubscription;
  StreamSubscription<RemoteMessage>? _openedSubscription;
  bool _active = false;
  bool _initialMessageRead = false;

  @override
  Stream<PushDestination> get openedDestinations => _openedDestinations.stream;

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
      onError: (Object error, StackTrace stackTrace) => unawaited(
        _errorReporter.captureException(
          error,
          stackTrace,
          operation: 'push_token_refresh',
        ),
      ),
    );
    _openedSubscription ??= FirebaseMessaging.onMessageOpenedApp.listen(
      _emitDestination,
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
      await _errorReporter.captureException(
        failure,
        StackTrace.current,
        operation: 'push_device_unregister',
      );
    }
    await deactivate();
  }

  @override
  Future<void> deactivate() async {
    _active = false;
    await _tokenSubscription?.cancel();
    _tokenSubscription = null;
    await _openedSubscription?.cancel();
    _openedSubscription = null;
  }

  Future<void> _register(String token) async {
    if (!_active) return;
    final result = await _repository.registerDevice(
      installationId: _installationId,
      registrationToken: token,
      platform: Platform.isIOS ? 'IOS' : 'ANDROID',
      locale: _settingsStorage.fetchLocale(),
    );
    if (result case ResultFailed(error: final failure)) {
      await _errorReporter.captureException(
        failure,
        StackTrace.current,
        operation: 'push_device_register',
      );
    }
  }

  void _emitDestination(RemoteMessage message) {
    final destination = parsePushDestination(message.data);
    if (destination != null) _openedDestinations.add(destination);
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
