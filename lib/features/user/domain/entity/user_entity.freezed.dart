// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get experienceInLevel => throw _privateConstructorUsedError;
  int get levelExperience => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  int get bestStreakDays => throw _privateConstructorUsedError;
  int get questionsAnswered => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  DateTime get memberSince => throw _privateConstructorUsedError;
  int get achievementsUnlocked => throw _privateConstructorUsedError;
  int get achievementsTotal => throw _privateConstructorUsedError;
  SubscriptionEntity? get subscription => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String id,
      String? email,
      String? name,
      DateTime? birthDate,
      int level,
      int experienceInLevel,
      int levelExperience,
      int streakDays,
      int bestStreakDays,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int totalPoints,
      DateTime memberSince,
      int achievementsUnlocked,
      int achievementsTotal,
      SubscriptionEntity? subscription});

  $SubscriptionEntityCopyWith<$Res>? get subscription;
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? birthDate = freezed,
    Object? level = null,
    Object? experienceInLevel = null,
    Object? levelExperience = null,
    Object? streakDays = null,
    Object? bestStreakDays = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? totalPoints = null,
    Object? memberSince = null,
    Object? achievementsUnlocked = null,
    Object? achievementsTotal = null,
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      experienceInLevel: null == experienceInLevel
          ? _value.experienceInLevel
          : experienceInLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelExperience: null == levelExperience
          ? _value.levelExperience
          : levelExperience // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreakDays: null == bestStreakDays
          ? _value.bestStreakDays
          : bestStreakDays // ignore: cast_nullable_to_non_nullable
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
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      memberSince: null == memberSince
          ? _value.memberSince
          : memberSince // ignore: cast_nullable_to_non_nullable
              as DateTime,
      achievementsUnlocked: null == achievementsUnlocked
          ? _value.achievementsUnlocked
          : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      achievementsTotal: null == achievementsTotal
          ? _value.achievementsTotal
          : achievementsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionEntity?,
    ) as $Val);
  }

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionEntityCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $SubscriptionEntityCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? email,
      String? name,
      DateTime? birthDate,
      int level,
      int experienceInLevel,
      int levelExperience,
      int streakDays,
      int bestStreakDays,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int totalPoints,
      DateTime memberSince,
      int achievementsUnlocked,
      int achievementsTotal,
      SubscriptionEntity? subscription});

  @override
  $SubscriptionEntityCopyWith<$Res>? get subscription;
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? birthDate = freezed,
    Object? level = null,
    Object? experienceInLevel = null,
    Object? levelExperience = null,
    Object? streakDays = null,
    Object? bestStreakDays = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? totalPoints = null,
    Object? memberSince = null,
    Object? achievementsUnlocked = null,
    Object? achievementsTotal = null,
    Object? subscription = freezed,
  }) {
    return _then(_$UserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      experienceInLevel: null == experienceInLevel
          ? _value.experienceInLevel
          : experienceInLevel // ignore: cast_nullable_to_non_nullable
              as int,
      levelExperience: null == levelExperience
          ? _value.levelExperience
          : levelExperience // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreakDays: null == bestStreakDays
          ? _value.bestStreakDays
          : bestStreakDays // ignore: cast_nullable_to_non_nullable
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
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      memberSince: null == memberSince
          ? _value.memberSince
          : memberSince // ignore: cast_nullable_to_non_nullable
              as DateTime,
      achievementsUnlocked: null == achievementsUnlocked
          ? _value.achievementsUnlocked
          : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      achievementsTotal: null == achievementsTotal
          ? _value.achievementsTotal
          : achievementsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionEntity?,
    ));
  }
}

/// @nodoc

class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl(
      {required this.id,
      required this.email,
      required this.name,
      required this.birthDate,
      required this.level,
      required this.experienceInLevel,
      required this.levelExperience,
      required this.streakDays,
      required this.bestStreakDays,
      required this.questionsAnswered,
      required this.correctAnswers,
      required this.accuracy,
      required this.totalPoints,
      required this.memberSince,
      required this.achievementsUnlocked,
      required this.achievementsTotal,
      this.subscription});

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final DateTime? birthDate;
  @override
  final int level;
  @override
  final int experienceInLevel;
  @override
  final int levelExperience;
  @override
  final int streakDays;
  @override
  final int bestStreakDays;
  @override
  final int questionsAnswered;
  @override
  final int correctAnswers;
  @override
  final double accuracy;
  @override
  final int totalPoints;
  @override
  final DateTime memberSince;
  @override
  final int achievementsUnlocked;
  @override
  final int achievementsTotal;
  @override
  final SubscriptionEntity? subscription;

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, name: $name, birthDate: $birthDate, level: $level, experienceInLevel: $experienceInLevel, levelExperience: $levelExperience, streakDays: $streakDays, bestStreakDays: $bestStreakDays, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, accuracy: $accuracy, totalPoints: $totalPoints, memberSince: $memberSince, achievementsUnlocked: $achievementsUnlocked, achievementsTotal: $achievementsTotal, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.experienceInLevel, experienceInLevel) ||
                other.experienceInLevel == experienceInLevel) &&
            (identical(other.levelExperience, levelExperience) ||
                other.levelExperience == levelExperience) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.bestStreakDays, bestStreakDays) ||
                other.bestStreakDays == bestStreakDays) &&
            (identical(other.questionsAnswered, questionsAnswered) ||
                other.questionsAnswered == questionsAnswered) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.memberSince, memberSince) ||
                other.memberSince == memberSince) &&
            (identical(other.achievementsUnlocked, achievementsUnlocked) ||
                other.achievementsUnlocked == achievementsUnlocked) &&
            (identical(other.achievementsTotal, achievementsTotal) ||
                other.achievementsTotal == achievementsTotal) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      name,
      birthDate,
      level,
      experienceInLevel,
      levelExperience,
      streakDays,
      bestStreakDays,
      questionsAnswered,
      correctAnswers,
      accuracy,
      totalPoints,
      memberSince,
      achievementsUnlocked,
      achievementsTotal,
      subscription);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {required final String id,
      required final String? email,
      required final String? name,
      required final DateTime? birthDate,
      required final int level,
      required final int experienceInLevel,
      required final int levelExperience,
      required final int streakDays,
      required final int bestStreakDays,
      required final int questionsAnswered,
      required final int correctAnswers,
      required final double accuracy,
      required final int totalPoints,
      required final DateTime memberSince,
      required final int achievementsUnlocked,
      required final int achievementsTotal,
      final SubscriptionEntity? subscription}) = _$UserEntityImpl;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get name;
  @override
  DateTime? get birthDate;
  @override
  int get level;
  @override
  int get experienceInLevel;
  @override
  int get levelExperience;
  @override
  int get streakDays;
  @override
  int get bestStreakDays;
  @override
  int get questionsAnswered;
  @override
  int get correctAnswers;
  @override
  double get accuracy;
  @override
  int get totalPoints;
  @override
  DateTime get memberSince;
  @override
  int get achievementsUnlocked;
  @override
  int get achievementsTotal;
  @override
  SubscriptionEntity? get subscription;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
