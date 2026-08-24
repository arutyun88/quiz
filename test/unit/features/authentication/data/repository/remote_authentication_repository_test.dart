import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/authentication/data/dto/token_dto.dart';
import 'package:quiz/features/authentication/data/repository/remote_authentication_repository.dart';
import 'package:quiz/features/authentication/domain/entity/token_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemoteAuthenticationRepository repository;

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    client = MockApiClient();
    repository = RemoteAuthenticationRepository(client: client);
  });

  test('registration sends birth_date as a date-only transient value',
      () async {
    when(
      () => client.post<TokenEntity, DataDto<TokenDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer(
        (_) async => const Result.ok(TokenEntity(accessToken: 'token')));

    await repository.registerWithEmail(
      email: 'user@example.test',
      password: 'secret',
      name: 'User',
      birthDate: DateTime(2000, 2, 3, 23, 59, 58),
    );

    final body = verify(
      () => client.post<TokenEntity, DataDto<TokenDto>>(
        '/auth/register',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single as Map<String, dynamic>;

    expect(body['birth_date'], '2000-02-03');
  });
}
