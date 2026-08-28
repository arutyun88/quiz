import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';
import 'package:quiz/app/core/services/remote_config_defaults.dart';

void main() {
  late _MockFirebaseRemoteConfig remoteConfig;
  late FirebaseRemoteConfigService service;

  setUp(() {
    remoteConfig = _MockFirebaseRemoteConfig();
    service = FirebaseRemoteConfigService(
      remoteConfig,
      loadDefaults: () async => emergencyRemoteConfigDefaults,
    );
    when(() => remoteConfig.setDefaults(any())).thenAnswer((_) async {});
    when(() => remoteConfig.ensureInitialized()).thenAnswer((_) async {});
    when(() => remoteConfig.activate()).thenAnswer((_) async => true);
    when(() => remoteConfig.fetchAndActivate()).thenAnswer((_) async => true);
    when(() => remoteConfig.onConfigUpdated)
        .thenAnswer((_) => const Stream.empty());
    when(() => remoteConfig.getInt(any())).thenReturn(3);
    when(() => remoteConfig.getString(any())).thenReturn('');
  });

  test('installs safe defaults and activates cached values before fetching',
      () async {
    await service.init();
    await Future<void>.delayed(Duration.zero);

    final defaults = verify(() => remoteConfig.setDefaults(captureAny()))
        .captured
        .single as Map<String, dynamic>;
    expect(defaults, {
      'guest_demo_question_count': 3,
      'app_launch_date': '',
    });
    verify(() => remoteConfig.activate()).called(1);
    verify(() => remoteConfig.fetchAndActivate()).called(1);
    expect(service.source, MobileRemoteConfigSource.firebase);
    expect(service.status, MobileRemoteConfigStatus.success);
    expect(service.syncDate, isNotNull);
  });

  test('bounds the guest demo without exposing arbitrary config keys', () {
    when(() => remoteConfig.getInt('guest_demo_question_count')).thenReturn(7);
    expect(service.guestDemoQuestionCount, 7);

    when(() => remoteConfig.getInt('guest_demo_question_count')).thenReturn(0);
    expect(service.guestDemoQuestionCount, 3);

    when(() => remoteConfig.getInt('guest_demo_question_count')).thenReturn(11);
    expect(service.guestDemoQuestionCount, 3);
  });

  test('accepts only a real ISO date-only launch value', () {
    when(() => remoteConfig.getString('app_launch_date'))
        .thenReturn('2026-08-29');
    expect(service.appLaunchDate, DateTime.utc(2026, 8, 29));

    when(() => remoteConfig.getString('app_launch_date'))
        .thenReturn('2026-02-31');
    expect(service.appLaunchDate, isNull);

    when(() => remoteConfig.getString('app_launch_date'))
        .thenReturn('2026-08-29T12:00:00Z');
    expect(service.appLaunchDate, isNull);
  });

  test('bundled asset contains the defaults used by the mobile client',
      () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final defaults = await loadBundledRemoteConfigDefaults();

    expect(defaults['guest_demo_question_count'], 3);
    expect(defaults['app_launch_date'], '');
  });

  test('keeps bundled values when Firebase initialization and fetch fail',
      () async {
    service = FirebaseRemoteConfigService(
      remoteConfig,
      loadDefaults: () async => const {
        'guest_demo_question_count': 6,
        'app_launch_date': '',
      },
    );
    when(() => remoteConfig.setDefaults(any()))
        .thenThrow(StateError('firebase unavailable'));
    when(() => remoteConfig.fetchAndActivate())
        .thenThrow(StateError('firebase unavailable'));
    when(() => remoteConfig.lastFetchStatus)
        .thenReturn(RemoteConfigFetchStatus.failure);
    when(() => remoteConfig.getInt(any())).thenReturn(0);

    await service.init();
    await Future<void>.delayed(Duration.zero);

    expect(service.guestDemoQuestionCount, 6);
    expect(service.source, MobileRemoteConfigSource.bundledDefaults);
    expect(service.status, MobileRemoteConfigStatus.failure);
  });
}

class _MockFirebaseRemoteConfig extends Mock implements FirebaseRemoteConfig {}
