// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) unknown,
    required TResult Function() noConnection,
    required TResult Function() serverUnavailable,
    required TResult Function() conflict,
    required TResult Function(AuthenticationFailureType type) authentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerUnavailableFailure value) serverUnavailable,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(AuthenticationFailure value) authentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(_$UnknownFailureImpl value,
          $Res Function(_$UnknownFailureImpl) then) =
      __$$UnknownFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
      _$UnknownFailureImpl _value, $Res Function(_$UnknownFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UnknownFailureImpl(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$UnknownFailureImpl implements UnknownFailure {
  const _$UnknownFailureImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.unknown(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) unknown,
    required TResult Function() noConnection,
    required TResult Function() serverUnavailable,
    required TResult Function() conflict,
    required TResult Function(AuthenticationFailureType type) authentication,
  }) {
    return unknown(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
  }) {
    return unknown?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerUnavailableFailure value) serverUnavailable,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(AuthenticationFailure value) authentication,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure implements Failure {
  const factory UnknownFailure(final Object error) = _$UnknownFailureImpl;

  Object get error;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoConnectionFailureImplCopyWith<$Res> {
  factory _$$NoConnectionFailureImplCopyWith(_$NoConnectionFailureImpl value,
          $Res Function(_$NoConnectionFailureImpl) then) =
      __$$NoConnectionFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NoConnectionFailureImpl>
    implements _$$NoConnectionFailureImplCopyWith<$Res> {
  __$$NoConnectionFailureImplCopyWithImpl(_$NoConnectionFailureImpl _value,
      $Res Function(_$NoConnectionFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoConnectionFailureImpl implements NoConnectionFailure {
  const _$NoConnectionFailureImpl();

  @override
  String toString() {
    return 'Failure.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoConnectionFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) unknown,
    required TResult Function() noConnection,
    required TResult Function() serverUnavailable,
    required TResult Function() conflict,
    required TResult Function(AuthenticationFailureType type) authentication,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerUnavailableFailure value) serverUnavailable,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(AuthenticationFailure value) authentication,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnectionFailure implements Failure {
  const factory NoConnectionFailure() = _$NoConnectionFailureImpl;
}

/// @nodoc
abstract class _$$ServerUnavailableFailureImplCopyWith<$Res> {
  factory _$$ServerUnavailableFailureImplCopyWith(
          _$ServerUnavailableFailureImpl value,
          $Res Function(_$ServerUnavailableFailureImpl) then) =
      __$$ServerUnavailableFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerUnavailableFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerUnavailableFailureImpl>
    implements _$$ServerUnavailableFailureImplCopyWith<$Res> {
  __$$ServerUnavailableFailureImplCopyWithImpl(
      _$ServerUnavailableFailureImpl _value,
      $Res Function(_$ServerUnavailableFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServerUnavailableFailureImpl implements ServerUnavailableFailure {
  const _$ServerUnavailableFailureImpl();

  @override
  String toString() {
    return 'Failure.serverUnavailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerUnavailableFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) unknown,
    required TResult Function() noConnection,
    required TResult Function() serverUnavailable,
    required TResult Function() conflict,
    required TResult Function(AuthenticationFailureType type) authentication,
  }) {
    return serverUnavailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
  }) {
    return serverUnavailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    required TResult orElse(),
  }) {
    if (serverUnavailable != null) {
      return serverUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerUnavailableFailure value) serverUnavailable,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(AuthenticationFailure value) authentication,
  }) {
    return serverUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
  }) {
    return serverUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    required TResult orElse(),
  }) {
    if (serverUnavailable != null) {
      return serverUnavailable(this);
    }
    return orElse();
  }
}

abstract class ServerUnavailableFailure implements Failure {
  const factory ServerUnavailableFailure() = _$ServerUnavailableFailureImpl;
}

/// @nodoc
abstract class _$$ConflictFailureImplCopyWith<$Res> {
  factory _$$ConflictFailureImplCopyWith(_$ConflictFailureImpl value,
          $Res Function(_$ConflictFailureImpl) then) =
      __$$ConflictFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConflictFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConflictFailureImpl>
    implements _$$ConflictFailureImplCopyWith<$Res> {
  __$$ConflictFailureImplCopyWithImpl(
      _$ConflictFailureImpl _value, $Res Function(_$ConflictFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConflictFailureImpl implements ConflictFailure {
  const _$ConflictFailureImpl();

  @override
  String toString() {
    return 'Failure.conflict()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConflictFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) unknown,
    required TResult Function() noConnection,
    required TResult Function() serverUnavailable,
    required TResult Function() conflict,
    required TResult Function(AuthenticationFailureType type) authentication,
  }) {
    return conflict();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
  }) {
    return conflict?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerUnavailableFailure value) serverUnavailable,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(AuthenticationFailure value) authentication,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
  }) {
    return conflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class ConflictFailure implements Failure {
  const factory ConflictFailure() = _$ConflictFailureImpl;
}

/// @nodoc
abstract class _$$AuthenticationFailureImplCopyWith<$Res> {
  factory _$$AuthenticationFailureImplCopyWith(
          _$AuthenticationFailureImpl value,
          $Res Function(_$AuthenticationFailureImpl) then) =
      __$$AuthenticationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthenticationFailureType type});
}

/// @nodoc
class __$$AuthenticationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthenticationFailureImpl>
    implements _$$AuthenticationFailureImplCopyWith<$Res> {
  __$$AuthenticationFailureImplCopyWithImpl(_$AuthenticationFailureImpl _value,
      $Res Function(_$AuthenticationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$AuthenticationFailureImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthenticationFailureType,
    ));
  }
}

/// @nodoc

class _$AuthenticationFailureImpl implements AuthenticationFailure {
  const _$AuthenticationFailureImpl(this.type);

  @override
  final AuthenticationFailureType type;

  @override
  String toString() {
    return 'Failure.authentication(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationFailureImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationFailureImplCopyWith<_$AuthenticationFailureImpl>
      get copyWith => __$$AuthenticationFailureImplCopyWithImpl<
          _$AuthenticationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) unknown,
    required TResult Function() noConnection,
    required TResult Function() serverUnavailable,
    required TResult Function() conflict,
    required TResult Function(AuthenticationFailureType type) authentication,
  }) {
    return authentication(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
  }) {
    return authentication?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(NoConnectionFailure value) noConnection,
    required TResult Function(ServerUnavailableFailure value) serverUnavailable,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(AuthenticationFailure value) authentication,
  }) {
    return authentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
  }) {
    return authentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(this);
    }
    return orElse();
  }
}

abstract class AuthenticationFailure implements Failure {
  const factory AuthenticationFailure(final AuthenticationFailureType type) =
      _$AuthenticationFailureImpl;

  AuthenticationFailureType get type;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationFailureImplCopyWith<_$AuthenticationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
