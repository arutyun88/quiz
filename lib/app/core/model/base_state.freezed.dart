// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(Failure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(Failure failure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseLoadingState<T> value) loading,
    required TResult Function(BaseDataState<T> value) data,
    required TResult Function(BaseFailedState<T> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseLoadingState<T> value)? loading,
    TResult? Function(BaseDataState<T> value)? data,
    TResult? Function(BaseFailedState<T> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseLoadingState<T> value)? loading,
    TResult Function(BaseDataState<T> value)? data,
    TResult Function(BaseFailedState<T> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res, BaseState<T>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res, $Val extends BaseState<T>>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BaseLoadingStateImplCopyWith<T, $Res> {
  factory _$$BaseLoadingStateImplCopyWith(_$BaseLoadingStateImpl<T> value,
          $Res Function(_$BaseLoadingStateImpl<T>) then) =
      __$$BaseLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BaseLoadingStateImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseLoadingStateImpl<T>>
    implements _$$BaseLoadingStateImplCopyWith<T, $Res> {
  __$$BaseLoadingStateImplCopyWithImpl(_$BaseLoadingStateImpl<T> _value,
      $Res Function(_$BaseLoadingStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BaseLoadingStateImpl<T> implements BaseLoadingState<T> {
  const _$BaseLoadingStateImpl();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(Failure failure) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(Failure failure)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
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
    required TResult Function(BaseLoadingState<T> value) loading,
    required TResult Function(BaseDataState<T> value) data,
    required TResult Function(BaseFailedState<T> value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseLoadingState<T> value)? loading,
    TResult? Function(BaseDataState<T> value)? data,
    TResult? Function(BaseFailedState<T> value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseLoadingState<T> value)? loading,
    TResult Function(BaseDataState<T> value)? data,
    TResult Function(BaseFailedState<T> value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BaseLoadingState<T> implements BaseState<T> {
  const factory BaseLoadingState() = _$BaseLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$BaseDataStateImplCopyWith<T, $Res> {
  factory _$$BaseDataStateImplCopyWith(_$BaseDataStateImpl<T> value,
          $Res Function(_$BaseDataStateImpl<T>) then) =
      __$$BaseDataStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$BaseDataStateImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseDataStateImpl<T>>
    implements _$$BaseDataStateImplCopyWith<T, $Res> {
  __$$BaseDataStateImplCopyWithImpl(_$BaseDataStateImpl<T> _value,
      $Res Function(_$BaseDataStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseDataStateImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$BaseDataStateImpl<T> implements BaseDataState<T> {
  const _$BaseDataStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'BaseState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseDataStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseDataStateImplCopyWith<T, _$BaseDataStateImpl<T>> get copyWith =>
      __$$BaseDataStateImplCopyWithImpl<T, _$BaseDataStateImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(Failure failure) failed,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(Failure failure)? failed,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseLoadingState<T> value) loading,
    required TResult Function(BaseDataState<T> value) data,
    required TResult Function(BaseFailedState<T> value) failed,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseLoadingState<T> value)? loading,
    TResult? Function(BaseDataState<T> value)? data,
    TResult? Function(BaseFailedState<T> value)? failed,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseLoadingState<T> value)? loading,
    TResult Function(BaseDataState<T> value)? data,
    TResult Function(BaseFailedState<T> value)? failed,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class BaseDataState<T> implements BaseState<T> {
  const factory BaseDataState(final T data) = _$BaseDataStateImpl<T>;

  T get data;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseDataStateImplCopyWith<T, _$BaseDataStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseFailedStateImplCopyWith<T, $Res> {
  factory _$$BaseFailedStateImplCopyWith(_$BaseFailedStateImpl<T> value,
          $Res Function(_$BaseFailedStateImpl<T>) then) =
      __$$BaseFailedStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$BaseFailedStateImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseFailedStateImpl<T>>
    implements _$$BaseFailedStateImplCopyWith<T, $Res> {
  __$$BaseFailedStateImplCopyWithImpl(_$BaseFailedStateImpl<T> _value,
      $Res Function(_$BaseFailedStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$BaseFailedStateImpl<T>(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of BaseState
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

class _$BaseFailedStateImpl<T> implements BaseFailedState<T> {
  const _$BaseFailedStateImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'BaseState<$T>.failed(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseFailedStateImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseFailedStateImplCopyWith<T, _$BaseFailedStateImpl<T>> get copyWith =>
      __$$BaseFailedStateImplCopyWithImpl<T, _$BaseFailedStateImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(Failure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? data,
    TResult? Function(Failure failure)? failed,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
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
    required TResult Function(BaseLoadingState<T> value) loading,
    required TResult Function(BaseDataState<T> value) data,
    required TResult Function(BaseFailedState<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseLoadingState<T> value)? loading,
    TResult? Function(BaseDataState<T> value)? data,
    TResult? Function(BaseFailedState<T> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseLoadingState<T> value)? loading,
    TResult Function(BaseDataState<T> value)? data,
    TResult Function(BaseFailedState<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class BaseFailedState<T> implements BaseState<T> {
  const factory BaseFailedState(final Failure failure) =
      _$BaseFailedStateImpl<T>;

  Failure get failure;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseFailedStateImplCopyWith<T, _$BaseFailedStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
