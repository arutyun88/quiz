import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/device_timezone_service.dart';
import 'package:quiz/features/authentication/data/dto/token_dto.dart';
import 'package:quiz/features/authentication/domain/entity/token_entity.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

class RemoteAuthenticationRepository implements AuthenticationRepository {
  const RemoteAuthenticationRepository({
    required ApiClient client,
    required DeviceTimezoneService timezoneService,
  })  : _client = client,
        _timezoneService = timezoneService;

  final ApiClient _client;
  final DeviceTimezoneService _timezoneService;

  @override
  Future<Result<TokenEntity, Failure>> registerWithEmail({
    required String email,
    required String password,
    required DateTime birthDate,
    String? name,
  }) async {
    final timezoneId = await _timezoneService.currentIanaIdentifier();
    return await _client.post(
      '/auth/register',
      body: {
        "email": email,
        'password': password,
        'name': name,
        'birth_date': _formatDateOnly(birthDate),
        if (timezoneId != null) 'timezone_id': timezoneId,
      },
      mapper: (json) =>
          DataDto.fromJson(json, (json) => TokenDto.fromJson(json as Json)),
      converter: (dto) => TokenEntity(accessToken: dto.data.accessToken),
    );
  }

  @override
  Future<Result<TokenEntity, Failure>> signInWithEmail({
    required String email,
    required String password,
  }) async =>
      await _client.post(
        '/auth/login',
        body: {
          "email": email,
          'password': password,
        },
        mapper: (json) =>
            DataDto.fromJson(json, (json) => TokenDto.fromJson(json as Json)),
        converter: (dto) => TokenEntity(accessToken: dto.data.accessToken),
      );

  @override
  Future<void> logout() async => await _client.post('/auth/logout');

  @override
  Future<Result<void, Failure>> sendPasswordResetEmail(String email) async {
    // try {
    //   await _auth.sendPasswordResetEmail(
    //     email: email,
    //   );

    return const Result.ok(null);
    // } on FirebaseAuthException catch (e) {
    //   return Result.failed(Failure.authentication(_mapAuthenticationExceptionCode(e.code)));
    // }
  }
}

String _formatDateOnly(DateTime value) => [
      value.year.toString().padLeft(4, '0'),
      value.month.toString().padLeft(2, '0'),
      value.day.toString().padLeft(2, '0'),
    ].join('-');
