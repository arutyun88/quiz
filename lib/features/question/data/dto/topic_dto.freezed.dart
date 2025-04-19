// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopicDto _$TopicDtoFromJson(Map<String, dynamic> json) {
  return _TopicDto.fromJson(json);
}

/// @nodoc
mixin _$TopicDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this TopicDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopicDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopicDtoCopyWith<TopicDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicDtoCopyWith<$Res> {
  factory $TopicDtoCopyWith(TopicDto value, $Res Function(TopicDto) then) =
      _$TopicDtoCopyWithImpl<$Res, TopicDto>;
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class _$TopicDtoCopyWithImpl<$Res, $Val extends TopicDto>
    implements $TopicDtoCopyWith<$Res> {
  _$TopicDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopicDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicDtoImplCopyWith<$Res>
    implements $TopicDtoCopyWith<$Res> {
  factory _$$TopicDtoImplCopyWith(
          _$TopicDtoImpl value, $Res Function(_$TopicDtoImpl) then) =
      __$$TopicDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class __$$TopicDtoImplCopyWithImpl<$Res>
    extends _$TopicDtoCopyWithImpl<$Res, _$TopicDtoImpl>
    implements _$$TopicDtoImplCopyWith<$Res> {
  __$$TopicDtoImplCopyWithImpl(
      _$TopicDtoImpl _value, $Res Function(_$TopicDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopicDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$TopicDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicDtoImpl implements _TopicDto {
  const _$TopicDtoImpl(
      {required this.id, required this.name, required this.description});

  factory _$TopicDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'TopicDto(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of TopicDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicDtoImplCopyWith<_$TopicDtoImpl> get copyWith =>
      __$$TopicDtoImplCopyWithImpl<_$TopicDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicDtoImplToJson(
      this,
    );
  }
}

abstract class _TopicDto implements TopicDto {
  const factory _TopicDto(
      {required final String id,
      required final String name,
      required final String description}) = _$TopicDtoImpl;

  factory _TopicDto.fromJson(Map<String, dynamic> json) =
      _$TopicDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of TopicDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopicDtoImplCopyWith<_$TopicDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
