// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_level_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserLevelEntity {
  int get level => throw _privateConstructorUsedError;
  int get experience => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  int get questionsAnswered => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  StreakNoticeEntity? get streakNotice => throw _privateConstructorUsedError;

  /// Create a copy of UserLevelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserLevelEntityCopyWith<UserLevelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLevelEntityCopyWith<$Res> {
  factory $UserLevelEntityCopyWith(
          UserLevelEntity value, $Res Function(UserLevelEntity) then) =
      _$UserLevelEntityCopyWithImpl<$Res, UserLevelEntity>;
  @useResult
  $Res call(
      {int level,
      int experience,
      int totalPoints,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int streakDays,
      StreakNoticeEntity? streakNotice});

  $StreakNoticeEntityCopyWith<$Res>? get streakNotice;
}

/// @nodoc
class _$UserLevelEntityCopyWithImpl<$Res, $Val extends UserLevelEntity>
    implements $UserLevelEntityCopyWith<$Res> {
  _$UserLevelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserLevelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? experience = null,
    Object? totalPoints = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? streakDays = null,
    Object? streakNotice = freezed,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      questionsAnswered: null == questionsAnswered
          ? _value.questionsAnswered
          : questionsAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      streakNotice: freezed == streakNotice
          ? _value.streakNotice
          : streakNotice // ignore: cast_nullable_to_non_nullable
              as StreakNoticeEntity?,
    ) as $Val);
  }

  /// Create a copy of UserLevelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StreakNoticeEntityCopyWith<$Res>? get streakNotice {
    if (_value.streakNotice == null) {
      return null;
    }

    return $StreakNoticeEntityCopyWith<$Res>(_value.streakNotice!, (value) {
      return _then(_value.copyWith(streakNotice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserLevelEntityImplCopyWith<$Res>
    implements $UserLevelEntityCopyWith<$Res> {
  factory _$$UserLevelEntityImplCopyWith(_$UserLevelEntityImpl value,
          $Res Function(_$UserLevelEntityImpl) then) =
      __$$UserLevelEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int level,
      int experience,
      int totalPoints,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int streakDays,
      StreakNoticeEntity? streakNotice});

  @override
  $StreakNoticeEntityCopyWith<$Res>? get streakNotice;
}

/// @nodoc
class __$$UserLevelEntityImplCopyWithImpl<$Res>
    extends _$UserLevelEntityCopyWithImpl<$Res, _$UserLevelEntityImpl>
    implements _$$UserLevelEntityImplCopyWith<$Res> {
  __$$UserLevelEntityImplCopyWithImpl(
      _$UserLevelEntityImpl _value, $Res Function(_$UserLevelEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserLevelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? experience = null,
    Object? totalPoints = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? streakDays = null,
    Object? streakNotice = freezed,
  }) {
    return _then(_$UserLevelEntityImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      questionsAnswered: null == questionsAnswered
          ? _value.questionsAnswered
          : questionsAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      streakNotice: freezed == streakNotice
          ? _value.streakNotice
          : streakNotice // ignore: cast_nullable_to_non_nullable
              as StreakNoticeEntity?,
    ));
  }
}

/// @nodoc

class _$UserLevelEntityImpl implements _UserLevelEntity {
  const _$UserLevelEntityImpl(
      {required this.level,
      required this.experience,
      required this.totalPoints,
      required this.questionsAnswered,
      required this.correctAnswers,
      required this.accuracy,
      required this.streakDays,
      required this.streakNotice});

  @override
  final int level;
  @override
  final int experience;
  @override
  final int totalPoints;
  @override
  final int questionsAnswered;
  @override
  final int correctAnswers;
  @override
  final double accuracy;
  @override
  final int streakDays;
  @override
  final StreakNoticeEntity? streakNotice;

  @override
  String toString() {
    return 'UserLevelEntity(level: $level, experience: $experience, totalPoints: $totalPoints, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, accuracy: $accuracy, streakDays: $streakDays, streakNotice: $streakNotice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLevelEntityImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.questionsAnswered, questionsAnswered) ||
                other.questionsAnswered == questionsAnswered) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.streakNotice, streakNotice) ||
                other.streakNotice == streakNotice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, experience, totalPoints,
      questionsAnswered, correctAnswers, accuracy, streakDays, streakNotice);

  /// Create a copy of UserLevelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLevelEntityImplCopyWith<_$UserLevelEntityImpl> get copyWith =>
      __$$UserLevelEntityImplCopyWithImpl<_$UserLevelEntityImpl>(
          this, _$identity);
}

abstract class _UserLevelEntity implements UserLevelEntity {
  const factory _UserLevelEntity(
      {required final int level,
      required final int experience,
      required final int totalPoints,
      required final int questionsAnswered,
      required final int correctAnswers,
      required final double accuracy,
      required final int streakDays,
      required final StreakNoticeEntity? streakNotice}) = _$UserLevelEntityImpl;

  @override
  int get level;
  @override
  int get experience;
  @override
  int get totalPoints;
  @override
  int get questionsAnswered;
  @override
  int get correctAnswers;
  @override
  double get accuracy;
  @override
  int get streakDays;
  @override
  StreakNoticeEntity? get streakNotice;

  /// Create a copy of UserLevelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLevelEntityImplCopyWith<_$UserLevelEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StreakNoticeEntity {
  StreakNoticeType get type => throw _privateConstructorUsedError;
  int get freezesLeft => throw _privateConstructorUsedError;
  int get freezesTotal => throw _privateConstructorUsedError;
  int get lostStreakDays => throw _privateConstructorUsedError;

  /// Create a copy of StreakNoticeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakNoticeEntityCopyWith<StreakNoticeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakNoticeEntityCopyWith<$Res> {
  factory $StreakNoticeEntityCopyWith(
          StreakNoticeEntity value, $Res Function(StreakNoticeEntity) then) =
      _$StreakNoticeEntityCopyWithImpl<$Res, StreakNoticeEntity>;
  @useResult
  $Res call(
      {StreakNoticeType type,
      int freezesLeft,
      int freezesTotal,
      int lostStreakDays});
}

/// @nodoc
class _$StreakNoticeEntityCopyWithImpl<$Res, $Val extends StreakNoticeEntity>
    implements $StreakNoticeEntityCopyWith<$Res> {
  _$StreakNoticeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreakNoticeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? freezesLeft = null,
    Object? freezesTotal = null,
    Object? lostStreakDays = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StreakNoticeType,
      freezesLeft: null == freezesLeft
          ? _value.freezesLeft
          : freezesLeft // ignore: cast_nullable_to_non_nullable
              as int,
      freezesTotal: null == freezesTotal
          ? _value.freezesTotal
          : freezesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      lostStreakDays: null == lostStreakDays
          ? _value.lostStreakDays
          : lostStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakNoticeEntityImplCopyWith<$Res>
    implements $StreakNoticeEntityCopyWith<$Res> {
  factory _$$StreakNoticeEntityImplCopyWith(_$StreakNoticeEntityImpl value,
          $Res Function(_$StreakNoticeEntityImpl) then) =
      __$$StreakNoticeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StreakNoticeType type,
      int freezesLeft,
      int freezesTotal,
      int lostStreakDays});
}

/// @nodoc
class __$$StreakNoticeEntityImplCopyWithImpl<$Res>
    extends _$StreakNoticeEntityCopyWithImpl<$Res, _$StreakNoticeEntityImpl>
    implements _$$StreakNoticeEntityImplCopyWith<$Res> {
  __$$StreakNoticeEntityImplCopyWithImpl(_$StreakNoticeEntityImpl _value,
      $Res Function(_$StreakNoticeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreakNoticeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? freezesLeft = null,
    Object? freezesTotal = null,
    Object? lostStreakDays = null,
  }) {
    return _then(_$StreakNoticeEntityImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StreakNoticeType,
      freezesLeft: null == freezesLeft
          ? _value.freezesLeft
          : freezesLeft // ignore: cast_nullable_to_non_nullable
              as int,
      freezesTotal: null == freezesTotal
          ? _value.freezesTotal
          : freezesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      lostStreakDays: null == lostStreakDays
          ? _value.lostStreakDays
          : lostStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StreakNoticeEntityImpl implements _StreakNoticeEntity {
  const _$StreakNoticeEntityImpl(
      {required this.type,
      required this.freezesLeft,
      required this.freezesTotal,
      required this.lostStreakDays});

  @override
  final StreakNoticeType type;
  @override
  final int freezesLeft;
  @override
  final int freezesTotal;
  @override
  final int lostStreakDays;

  @override
  String toString() {
    return 'StreakNoticeEntity(type: $type, freezesLeft: $freezesLeft, freezesTotal: $freezesTotal, lostStreakDays: $lostStreakDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakNoticeEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.freezesLeft, freezesLeft) ||
                other.freezesLeft == freezesLeft) &&
            (identical(other.freezesTotal, freezesTotal) ||
                other.freezesTotal == freezesTotal) &&
            (identical(other.lostStreakDays, lostStreakDays) ||
                other.lostStreakDays == lostStreakDays));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, freezesLeft, freezesTotal, lostStreakDays);

  /// Create a copy of StreakNoticeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakNoticeEntityImplCopyWith<_$StreakNoticeEntityImpl> get copyWith =>
      __$$StreakNoticeEntityImplCopyWithImpl<_$StreakNoticeEntityImpl>(
          this, _$identity);
}

abstract class _StreakNoticeEntity implements StreakNoticeEntity {
  const factory _StreakNoticeEntity(
      {required final StreakNoticeType type,
      required final int freezesLeft,
      required final int freezesTotal,
      required final int lostStreakDays}) = _$StreakNoticeEntityImpl;

  @override
  StreakNoticeType get type;
  @override
  int get freezesLeft;
  @override
  int get freezesTotal;
  @override
  int get lostStreakDays;

  /// Create a copy of StreakNoticeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakNoticeEntityImplCopyWith<_$StreakNoticeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
