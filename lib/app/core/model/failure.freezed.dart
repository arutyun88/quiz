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
    required TResult Function(NetworkFailureReason reason) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
    TResult? Function(NetworkFailureReason reason)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    TResult Function(NetworkFailureReason reason)? network,
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
    required TResult Function(NetworkFailure value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(NetworkFailure value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(NetworkFailure value)? network,
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
    required TResult Function(NetworkFailureReason reason) network,
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
    TResult? Function(NetworkFailureReason reason)? network,
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
    TResult Function(NetworkFailureReason reason)? network,
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
    required TResult Function(NetworkFailure value) network,
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
    TResult? Function(NetworkFailure value)? network,
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
    TResult Function(NetworkFailure value)? network,
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
    required TResult Function(NetworkFailureReason reason) network,
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
    TResult? Function(NetworkFailureReason reason)? network,
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
    TResult Function(NetworkFailureReason reason)? network,
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
    required TResult Function(NetworkFailure value) network,
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
    TResult? Function(NetworkFailure value)? network,
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
    TResult Function(NetworkFailure value)? network,
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
    required TResult Function(NetworkFailureReason reason) network,
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
    TResult? Function(NetworkFailureReason reason)? network,
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
    TResult Function(NetworkFailureReason reason)? network,
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
    required TResult Function(NetworkFailure value) network,
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
    TResult? Function(NetworkFailure value)? network,
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
    TResult Function(NetworkFailure value)? network,
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
    required TResult Function(NetworkFailureReason reason) network,
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
    TResult? Function(NetworkFailureReason reason)? network,
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
    TResult Function(NetworkFailureReason reason)? network,
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
    required TResult Function(NetworkFailure value) network,
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
    TResult? Function(NetworkFailure value)? network,
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
    TResult Function(NetworkFailure value)? network,
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
    required TResult Function(NetworkFailureReason reason) network,
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
    TResult? Function(NetworkFailureReason reason)? network,
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
    TResult Function(NetworkFailureReason reason)? network,
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
    required TResult Function(NetworkFailure value) network,
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
    TResult? Function(NetworkFailure value)? network,
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
    TResult Function(NetworkFailure value)? network,
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

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkFailureReason reason});

  $NetworkFailureReasonCopyWith<$Res> get reason;
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$NetworkFailureImpl(
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as NetworkFailureReason,
    ));
  }

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkFailureReasonCopyWith<$Res> get reason {
    return $NetworkFailureReasonCopyWith<$Res>(_value.reason, (value) {
      return _then(_value.copyWith(reason: value));
    });
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl(this.reason);

  @override
  final NetworkFailureReason reason;

  @override
  String toString() {
    return 'Failure.network(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error) unknown,
    required TResult Function() noConnection,
    required TResult Function() serverUnavailable,
    required TResult Function() conflict,
    required TResult Function(AuthenticationFailureType type) authentication,
    required TResult Function(NetworkFailureReason reason) network,
  }) {
    return network(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object error)? unknown,
    TResult? Function()? noConnection,
    TResult? Function()? serverUnavailable,
    TResult? Function()? conflict,
    TResult? Function(AuthenticationFailureType type)? authentication,
    TResult? Function(NetworkFailureReason reason)? network,
  }) {
    return network?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object error)? unknown,
    TResult Function()? noConnection,
    TResult Function()? serverUnavailable,
    TResult Function()? conflict,
    TResult Function(AuthenticationFailureType type)? authentication,
    TResult Function(NetworkFailureReason reason)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(reason);
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
    required TResult Function(NetworkFailure value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(NoConnectionFailure value)? noConnection,
    TResult? Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(NetworkFailure value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(NoConnectionFailure value)? noConnection,
    TResult Function(ServerUnavailableFailure value)? serverUnavailable,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(NetworkFailure value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure(final NetworkFailureReason reason) =
      _$NetworkFailureImpl;

  NetworkFailureReason get reason;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NetworkFailureReason {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) timeout,
    required TResult Function(String message) badResponse,
    required TResult Function(String message) credential,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? badResponse,
    TResult? Function(String message)? credential,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? timeout,
    TResult Function(String message)? badResponse,
    TResult Function(String message)? credential,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? server,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailureTimeoutReason value) timeout,
    required TResult Function(NetworkFailureBadResponseReason value)
        badResponse,
    required TResult Function(NetworkFailureCredentialReason value) credential,
    required TResult Function(NetworkFailureCancelledReason value) cancelled,
    required TResult Function(NetworkFailureServerReason value) server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailureTimeoutReason value)? timeout,
    TResult? Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult? Function(NetworkFailureCredentialReason value)? credential,
    TResult? Function(NetworkFailureCancelledReason value)? cancelled,
    TResult? Function(NetworkFailureServerReason value)? server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailureTimeoutReason value)? timeout,
    TResult Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult Function(NetworkFailureCredentialReason value)? credential,
    TResult Function(NetworkFailureCancelledReason value)? cancelled,
    TResult Function(NetworkFailureServerReason value)? server,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkFailureReasonCopyWith<NetworkFailureReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkFailureReasonCopyWith<$Res> {
  factory $NetworkFailureReasonCopyWith(NetworkFailureReason value,
          $Res Function(NetworkFailureReason) then) =
      _$NetworkFailureReasonCopyWithImpl<$Res, NetworkFailureReason>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NetworkFailureReasonCopyWithImpl<$Res,
        $Val extends NetworkFailureReason>
    implements $NetworkFailureReasonCopyWith<$Res> {
  _$NetworkFailureReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkFailureTimeoutReasonImplCopyWith<$Res>
    implements $NetworkFailureReasonCopyWith<$Res> {
  factory _$$NetworkFailureTimeoutReasonImplCopyWith(
          _$NetworkFailureTimeoutReasonImpl value,
          $Res Function(_$NetworkFailureTimeoutReasonImpl) then) =
      __$$NetworkFailureTimeoutReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureTimeoutReasonImplCopyWithImpl<$Res>
    extends _$NetworkFailureReasonCopyWithImpl<$Res,
        _$NetworkFailureTimeoutReasonImpl>
    implements _$$NetworkFailureTimeoutReasonImplCopyWith<$Res> {
  __$$NetworkFailureTimeoutReasonImplCopyWithImpl(
      _$NetworkFailureTimeoutReasonImpl _value,
      $Res Function(_$NetworkFailureTimeoutReasonImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureTimeoutReasonImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureTimeoutReasonImpl implements NetworkFailureTimeoutReason {
  const _$NetworkFailureTimeoutReasonImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailureReason.timeout(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureTimeoutReasonImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureTimeoutReasonImplCopyWith<_$NetworkFailureTimeoutReasonImpl>
      get copyWith => __$$NetworkFailureTimeoutReasonImplCopyWithImpl<
          _$NetworkFailureTimeoutReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) timeout,
    required TResult Function(String message) badResponse,
    required TResult Function(String message) credential,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) server,
  }) {
    return timeout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? badResponse,
    TResult? Function(String message)? credential,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? server,
  }) {
    return timeout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? timeout,
    TResult Function(String message)? badResponse,
    TResult Function(String message)? credential,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? server,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailureTimeoutReason value) timeout,
    required TResult Function(NetworkFailureBadResponseReason value)
        badResponse,
    required TResult Function(NetworkFailureCredentialReason value) credential,
    required TResult Function(NetworkFailureCancelledReason value) cancelled,
    required TResult Function(NetworkFailureServerReason value) server,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailureTimeoutReason value)? timeout,
    TResult? Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult? Function(NetworkFailureCredentialReason value)? credential,
    TResult? Function(NetworkFailureCancelledReason value)? cancelled,
    TResult? Function(NetworkFailureServerReason value)? server,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailureTimeoutReason value)? timeout,
    TResult Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult Function(NetworkFailureCredentialReason value)? credential,
    TResult Function(NetworkFailureCancelledReason value)? cancelled,
    TResult Function(NetworkFailureServerReason value)? server,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class NetworkFailureTimeoutReason implements NetworkFailureReason {
  const factory NetworkFailureTimeoutReason(final String message) =
      _$NetworkFailureTimeoutReasonImpl;

  @override
  String get message;

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureTimeoutReasonImplCopyWith<_$NetworkFailureTimeoutReasonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureBadResponseReasonImplCopyWith<$Res>
    implements $NetworkFailureReasonCopyWith<$Res> {
  factory _$$NetworkFailureBadResponseReasonImplCopyWith(
          _$NetworkFailureBadResponseReasonImpl value,
          $Res Function(_$NetworkFailureBadResponseReasonImpl) then) =
      __$$NetworkFailureBadResponseReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureBadResponseReasonImplCopyWithImpl<$Res>
    extends _$NetworkFailureReasonCopyWithImpl<$Res,
        _$NetworkFailureBadResponseReasonImpl>
    implements _$$NetworkFailureBadResponseReasonImplCopyWith<$Res> {
  __$$NetworkFailureBadResponseReasonImplCopyWithImpl(
      _$NetworkFailureBadResponseReasonImpl _value,
      $Res Function(_$NetworkFailureBadResponseReasonImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureBadResponseReasonImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureBadResponseReasonImpl
    implements NetworkFailureBadResponseReason {
  const _$NetworkFailureBadResponseReasonImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailureReason.badResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureBadResponseReasonImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureBadResponseReasonImplCopyWith<
          _$NetworkFailureBadResponseReasonImpl>
      get copyWith => __$$NetworkFailureBadResponseReasonImplCopyWithImpl<
          _$NetworkFailureBadResponseReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) timeout,
    required TResult Function(String message) badResponse,
    required TResult Function(String message) credential,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) server,
  }) {
    return badResponse(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? badResponse,
    TResult? Function(String message)? credential,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? server,
  }) {
    return badResponse?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? timeout,
    TResult Function(String message)? badResponse,
    TResult Function(String message)? credential,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? server,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailureTimeoutReason value) timeout,
    required TResult Function(NetworkFailureBadResponseReason value)
        badResponse,
    required TResult Function(NetworkFailureCredentialReason value) credential,
    required TResult Function(NetworkFailureCancelledReason value) cancelled,
    required TResult Function(NetworkFailureServerReason value) server,
  }) {
    return badResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailureTimeoutReason value)? timeout,
    TResult? Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult? Function(NetworkFailureCredentialReason value)? credential,
    TResult? Function(NetworkFailureCancelledReason value)? cancelled,
    TResult? Function(NetworkFailureServerReason value)? server,
  }) {
    return badResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailureTimeoutReason value)? timeout,
    TResult Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult Function(NetworkFailureCredentialReason value)? credential,
    TResult Function(NetworkFailureCancelledReason value)? cancelled,
    TResult Function(NetworkFailureServerReason value)? server,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(this);
    }
    return orElse();
  }
}

abstract class NetworkFailureBadResponseReason implements NetworkFailureReason {
  const factory NetworkFailureBadResponseReason(final String message) =
      _$NetworkFailureBadResponseReasonImpl;

  @override
  String get message;

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureBadResponseReasonImplCopyWith<
          _$NetworkFailureBadResponseReasonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureCredentialReasonImplCopyWith<$Res>
    implements $NetworkFailureReasonCopyWith<$Res> {
  factory _$$NetworkFailureCredentialReasonImplCopyWith(
          _$NetworkFailureCredentialReasonImpl value,
          $Res Function(_$NetworkFailureCredentialReasonImpl) then) =
      __$$NetworkFailureCredentialReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureCredentialReasonImplCopyWithImpl<$Res>
    extends _$NetworkFailureReasonCopyWithImpl<$Res,
        _$NetworkFailureCredentialReasonImpl>
    implements _$$NetworkFailureCredentialReasonImplCopyWith<$Res> {
  __$$NetworkFailureCredentialReasonImplCopyWithImpl(
      _$NetworkFailureCredentialReasonImpl _value,
      $Res Function(_$NetworkFailureCredentialReasonImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureCredentialReasonImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureCredentialReasonImpl
    implements NetworkFailureCredentialReason {
  const _$NetworkFailureCredentialReasonImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailureReason.credential(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureCredentialReasonImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureCredentialReasonImplCopyWith<
          _$NetworkFailureCredentialReasonImpl>
      get copyWith => __$$NetworkFailureCredentialReasonImplCopyWithImpl<
          _$NetworkFailureCredentialReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) timeout,
    required TResult Function(String message) badResponse,
    required TResult Function(String message) credential,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) server,
  }) {
    return credential(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? badResponse,
    TResult? Function(String message)? credential,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? server,
  }) {
    return credential?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? timeout,
    TResult Function(String message)? badResponse,
    TResult Function(String message)? credential,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? server,
    required TResult orElse(),
  }) {
    if (credential != null) {
      return credential(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailureTimeoutReason value) timeout,
    required TResult Function(NetworkFailureBadResponseReason value)
        badResponse,
    required TResult Function(NetworkFailureCredentialReason value) credential,
    required TResult Function(NetworkFailureCancelledReason value) cancelled,
    required TResult Function(NetworkFailureServerReason value) server,
  }) {
    return credential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailureTimeoutReason value)? timeout,
    TResult? Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult? Function(NetworkFailureCredentialReason value)? credential,
    TResult? Function(NetworkFailureCancelledReason value)? cancelled,
    TResult? Function(NetworkFailureServerReason value)? server,
  }) {
    return credential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailureTimeoutReason value)? timeout,
    TResult Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult Function(NetworkFailureCredentialReason value)? credential,
    TResult Function(NetworkFailureCancelledReason value)? cancelled,
    TResult Function(NetworkFailureServerReason value)? server,
    required TResult orElse(),
  }) {
    if (credential != null) {
      return credential(this);
    }
    return orElse();
  }
}

abstract class NetworkFailureCredentialReason implements NetworkFailureReason {
  const factory NetworkFailureCredentialReason(final String message) =
      _$NetworkFailureCredentialReasonImpl;

  @override
  String get message;

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureCredentialReasonImplCopyWith<
          _$NetworkFailureCredentialReasonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureCancelledReasonImplCopyWith<$Res>
    implements $NetworkFailureReasonCopyWith<$Res> {
  factory _$$NetworkFailureCancelledReasonImplCopyWith(
          _$NetworkFailureCancelledReasonImpl value,
          $Res Function(_$NetworkFailureCancelledReasonImpl) then) =
      __$$NetworkFailureCancelledReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureCancelledReasonImplCopyWithImpl<$Res>
    extends _$NetworkFailureReasonCopyWithImpl<$Res,
        _$NetworkFailureCancelledReasonImpl>
    implements _$$NetworkFailureCancelledReasonImplCopyWith<$Res> {
  __$$NetworkFailureCancelledReasonImplCopyWithImpl(
      _$NetworkFailureCancelledReasonImpl _value,
      $Res Function(_$NetworkFailureCancelledReasonImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureCancelledReasonImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureCancelledReasonImpl
    implements NetworkFailureCancelledReason {
  const _$NetworkFailureCancelledReasonImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailureReason.cancelled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureCancelledReasonImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureCancelledReasonImplCopyWith<
          _$NetworkFailureCancelledReasonImpl>
      get copyWith => __$$NetworkFailureCancelledReasonImplCopyWithImpl<
          _$NetworkFailureCancelledReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) timeout,
    required TResult Function(String message) badResponse,
    required TResult Function(String message) credential,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) server,
  }) {
    return cancelled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? badResponse,
    TResult? Function(String message)? credential,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? server,
  }) {
    return cancelled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? timeout,
    TResult Function(String message)? badResponse,
    TResult Function(String message)? credential,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? server,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailureTimeoutReason value) timeout,
    required TResult Function(NetworkFailureBadResponseReason value)
        badResponse,
    required TResult Function(NetworkFailureCredentialReason value) credential,
    required TResult Function(NetworkFailureCancelledReason value) cancelled,
    required TResult Function(NetworkFailureServerReason value) server,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailureTimeoutReason value)? timeout,
    TResult? Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult? Function(NetworkFailureCredentialReason value)? credential,
    TResult? Function(NetworkFailureCancelledReason value)? cancelled,
    TResult? Function(NetworkFailureServerReason value)? server,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailureTimeoutReason value)? timeout,
    TResult Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult Function(NetworkFailureCredentialReason value)? credential,
    TResult Function(NetworkFailureCancelledReason value)? cancelled,
    TResult Function(NetworkFailureServerReason value)? server,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class NetworkFailureCancelledReason implements NetworkFailureReason {
  const factory NetworkFailureCancelledReason(final String message) =
      _$NetworkFailureCancelledReasonImpl;

  @override
  String get message;

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureCancelledReasonImplCopyWith<
          _$NetworkFailureCancelledReasonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureServerReasonImplCopyWith<$Res>
    implements $NetworkFailureReasonCopyWith<$Res> {
  factory _$$NetworkFailureServerReasonImplCopyWith(
          _$NetworkFailureServerReasonImpl value,
          $Res Function(_$NetworkFailureServerReasonImpl) then) =
      __$$NetworkFailureServerReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureServerReasonImplCopyWithImpl<$Res>
    extends _$NetworkFailureReasonCopyWithImpl<$Res,
        _$NetworkFailureServerReasonImpl>
    implements _$$NetworkFailureServerReasonImplCopyWith<$Res> {
  __$$NetworkFailureServerReasonImplCopyWithImpl(
      _$NetworkFailureServerReasonImpl _value,
      $Res Function(_$NetworkFailureServerReasonImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureServerReasonImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureServerReasonImpl implements NetworkFailureServerReason {
  const _$NetworkFailureServerReasonImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailureReason.server(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureServerReasonImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureServerReasonImplCopyWith<_$NetworkFailureServerReasonImpl>
      get copyWith => __$$NetworkFailureServerReasonImplCopyWithImpl<
          _$NetworkFailureServerReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) timeout,
    required TResult Function(String message) badResponse,
    required TResult Function(String message) credential,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) server,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? badResponse,
    TResult? Function(String message)? credential,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? server,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? timeout,
    TResult Function(String message)? badResponse,
    TResult Function(String message)? credential,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? server,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailureTimeoutReason value) timeout,
    required TResult Function(NetworkFailureBadResponseReason value)
        badResponse,
    required TResult Function(NetworkFailureCredentialReason value) credential,
    required TResult Function(NetworkFailureCancelledReason value) cancelled,
    required TResult Function(NetworkFailureServerReason value) server,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailureTimeoutReason value)? timeout,
    TResult? Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult? Function(NetworkFailureCredentialReason value)? credential,
    TResult? Function(NetworkFailureCancelledReason value)? cancelled,
    TResult? Function(NetworkFailureServerReason value)? server,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailureTimeoutReason value)? timeout,
    TResult Function(NetworkFailureBadResponseReason value)? badResponse,
    TResult Function(NetworkFailureCredentialReason value)? credential,
    TResult Function(NetworkFailureCancelledReason value)? cancelled,
    TResult Function(NetworkFailureServerReason value)? server,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class NetworkFailureServerReason implements NetworkFailureReason {
  const factory NetworkFailureServerReason(final String message) =
      _$NetworkFailureServerReasonImpl;

  @override
  String get message;

  /// Create a copy of NetworkFailureReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureServerReasonImplCopyWith<_$NetworkFailureServerReasonImpl>
      get copyWith => throw _privateConstructorUsedError;
}
