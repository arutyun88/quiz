import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.unknown(Object error) = UnknownFailure;

  const factory Failure.noConnection() = NoConnectionFailure;

  const factory Failure.serverUnavailable() = ServerUnavailableFailure;

  const factory Failure.conflict() = ConflictFailure;

  const factory Failure.authentication(AuthenticationFailureType type) = AuthenticationFailure;

  const factory Failure.network(NetworkFailureReason reason) = NetworkFailure;

  const factory Failure.question(QuestionFailureReason reason) = QuestionFailure;
}

enum AuthenticationFailureType {
  credentials,
  tooManyRequests,
  alreadyExist,
  data,
  unauthenticated,
}

@freezed
abstract class NetworkFailureReason with _$NetworkFailureReason {
  const factory NetworkFailureReason.timeout(String message) = NetworkFailureTimeoutReason;

  const factory NetworkFailureReason.badResponse(String message) = NetworkFailureBadResponseReason;

  const factory NetworkFailureReason.credential(String message) = NetworkFailureCredentialReason;

  const factory NetworkFailureReason.cancelled(String message) = NetworkFailureCancelledReason;

  const factory NetworkFailureReason.server(String message) = NetworkFailureServerReason;
}

@freezed
abstract class QuestionFailureReason with _$QuestionFailureReason {
  const factory QuestionFailureReason.notFoundCached() = QuestionFailureNotFoundCachedReason;

  const factory QuestionFailureReason.save() = QuestionFailureSaveReason;

  const factory QuestionFailureReason.over() = QuestionFailureOverReason;
}
