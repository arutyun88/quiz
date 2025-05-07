// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuestionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) data,
    required TResult Function() empty,
    required TResult Function(Failure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? data,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? data,
    TResult Function()? empty,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionLoadingState value) loading,
    required TResult Function(_QuestionDataState value) data,
    required TResult Function(_QuestionEmptyState value) empty,
    required TResult Function(_QuestionFailedState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionLoadingState value)? loading,
    TResult? Function(_QuestionDataState value)? data,
    TResult? Function(_QuestionEmptyState value)? empty,
    TResult? Function(_QuestionFailedState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionLoadingState value)? loading,
    TResult Function(_QuestionDataState value)? data,
    TResult Function(_QuestionEmptyState value)? empty,
    TResult Function(_QuestionFailedState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStateCopyWith<$Res> {
  factory $QuestionStateCopyWith(
          QuestionState value, $Res Function(QuestionState) then) =
      _$QuestionStateCopyWithImpl<$Res, QuestionState>;
}

/// @nodoc
class _$QuestionStateCopyWithImpl<$Res, $Val extends QuestionState>
    implements $QuestionStateCopyWith<$Res> {
  _$QuestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QuestionLoadingStateImplCopyWith<$Res> {
  factory _$$QuestionLoadingStateImplCopyWith(_$QuestionLoadingStateImpl value,
          $Res Function(_$QuestionLoadingStateImpl) then) =
      __$$QuestionLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionLoadingStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionLoadingStateImpl>
    implements _$$QuestionLoadingStateImplCopyWith<$Res> {
  __$$QuestionLoadingStateImplCopyWithImpl(_$QuestionLoadingStateImpl _value,
      $Res Function(_$QuestionLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$QuestionLoadingStateImpl extends _QuestionLoadingState {
  const _$QuestionLoadingStateImpl() : super._();

  @override
  String toString() {
    return 'QuestionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) data,
    required TResult Function() empty,
    required TResult Function(Failure failure) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? data,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? data,
    TResult Function()? empty,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionLoadingState value) loading,
    required TResult Function(_QuestionDataState value) data,
    required TResult Function(_QuestionEmptyState value) empty,
    required TResult Function(_QuestionFailedState value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionLoadingState value)? loading,
    TResult? Function(_QuestionDataState value)? data,
    TResult? Function(_QuestionEmptyState value)? empty,
    TResult? Function(_QuestionFailedState value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionLoadingState value)? loading,
    TResult Function(_QuestionDataState value)? data,
    TResult Function(_QuestionEmptyState value)? empty,
    TResult Function(_QuestionFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _QuestionLoadingState extends QuestionState {
  const factory _QuestionLoadingState() = _$QuestionLoadingStateImpl;
  const _QuestionLoadingState._() : super._();
}

/// @nodoc
abstract class _$$QuestionDataStateImplCopyWith<$Res> {
  factory _$$QuestionDataStateImplCopyWith(_$QuestionDataStateImpl value,
          $Res Function(_$QuestionDataStateImpl) then) =
      __$$QuestionDataStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuestionEntity question});

  $QuestionEntityCopyWith<$Res> get question;
}

/// @nodoc
class __$$QuestionDataStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionDataStateImpl>
    implements _$$QuestionDataStateImplCopyWith<$Res> {
  __$$QuestionDataStateImplCopyWithImpl(_$QuestionDataStateImpl _value,
      $Res Function(_$QuestionDataStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
  }) {
    return _then(_$QuestionDataStateImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionEntity,
    ));
  }

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionEntityCopyWith<$Res> get question {
    return $QuestionEntityCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

/// @nodoc

class _$QuestionDataStateImpl extends _QuestionDataState {
  const _$QuestionDataStateImpl({required this.question}) : super._();

  @override
  final QuestionEntity question;

  @override
  String toString() {
    return 'QuestionState.data(question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDataStateImpl &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionDataStateImplCopyWith<_$QuestionDataStateImpl> get copyWith =>
      __$$QuestionDataStateImplCopyWithImpl<_$QuestionDataStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) data,
    required TResult Function() empty,
    required TResult Function(Failure failure) failed,
  }) {
    return data(question);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? data,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? failed,
  }) {
    return data?.call(question);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? data,
    TResult Function()? empty,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(question);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionLoadingState value) loading,
    required TResult Function(_QuestionDataState value) data,
    required TResult Function(_QuestionEmptyState value) empty,
    required TResult Function(_QuestionFailedState value) failed,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionLoadingState value)? loading,
    TResult? Function(_QuestionDataState value)? data,
    TResult? Function(_QuestionEmptyState value)? empty,
    TResult? Function(_QuestionFailedState value)? failed,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionLoadingState value)? loading,
    TResult Function(_QuestionDataState value)? data,
    TResult Function(_QuestionEmptyState value)? empty,
    TResult Function(_QuestionFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _QuestionDataState extends QuestionState {
  const factory _QuestionDataState({required final QuestionEntity question}) =
      _$QuestionDataStateImpl;
  const _QuestionDataState._() : super._();

  QuestionEntity get question;

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionDataStateImplCopyWith<_$QuestionDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionEmptyStateImplCopyWith<$Res> {
  factory _$$QuestionEmptyStateImplCopyWith(_$QuestionEmptyStateImpl value,
          $Res Function(_$QuestionEmptyStateImpl) then) =
      __$$QuestionEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionEmptyStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionEmptyStateImpl>
    implements _$$QuestionEmptyStateImplCopyWith<$Res> {
  __$$QuestionEmptyStateImplCopyWithImpl(_$QuestionEmptyStateImpl _value,
      $Res Function(_$QuestionEmptyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$QuestionEmptyStateImpl extends _QuestionEmptyState {
  const _$QuestionEmptyStateImpl() : super._();

  @override
  String toString() {
    return 'QuestionState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$QuestionEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) data,
    required TResult Function() empty,
    required TResult Function(Failure failure) failed,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? data,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? failed,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? data,
    TResult Function()? empty,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionLoadingState value) loading,
    required TResult Function(_QuestionDataState value) data,
    required TResult Function(_QuestionEmptyState value) empty,
    required TResult Function(_QuestionFailedState value) failed,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionLoadingState value)? loading,
    TResult? Function(_QuestionDataState value)? data,
    TResult? Function(_QuestionEmptyState value)? empty,
    TResult? Function(_QuestionFailedState value)? failed,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionLoadingState value)? loading,
    TResult Function(_QuestionDataState value)? data,
    TResult Function(_QuestionEmptyState value)? empty,
    TResult Function(_QuestionFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _QuestionEmptyState extends QuestionState {
  const factory _QuestionEmptyState() = _$QuestionEmptyStateImpl;
  const _QuestionEmptyState._() : super._();
}

/// @nodoc
abstract class _$$QuestionFailedStateImplCopyWith<$Res> {
  factory _$$QuestionFailedStateImplCopyWith(_$QuestionFailedStateImpl value,
          $Res Function(_$QuestionFailedStateImpl) then) =
      __$$QuestionFailedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$QuestionFailedStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionFailedStateImpl>
    implements _$$QuestionFailedStateImplCopyWith<$Res> {
  __$$QuestionFailedStateImplCopyWithImpl(_$QuestionFailedStateImpl _value,
      $Res Function(_$QuestionFailedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$QuestionFailedStateImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$QuestionFailedStateImpl extends _QuestionFailedState {
  const _$QuestionFailedStateImpl({required this.failure}) : super._();

  @override
  final Failure failure;

  @override
  String toString() {
    return 'QuestionState.failed(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionFailedStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionFailedStateImplCopyWith<_$QuestionFailedStateImpl> get copyWith =>
      __$$QuestionFailedStateImplCopyWithImpl<_$QuestionFailedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) data,
    required TResult Function() empty,
    required TResult Function(Failure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? data,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? failed,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? data,
    TResult Function()? empty,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionLoadingState value) loading,
    required TResult Function(_QuestionDataState value) data,
    required TResult Function(_QuestionEmptyState value) empty,
    required TResult Function(_QuestionFailedState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionLoadingState value)? loading,
    TResult? Function(_QuestionDataState value)? data,
    TResult? Function(_QuestionEmptyState value)? empty,
    TResult? Function(_QuestionFailedState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionLoadingState value)? loading,
    TResult Function(_QuestionDataState value)? data,
    TResult Function(_QuestionEmptyState value)? empty,
    TResult Function(_QuestionFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _QuestionFailedState extends QuestionState {
  const factory _QuestionFailedState({required final Failure failure}) =
      _$QuestionFailedStateImpl;
  const _QuestionFailedState._() : super._();

  Failure get failure;

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionFailedStateImplCopyWith<_$QuestionFailedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
