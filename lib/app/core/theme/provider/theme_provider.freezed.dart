// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThemeState _$ThemeStateFromJson(Map<String, dynamic> json) {
  return _ThemeState.fromJson(json);
}

/// @nodoc
mixin _$ThemeState {
  @ThemeDataConverter()
  ThemeData get data => throw _privateConstructorUsedError;
  ThemeScope get scope => throw _privateConstructorUsedError;

  /// Serializes this ThemeState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res, ThemeState>;
  @useResult
  $Res call({@ThemeDataConverter() ThemeData data, ThemeScope scope});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? scope = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as ThemeScope,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeStateImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$ThemeStateImplCopyWith(
          _$ThemeStateImpl value, $Res Function(_$ThemeStateImpl) then) =
      __$$ThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ThemeDataConverter() ThemeData data, ThemeScope scope});
}

/// @nodoc
class __$$ThemeStateImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeStateImpl>
    implements _$$ThemeStateImplCopyWith<$Res> {
  __$$ThemeStateImplCopyWithImpl(
      _$ThemeStateImpl _value, $Res Function(_$ThemeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? scope = null,
  }) {
    return _then(_$ThemeStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as ThemeScope,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeStateImpl implements _ThemeState {
  const _$ThemeStateImpl(
      {@ThemeDataConverter() required this.data, required this.scope});

  factory _$ThemeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeStateImplFromJson(json);

  @override
  @ThemeDataConverter()
  final ThemeData data;
  @override
  final ThemeScope scope;

  @override
  String toString() {
    return 'ThemeState(data: $data, scope: $scope)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.scope, scope) || other.scope == scope));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, scope);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      __$$ThemeStateImplCopyWithImpl<_$ThemeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeStateImplToJson(
      this,
    );
  }
}

abstract class _ThemeState implements ThemeState {
  const factory _ThemeState(
      {@ThemeDataConverter() required final ThemeData data,
      required final ThemeScope scope}) = _$ThemeStateImpl;

  factory _ThemeState.fromJson(Map<String, dynamic> json) =
      _$ThemeStateImpl.fromJson;

  @override
  @ThemeDataConverter()
  ThemeData get data;
  @override
  ThemeScope get scope;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData theme) user,
    required TResult Function() system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData theme)? user,
    TResult? Function()? system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData theme)? user,
    TResult Function()? system,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeUserEvent value) user,
    required TResult Function(_ThemeSystemEvent value) system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeUserEvent value)? user,
    TResult? Function(_ThemeSystemEvent value)? system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeUserEvent value)? user,
    TResult Function(_ThemeSystemEvent value)? system,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ThemeUserEventImplCopyWith<$Res> {
  factory _$$ThemeUserEventImplCopyWith(_$ThemeUserEventImpl value,
          $Res Function(_$ThemeUserEventImpl) then) =
      __$$ThemeUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeData theme});
}

/// @nodoc
class __$$ThemeUserEventImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ThemeUserEventImpl>
    implements _$$ThemeUserEventImplCopyWith<$Res> {
  __$$ThemeUserEventImplCopyWithImpl(
      _$ThemeUserEventImpl _value, $Res Function(_$ThemeUserEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_$ThemeUserEventImpl(
      null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$ThemeUserEventImpl implements _ThemeUserEvent {
  const _$ThemeUserEventImpl(this.theme);

  @override
  final ThemeData theme;

  @override
  String toString() {
    return 'ThemeEvent.user(theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeUserEventImpl &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeUserEventImplCopyWith<_$ThemeUserEventImpl> get copyWith =>
      __$$ThemeUserEventImplCopyWithImpl<_$ThemeUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData theme) user,
    required TResult Function() system,
  }) {
    return user(theme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData theme)? user,
    TResult? Function()? system,
  }) {
    return user?.call(theme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData theme)? user,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(theme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeUserEvent value) user,
    required TResult Function(_ThemeSystemEvent value) system,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeUserEvent value)? user,
    TResult? Function(_ThemeSystemEvent value)? system,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeUserEvent value)? user,
    TResult Function(_ThemeSystemEvent value)? system,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }
}

abstract class _ThemeUserEvent implements ThemeEvent {
  const factory _ThemeUserEvent(final ThemeData theme) = _$ThemeUserEventImpl;

  ThemeData get theme;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeUserEventImplCopyWith<_$ThemeUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeSystemEventImplCopyWith<$Res> {
  factory _$$ThemeSystemEventImplCopyWith(_$ThemeSystemEventImpl value,
          $Res Function(_$ThemeSystemEventImpl) then) =
      __$$ThemeSystemEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ThemeSystemEventImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ThemeSystemEventImpl>
    implements _$$ThemeSystemEventImplCopyWith<$Res> {
  __$$ThemeSystemEventImplCopyWithImpl(_$ThemeSystemEventImpl _value,
      $Res Function(_$ThemeSystemEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ThemeSystemEventImpl implements _ThemeSystemEvent {
  const _$ThemeSystemEventImpl();

  @override
  String toString() {
    return 'ThemeEvent.system()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ThemeSystemEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData theme) user,
    required TResult Function() system,
  }) {
    return system();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData theme)? user,
    TResult? Function()? system,
  }) {
    return system?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData theme)? user,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (system != null) {
      return system();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeUserEvent value) user,
    required TResult Function(_ThemeSystemEvent value) system,
  }) {
    return system(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeUserEvent value)? user,
    TResult? Function(_ThemeSystemEvent value)? system,
  }) {
    return system?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeUserEvent value)? user,
    TResult Function(_ThemeSystemEvent value)? system,
    required TResult orElse(),
  }) {
    if (system != null) {
      return system(this);
    }
    return orElse();
  }
}

abstract class _ThemeSystemEvent implements ThemeEvent {
  const factory _ThemeSystemEvent() = _$ThemeSystemEventImpl;
}
