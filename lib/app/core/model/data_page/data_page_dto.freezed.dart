// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataPageDto<T> _$DataPageDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _DataPageDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DataPageDto<T> {
  List<T> get data => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  /// Serializes this DataPageDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DataPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataPageDtoCopyWith<T, DataPageDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPageDtoCopyWith<T, $Res> {
  factory $DataPageDtoCopyWith(
          DataPageDto<T> value, $Res Function(DataPageDto<T>) then) =
      _$DataPageDtoCopyWithImpl<T, $Res, DataPageDto<T>>;
  @useResult
  $Res call({List<T> data, Meta meta});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$DataPageDtoCopyWithImpl<T, $Res, $Val extends DataPageDto<T>>
    implements $DataPageDtoCopyWith<T, $Res> {
  _$DataPageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  /// Create a copy of DataPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataPageDtoImplCopyWith<T, $Res>
    implements $DataPageDtoCopyWith<T, $Res> {
  factory _$$DataPageDtoImplCopyWith(_$DataPageDtoImpl<T> value,
          $Res Function(_$DataPageDtoImpl<T>) then) =
      __$$DataPageDtoImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> data, Meta meta});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$DataPageDtoImplCopyWithImpl<T, $Res>
    extends _$DataPageDtoCopyWithImpl<T, $Res, _$DataPageDtoImpl<T>>
    implements _$$DataPageDtoImplCopyWith<T, $Res> {
  __$$DataPageDtoImplCopyWithImpl(
      _$DataPageDtoImpl<T> _value, $Res Function(_$DataPageDtoImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DataPageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$DataPageDtoImpl<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DataPageDtoImpl<T> implements _DataPageDto<T> {
  const _$DataPageDtoImpl({required final List<T> data, required this.meta})
      : _data = data;

  factory _$DataPageDtoImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$DataPageDtoImplFromJson(json, fromJsonT);

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final Meta meta;

  @override
  String toString() {
    return 'DataPageDto<$T>(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPageDtoImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  /// Create a copy of DataPageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPageDtoImplCopyWith<T, _$DataPageDtoImpl<T>> get copyWith =>
      __$$DataPageDtoImplCopyWithImpl<T, _$DataPageDtoImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DataPageDtoImplToJson<T>(this, toJsonT);
  }
}

abstract class _DataPageDto<T> implements DataPageDto<T> {
  const factory _DataPageDto(
      {required final List<T> data,
      required final Meta meta}) = _$DataPageDtoImpl<T>;

  factory _DataPageDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$DataPageDtoImpl<T>.fromJson;

  @override
  List<T> get data;
  @override
  Meta get meta;

  /// Create a copy of DataPageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataPageDtoImplCopyWith<T, _$DataPageDtoImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
