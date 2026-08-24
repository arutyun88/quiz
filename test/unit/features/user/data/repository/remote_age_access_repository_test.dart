import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/data/converter/age_access_converter.dart';
import 'package:quiz/features/user/data/dto/age_access_dto.dart';
import 'package:quiz/features/user/data/repository/remote_age_access_repository.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemoteAgeAccessRepository repository;

  const status = AgeAccessEntity(
    adultEligibleAt: null,
    ageSignalSource: AgeSignalSource.unknown,
    storeAgeSignal: StoreAgeSignal.unknown,
    adultEligible: false,
    adultContentEnabled: false,
    confirmedAt: null,
    policyVersion: null,
    revokedAt: null,
    adultAccessOverride: AdultAccessOverride.none,
    currentPolicyVersion: 'adult-content-v1',
  );

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    client = MockApiClient();
    repository = RemoteAgeAccessRepository(client: client);
  });

  test('fetch uses the authoritative age-access endpoint', () async {
    when(
      () => client.get<AgeAccessEntity, DataDto<AgeAccessDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(status));

    await repository.fetch();

    verify(
      () => client.get<AgeAccessEntity, DataDto<AgeAccessDto>>(
        '/user/age-access',
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).called(1);
  });

  test('confirm sends the current policy version in camelCase', () async {
    when(
      () => client.post<AgeAccessEntity, DataDto<AgeAccessDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(status));

    await repository.confirm(policyVersion: 'adult-content-v2');

    final body = verify(
      () => client.post<AgeAccessEntity, DataDto<AgeAccessDto>>(
        '/user/adult-content/confirm',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single as Map<String, dynamic>;

    expect(body, {'policyVersion': 'adult-content-v2'});
    expect(body, isNot(contains('policy_version')));
  });

  test('revoke posts to the endpoint without a request body', () async {
    when(
      () => client.post<AgeAccessEntity, DataDto<AgeAccessDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(status));

    await repository.revoke();

    final body = verify(
      () => client.post<AgeAccessEntity, DataDto<AgeAccessDto>>(
        '/user/adult-content/revoke',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single;

    expect(body, isNull);
  });

  test('unknown enum values fail closed without changing server flags', () {
    final entity = AgeAccessDto.fromJson({
      'adult_eligible_at': '2026-08-25',
      'age_signal_source': 'FUTURE_SOURCE',
      'store_age_signal': 'FUTURE_SIGNAL',
      'adult_eligible': true,
      'adult_content_enabled': false,
      'confirmed_at': null,
      'policy_version': null,
      'revoked_at': null,
      'override': 'FUTURE_OVERRIDE',
      'current_policy_version': 'adult-content-v2',
    }).toEntity();

    expect(entity.ageSignalSource, AgeSignalSource.unknown);
    expect(entity.storeAgeSignal, StoreAgeSignal.unknown);
    expect(entity.adultAccessOverride, AdultAccessOverride.unknown);
    expect(entity.adultEligibleAt, '2026-08-25');
    expect(entity.adultEligible, isTrue);
    expect(entity.adultContentEnabled, isFalse);
  });
}
