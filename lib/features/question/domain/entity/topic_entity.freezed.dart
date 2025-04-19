// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopicEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of TopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopicEntityCopyWith<TopicEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicEntityCopyWith<$Res> {
  factory $TopicEntityCopyWith(
          TopicEntity value, $Res Function(TopicEntity) then) =
      _$TopicEntityCopyWithImpl<$Res, TopicEntity>;
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class _$TopicEntityCopyWithImpl<$Res, $Val extends TopicEntity>
    implements $TopicEntityCopyWith<$Res> {
  _$TopicEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopicEntity
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
abstract class _$$TopicEntityImplCopyWith<$Res>
    implements $TopicEntityCopyWith<$Res> {
  factory _$$TopicEntityImplCopyWith(
          _$TopicEntityImpl value, $Res Function(_$TopicEntityImpl) then) =
      __$$TopicEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class __$$TopicEntityImplCopyWithImpl<$Res>
    extends _$TopicEntityCopyWithImpl<$Res, _$TopicEntityImpl>
    implements _$$TopicEntityImplCopyWith<$Res> {
  __$$TopicEntityImplCopyWithImpl(
      _$TopicEntityImpl _value, $Res Function(_$TopicEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$TopicEntityImpl(
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

class _$TopicEntityImpl implements _TopicEntity {
  const _$TopicEntityImpl(
      {required this.id, required this.name, required this.description});

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'TopicEntity(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of TopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicEntityImplCopyWith<_$TopicEntityImpl> get copyWith =>
      __$$TopicEntityImplCopyWithImpl<_$TopicEntityImpl>(this, _$identity);
}

abstract class _TopicEntity implements TopicEntity {
  const factory _TopicEntity(
      {required final String id,
      required final String name,
      required final String description}) = _$TopicEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of TopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopicEntityImplCopyWith<_$TopicEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
