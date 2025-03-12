import 'package:quiz/app/core/model/failure.dart';

sealed class Result<TData, TError extends Failure> {
  const Result();

  const factory Result.ok(TData data) = ResultOk;

  const factory Result.failed(TError error) = ResultFailed;
}

final class ResultOk<TData, TError extends Failure> extends Result<TData, TError> {
  final TData data;

  const ResultOk(this.data);
}

final class ResultFailed<TData, TError extends Failure> extends Result<TData, TError> {
  final TError error;

  const ResultFailed(this.error);
}
