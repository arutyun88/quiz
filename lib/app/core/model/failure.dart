import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.unknown(Object error) = UnknownFailure;

  const factory Failure.noConnection() = NoConnectionFailure;

  const factory Failure.serverUnavailable() = ServerUnavailableFailure;

  const factory Failure.conflict() = ConflictFailure;

  const factory Failure.authentication(AuthenticationFailureType type) = AuthenticationFailure;
}

enum AuthenticationFailureType { credentials, alreadyExist, data }
