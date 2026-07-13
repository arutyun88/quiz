// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_achievement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAchievementDto _$UserAchievementDtoFromJson(Map<String, dynamic> json) {
  return _UserAchievementDto.fromJson(json);
}

/// @nodoc
mixin _$UserAchievementDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  bool get unlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlocked_at')
  DateTime? get unlockedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_current')
  int? get progressCurrent => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_target')
  int? get progressTarget => throw _privateConstructorUsedError;

  /// Serializes this UserAchievementDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAchievementDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAchievementDtoCopyWith<UserAchievementDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementDtoCopyWith<$Res> {
  factory $UserAchievementDtoCopyWith(
          UserAchievementDto value, $Res Function(UserAchievementDto) then) =
      _$UserAchievementDtoCopyWithImpl<$Res, UserAchievementDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String category,
      int? points,
      bool unlocked,
      @JsonKey(name: 'unlocked_at') DateTime? unlockedAt,
      @JsonKey(name: 'progress_current') int? progressCurrent,
      @JsonKey(name: 'progress_target') int? progressTarget});
}

/// @nodoc
class _$UserAchievementDtoCopyWithImpl<$Res, $Val extends UserAchievementDto>
    implements $UserAchievementDtoCopyWith<$Res> {
  _$UserAchievementDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAchievementDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? points = freezed,
    Object? unlocked = null,
    Object? unlockedAt = freezed,
    Object? progressCurrent = freezed,
    Object? progressTarget = freezed,
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
      unlocked: null == unlocked
          ? _value.unlocked
          : unlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      progressCurrent: freezed == progressCurrent
          ? _value.progressCurrent
          : progressCurrent // ignore: cast_nullable_to_non_nullable
              as int?,
      progressTarget: freezed == progressTarget
          ? _value.progressTarget
          : progressTarget // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAchievementDtoImplCopyWith<$Res>
    implements $UserAchievementDtoCopyWith<$Res> {
  factory _$$UserAchievementDtoImplCopyWith(_$UserAchievementDtoImpl value,
          $Res Function(_$UserAchievementDtoImpl) then) =
      __$$UserAchievementDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String category,
      int? points,
      bool unlocked,
      @JsonKey(name: 'unlocked_at') DateTime? unlockedAt,
      @JsonKey(name: 'progress_current') int? progressCurrent,
      @JsonKey(name: 'progress_target') int? progressTarget});
}

/// @nodoc
class __$$UserAchievementDtoImplCopyWithImpl<$Res>
    extends _$UserAchievementDtoCopyWithImpl<$Res, _$UserAchievementDtoImpl>
    implements _$$UserAchievementDtoImplCopyWith<$Res> {
  __$$UserAchievementDtoImplCopyWithImpl(_$UserAchievementDtoImpl _value,
      $Res Function(_$UserAchievementDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAchievementDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? points = freezed,
    Object? unlocked = null,
    Object? unlockedAt = freezed,
    Object? progressCurrent = freezed,
    Object? progressTarget = freezed,
  }) {
    return _then(_$UserAchievementDtoImpl(
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
      unlocked: null == unlocked
          ? _value.unlocked
          : unlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      progressCurrent: freezed == progressCurrent
          ? _value.progressCurrent
          : progressCurrent // ignore: cast_nullable_to_non_nullable
              as int?,
      progressTarget: freezed == progressTarget
          ? _value.progressTarget
          : progressTarget // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAchievementDtoImpl implements _UserAchievementDto {
  const _$UserAchievementDtoImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      this.points,
      this.unlocked = false,
      @JsonKey(name: 'unlocked_at') this.unlockedAt,
      @JsonKey(name: 'progress_current') this.progressCurrent,
      @JsonKey(name: 'progress_target') this.progressTarget});

  factory _$UserAchievementDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAchievementDtoImplFromJson(json);

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
  @JsonKey()
  final bool unlocked;
  @override
  @JsonKey(name: 'unlocked_at')
  final DateTime? unlockedAt;
  @override
  @JsonKey(name: 'progress_current')
  final int? progressCurrent;
  @override
  @JsonKey(name: 'progress_target')
  final int? progressTarget;

  @override
  String toString() {
    return 'UserAchievementDto(id: $id, name: $name, description: $description, category: $category, points: $points, unlocked: $unlocked, unlockedAt: $unlockedAt, progressCurrent: $progressCurrent, progressTarget: $progressTarget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAchievementDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.unlocked, unlocked) ||
                other.unlocked == unlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.progressCurrent, progressCurrent) ||
                other.progressCurrent == progressCurrent) &&
            (identical(other.progressTarget, progressTarget) ||
                other.progressTarget == progressTarget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, category,
      points, unlocked, unlockedAt, progressCurrent, progressTarget);

  /// Create a copy of UserAchievementDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAchievementDtoImplCopyWith<_$UserAchievementDtoImpl> get copyWith =>
      __$$UserAchievementDtoImplCopyWithImpl<_$UserAchievementDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAchievementDtoImplToJson(
      this,
    );
  }
}

abstract class _UserAchievementDto implements UserAchievementDto {
  const factory _UserAchievementDto(
          {required final String id,
          required final String name,
          required final String description,
          required final String category,
          final int? points,
          final bool unlocked,
          @JsonKey(name: 'unlocked_at') final DateTime? unlockedAt,
          @JsonKey(name: 'progress_current') final int? progressCurrent,
          @JsonKey(name: 'progress_target') final int? progressTarget}) =
      _$UserAchievementDtoImpl;

  factory _UserAchievementDto.fromJson(Map<String, dynamic> json) =
      _$UserAchievementDtoImpl.fromJson;

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
  @override
  bool get unlocked;
  @override
  @JsonKey(name: 'unlocked_at')
  DateTime? get unlockedAt;
  @override
  @JsonKey(name: 'progress_current')
  int? get progressCurrent;
  @override
  @JsonKey(name: 'progress_target')
  int? get progressTarget;

  /// Create a copy of UserAchievementDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAchievementDtoImplCopyWith<_$UserAchievementDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
