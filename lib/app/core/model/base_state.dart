import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/failure.dart';

part 'base_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.loading() = BaseLoadingState<T>;

  const factory BaseState.data(T data) = BaseDataState<T>;

  const factory BaseState.failed(Failure failure) = BaseFailedState<T>;
}
