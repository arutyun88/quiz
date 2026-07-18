// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_in_level')
  int get experienceInLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'level_experience')
  int get levelExperience => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_days')
  int get streakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_streak_days')
  int get bestStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions_answered')
  int get questionsAnswered => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answers')
  int get correctAnswers => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points')
  int get totalPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_since')
  DateTime get memberSince => throw _privateConstructorUsedError;
  @JsonKey(name: 'achievements_unlocked')
  int get achievementsUnlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'achievements_total')
  int get achievementsTotal => throw _privateConstructorUsedError;
  SubscriptionDto? get subscription => throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {String id,
      String? email,
      String? name,
      @JsonKey(name: 'birth_date') DateTime? birthDate,
      int level,
      @JsonKey(name: 'experience_in_level') int experienceInLevel,
      @JsonKey(name: 'level_experience') int levelExperience,
      @JsonKey(name: 'streak_days') int streakDays,
      @JsonKey(name: 'best_streak_days') int bestStreakDays,
      @JsonKey(name: 'questions_answered') int questionsAnswered,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      double accuracy,
      @JsonKey(name: 'total_points') int totalPoints,
      @JsonKey(name: 'member_since') DateTime memberSince,
      @JsonKey(name: 'achievements_unlocked') int achievementsUnlocked,
      @JsonKey(name: 'achievements_total') int achievementsTotal,
      SubscriptionDto? subscription});

  $SubscriptionDtoCopyWith<$Res>? get subscription;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
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
              as SubscriptionDto?,
    ) as $Val);
  }

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionDtoCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $SubscriptionDtoCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? email,
      String? name,
      @JsonKey(name: 'birth_date') DateTime? birthDate,
      int level,
      @JsonKey(name: 'experience_in_level') int experienceInLevel,
      @JsonKey(name: 'level_experience') int levelExperience,
      @JsonKey(name: 'streak_days') int streakDays,
      @JsonKey(name: 'best_streak_days') int bestStreakDays,
      @JsonKey(name: 'questions_answered') int questionsAnswered,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      double accuracy,
      @JsonKey(name: 'total_points') int totalPoints,
      @JsonKey(name: 'member_since') DateTime memberSince,
      @JsonKey(name: 'achievements_unlocked') int achievementsUnlocked,
      @JsonKey(name: 'achievements_total') int achievementsTotal,
      SubscriptionDto? subscription});

  @override
  $SubscriptionDtoCopyWith<$Res>? get subscription;
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDto
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
    return _then(_$UserDtoImpl(
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
              as SubscriptionDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl implements _UserDto {
  const _$UserDtoImpl(
      {required this.id,
      this.email,
      this.name,
      @JsonKey(name: 'birth_date') this.birthDate,
      required this.level,
      @JsonKey(name: 'experience_in_level') required this.experienceInLevel,
      @JsonKey(name: 'level_experience') required this.levelExperience,
      @JsonKey(name: 'streak_days') required this.streakDays,
      @JsonKey(name: 'best_streak_days') required this.bestStreakDays,
      @JsonKey(name: 'questions_answered') required this.questionsAnswered,
      @JsonKey(name: 'correct_answers') required this.correctAnswers,
      required this.accuracy,
      @JsonKey(name: 'total_points') required this.totalPoints,
      @JsonKey(name: 'member_since') required this.memberSince,
      @JsonKey(name: 'achievements_unlocked')
      required this.achievementsUnlocked,
      @JsonKey(name: 'achievements_total') required this.achievementsTotal,
      this.subscription});

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? name;
  @override
  @JsonKey(name: 'birth_date')
  final DateTime? birthDate;
  @override
  final int level;
  @override
  @JsonKey(name: 'experience_in_level')
  final int experienceInLevel;
  @override
  @JsonKey(name: 'level_experience')
  final int levelExperience;
  @override
  @JsonKey(name: 'streak_days')
  final int streakDays;
  @override
  @JsonKey(name: 'best_streak_days')
  final int bestStreakDays;
  @override
  @JsonKey(name: 'questions_answered')
  final int questionsAnswered;
  @override
  @JsonKey(name: 'correct_answers')
  final int correctAnswers;
  @override
  final double accuracy;
  @override
  @JsonKey(name: 'total_points')
  final int totalPoints;
  @override
  @JsonKey(name: 'member_since')
  final DateTime memberSince;
  @override
  @JsonKey(name: 'achievements_unlocked')
  final int achievementsUnlocked;
  @override
  @JsonKey(name: 'achievements_total')
  final int achievementsTotal;
  @override
  final SubscriptionDto? subscription;

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, name: $name, birthDate: $birthDate, level: $level, experienceInLevel: $experienceInLevel, levelExperience: $levelExperience, streakDays: $streakDays, bestStreakDays: $bestStreakDays, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, accuracy: $accuracy, totalPoints: $totalPoints, memberSince: $memberSince, achievementsUnlocked: $achievementsUnlocked, achievementsTotal: $achievementsTotal, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto(
      {required final String id,
      final String? email,
      final String? name,
      @JsonKey(name: 'birth_date') final DateTime? birthDate,
      required final int level,
      @JsonKey(name: 'experience_in_level')
      required final int experienceInLevel,
      @JsonKey(name: 'level_experience') required final int levelExperience,
      @JsonKey(name: 'streak_days') required final int streakDays,
      @JsonKey(name: 'best_streak_days') required final int bestStreakDays,
      @JsonKey(name: 'questions_answered') required final int questionsAnswered,
      @JsonKey(name: 'correct_answers') required final int correctAnswers,
      required final double accuracy,
      @JsonKey(name: 'total_points') required final int totalPoints,
      @JsonKey(name: 'member_since') required final DateTime memberSince,
      @JsonKey(name: 'achievements_unlocked')
      required final int achievementsUnlocked,
      @JsonKey(name: 'achievements_total') required final int achievementsTotal,
      final SubscriptionDto? subscription}) = _$UserDtoImpl;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get name;
  @override
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate;
  @override
  int get level;
  @override
  @JsonKey(name: 'experience_in_level')
  int get experienceInLevel;
  @override
  @JsonKey(name: 'level_experience')
  int get levelExperience;
  @override
  @JsonKey(name: 'streak_days')
  int get streakDays;
  @override
  @JsonKey(name: 'best_streak_days')
  int get bestStreakDays;
  @override
  @JsonKey(name: 'questions_answered')
  int get questionsAnswered;
  @override
  @JsonKey(name: 'correct_answers')
  int get correctAnswers;
  @override
  double get accuracy;
  @override
  @JsonKey(name: 'total_points')
  int get totalPoints;
  @override
  @JsonKey(name: 'member_since')
  DateTime get memberSince;
  @override
  @JsonKey(name: 'achievements_unlocked')
  int get achievementsUnlocked;
  @override
  @JsonKey(name: 'achievements_total')
  int get achievementsTotal;
  @override
  SubscriptionDto? get subscription;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
