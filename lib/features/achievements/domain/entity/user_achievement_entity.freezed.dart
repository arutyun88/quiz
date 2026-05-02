// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_achievement_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAchievementEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;

  /// Create a copy of UserAchievementEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAchievementEntityCopyWith<UserAchievementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementEntityCopyWith<$Res> {
  factory $UserAchievementEntityCopyWith(UserAchievementEntity value,
          $Res Function(UserAchievementEntity) then) =
      _$UserAchievementEntityCopyWithImpl<$Res, UserAchievementEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String category,
      int? points});
}

/// @nodoc
class _$UserAchievementEntityCopyWithImpl<$Res,
        $Val extends UserAchievementEntity>
    implements $UserAchievementEntityCopyWith<$Res> {
  _$UserAchievementEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAchievementEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? points = freezed,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAchievementEntityImplCopyWith<$Res>
    implements $UserAchievementEntityCopyWith<$Res> {
  factory _$$UserAchievementEntityImplCopyWith(
          _$UserAchievementEntityImpl value,
          $Res Function(_$UserAchievementEntityImpl) then) =
      __$$UserAchievementEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String category,
      int? points});
}

/// @nodoc
class __$$UserAchievementEntityImplCopyWithImpl<$Res>
    extends _$UserAchievementEntityCopyWithImpl<$Res,
        _$UserAchievementEntityImpl>
    implements _$$UserAchievementEntityImplCopyWith<$Res> {
  __$$UserAchievementEntityImplCopyWithImpl(_$UserAchievementEntityImpl _value,
      $Res Function(_$UserAchievementEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAchievementEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? points = freezed,
  }) {
    return _then(_$UserAchievementEntityImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$UserAchievementEntityImpl implements _UserAchievementEntity {
  const _$UserAchievementEntityImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      this.points});

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String category;
  @override
  final int? points;

  @override
  String toString() {
    return 'UserAchievementEntity(id: $id, name: $name, description: $description, category: $category, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAchievementEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.points, points) || other.points == points));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, category, points);

  /// Create a copy of UserAchievementEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAchievementEntityImplCopyWith<_$UserAchievementEntityImpl>
      get copyWith => __$$UserAchievementEntityImplCopyWithImpl<
          _$UserAchievementEntityImpl>(this, _$identity);
}

abstract class _UserAchievementEntity implements UserAchievementEntity {
  const factory _UserAchievementEntity(
      {required final String id,
      required final String name,
      required final String description,
      required final String category,
      final int? points}) = _$UserAchievementEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get category;
  @override
  int? get points;

  /// Create a copy of UserAchievementEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAchievementEntityImplCopyWith<_$UserAchievementEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
