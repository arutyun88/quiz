// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity? user) authenticated,
    required TResult Function(Failure? failure) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity? user)? authenticated,
    TResult? Function(Failure? failure)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity? user)? authenticated,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserAuthenticatedState value) authenticated,
    required TResult Function(_UserUnauthenticatedState value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserAuthenticatedState value)? authenticated,
    TResult? Function(_UserUnauthenticatedState value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserAuthenticatedState value)? authenticated,
    TResult Function(_UserUnauthenticatedState value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserAuthenticatedStateImplCopyWith<$Res> {
  factory _$$UserAuthenticatedStateImplCopyWith(
          _$UserAuthenticatedStateImpl value,
          $Res Function(_$UserAuthenticatedStateImpl) then) =
      __$$UserAuthenticatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity? user});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserAuthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$UserAuthenticatedStateImpl>
    implements _$$UserAuthenticatedStateImplCopyWith<$Res> {
  __$$UserAuthenticatedStateImplCopyWithImpl(
      _$UserAuthenticatedStateImpl _value,
      $Res Function(_$UserAuthenticatedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserAuthenticatedStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserAuthenticatedStateImpl extends _UserAuthenticatedState {
  const _$UserAuthenticatedStateImpl({this.user}) : super._();

  @override
  final UserEntity? user;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthenticatedStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthenticatedStateImplCopyWith<_$UserAuthenticatedStateImpl>
      get copyWith => __$$UserAuthenticatedStateImplCopyWithImpl<
          _$UserAuthenticatedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity? user) authenticated,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity? user)? authenticated,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity? user)? authenticated,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserAuthenticatedState value) authenticated,
    required TResult Function(_UserUnauthenticatedState value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserAuthenticatedState value)? authenticated,
    TResult? Function(_UserUnauthenticatedState value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserAuthenticatedState value)? authenticated,
    TResult Function(_UserUnauthenticatedState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _UserAuthenticatedState extends AuthenticationState {
  const factory _UserAuthenticatedState({final UserEntity? user}) =
      _$UserAuthenticatedStateImpl;
  const _UserAuthenticatedState._() : super._();

  UserEntity? get user;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAuthenticatedStateImplCopyWith<_$UserAuthenticatedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserUnauthenticatedStateImplCopyWith<$Res> {
  factory _$$UserUnauthenticatedStateImplCopyWith(
          _$UserUnauthenticatedStateImpl value,
          $Res Function(_$UserUnauthenticatedStateImpl) then) =
      __$$UserUnauthenticatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure? failure});

  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$UserUnauthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$UserUnauthenticatedStateImpl>
    implements _$$UserUnauthenticatedStateImplCopyWith<$Res> {
  __$$UserUnauthenticatedStateImplCopyWithImpl(
      _$UserUnauthenticatedStateImpl _value,
      $Res Function(_$UserUnauthenticatedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$UserUnauthenticatedStateImpl(
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$UserUnauthenticatedStateImpl extends _UserUnauthenticatedState {
  const _$UserUnauthenticatedStateImpl({this.failure}) : super._();

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUnauthenticatedStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUnauthenticatedStateImplCopyWith<_$UserUnauthenticatedStateImpl>
      get copyWith => __$$UserUnauthenticatedStateImplCopyWithImpl<
          _$UserUnauthenticatedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity? user) authenticated,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return unauthenticated(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity? user)? authenticated,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return unauthenticated?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity? user)? authenticated,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserAuthenticatedState value) authenticated,
    required TResult Function(_UserUnauthenticatedState value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserAuthenticatedState value)? authenticated,
    TResult? Function(_UserUnauthenticatedState value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserAuthenticatedState value)? authenticated,
    TResult Function(_UserUnauthenticatedState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _UserUnauthenticatedState extends AuthenticationState {
  const factory _UserUnauthenticatedState({final Failure? failure}) =
      _$UserUnauthenticatedStateImpl;
  const _UserUnauthenticatedState._() : super._();

  Failure? get failure;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserUnauthenticatedStateImplCopyWith<_$UserUnauthenticatedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
