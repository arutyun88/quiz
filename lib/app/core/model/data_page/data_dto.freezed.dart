// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataDto<T> _$DataDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _DataDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DataDto<T> {
  T get data => throw _privateConstructorUsedError;

  /// Serializes this DataDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataDtoCopyWith<T, DataDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataDtoCopyWith<T, $Res> {
  factory $DataDtoCopyWith(DataDto<T> value, $Res Function(DataDto<T>) then) =
      _$DataDtoCopyWithImpl<T, $Res, DataDto<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$DataDtoCopyWithImpl<T, $Res, $Val extends DataDto<T>>
    implements $DataDtoCopyWith<T, $Res> {
  _$DataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataDtoImplCopyWith<T, $Res>
    implements $DataDtoCopyWith<T, $Res> {
  factory _$$DataDtoImplCopyWith(
          _$DataDtoImpl<T> value, $Res Function(_$DataDtoImpl<T>) then) =
      __$$DataDtoImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DataDtoImplCopyWithImpl<T, $Res>
    extends _$DataDtoCopyWithImpl<T, $Res, _$DataDtoImpl<T>>
    implements _$$DataDtoImplCopyWith<T, $Res> {
  __$$DataDtoImplCopyWithImpl(
      _$DataDtoImpl<T> _value, $Res Function(_$DataDtoImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DataDtoImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DataDtoImpl<T> implements _DataDto<T> {
  const _$DataDtoImpl({required this.data});

  factory _$DataDtoImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$DataDtoImplFromJson(json, fromJsonT);

  @override
  final T data;

  @override
  String toString() {
    return 'DataDto<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataDtoImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataDtoImplCopyWith<T, _$DataDtoImpl<T>> get copyWith =>
      __$$DataDtoImplCopyWithImpl<T, _$DataDtoImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DataDtoImplToJson<T>(this, toJsonT);
  }
}

abstract class _DataDto<T> implements DataDto<T> {
  const factory _DataDto({required final T data}) = _$DataDtoImpl<T>;

  factory _DataDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$DataDtoImpl<T>.fromJson;

  @override
  T get data;

  /// Create a copy of DataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataDtoImplCopyWith<T, _$DataDtoImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
