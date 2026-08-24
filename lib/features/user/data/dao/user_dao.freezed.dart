// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDao _$UserDaoFromJson(Map<String, dynamic> json) {
  return _UserDao.fromJson(json);
}

/// @nodoc
mixin _$UserDao {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  AgeAccessDao? get ageAccess => throw _privateConstructorUsedError;
  String? get timezoneId => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get experienceInLevel => throw _privateConstructorUsedError;
  int get levelExperience => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  int get bestStreakDays => throw _privateConstructorUsedError;
  int get questionsAnswered => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  String get memberSinceIso => throw _privateConstructorUsedError;
  int get achievementsUnlocked => throw _privateConstructorUsedError;
  int get achievementsTotal => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  int get bestRating => throw _privateConstructorUsedError;
  int get ratingOfficialAnswers => throw _privateConstructorUsedError;
  bool get ratingProvisional => throw _privateConstructorUsedError;

  /// Serializes this UserDao to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDao
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDaoCopyWith<UserDao> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDaoCopyWith<$Res> {
  factory $UserDaoCopyWith(UserDao value, $Res Function(UserDao) then) =
      _$UserDaoCopyWithImpl<$Res, UserDao>;
  @useResult
  $Res call(
      {String id,
      String? email,
      String? name,
      AgeAccessDao? ageAccess,
      String? timezoneId,
      int level,
      int experienceInLevel,
      int levelExperience,
      int streakDays,
      int bestStreakDays,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int totalPoints,
      String memberSinceIso,
      int achievementsUnlocked,
      int achievementsTotal,
      int rating,
      int bestRating,
      int ratingOfficialAnswers,
      bool ratingProvisional});
}

/// @nodoc
class _$UserDaoCopyWithImpl<$Res, $Val extends UserDao>
    implements $UserDaoCopyWith<$Res> {
  _$UserDaoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDao
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? ageAccess = freezed,
    Object? timezoneId = freezed,
    Object? level = null,
    Object? experienceInLevel = null,
    Object? levelExperience = null,
    Object? streakDays = null,
    Object? bestStreakDays = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? totalPoints = null,
    Object? memberSinceIso = null,
    Object? achievementsUnlocked = null,
    Object? achievementsTotal = null,
    Object? rating = null,
    Object? bestRating = null,
    Object? ratingOfficialAnswers = null,
    Object? ratingProvisional = null,
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
      ageAccess: freezed == ageAccess
          ? _value.ageAccess
          : ageAccess // ignore: cast_nullable_to_non_nullable
              as AgeAccessDao?,
      timezoneId: freezed == timezoneId
          ? _value.timezoneId
          : timezoneId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      memberSinceIso: null == memberSinceIso
          ? _value.memberSinceIso
          : memberSinceIso // ignore: cast_nullable_to_non_nullable
              as String,
      achievementsUnlocked: null == achievementsUnlocked
          ? _value.achievementsUnlocked
          : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      achievementsTotal: null == achievementsTotal
          ? _value.achievementsTotal
          : achievementsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      bestRating: null == bestRating
          ? _value.bestRating
          : bestRating // ignore: cast_nullable_to_non_nullable
              as int,
      ratingOfficialAnswers: null == ratingOfficialAnswers
          ? _value.ratingOfficialAnswers
          : ratingOfficialAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      ratingProvisional: null == ratingProvisional
          ? _value.ratingProvisional
          : ratingProvisional // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDaoImplCopyWith<$Res> implements $UserDaoCopyWith<$Res> {
  factory _$$UserDaoImplCopyWith(
          _$UserDaoImpl value, $Res Function(_$UserDaoImpl) then) =
      __$$UserDaoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? email,
      String? name,
      AgeAccessDao? ageAccess,
      String? timezoneId,
      int level,
      int experienceInLevel,
      int levelExperience,
      int streakDays,
      int bestStreakDays,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int totalPoints,
      String memberSinceIso,
      int achievementsUnlocked,
      int achievementsTotal,
      int rating,
      int bestRating,
      int ratingOfficialAnswers,
      bool ratingProvisional});
}

/// @nodoc
class __$$UserDaoImplCopyWithImpl<$Res>
    extends _$UserDaoCopyWithImpl<$Res, _$UserDaoImpl>
    implements _$$UserDaoImplCopyWith<$Res> {
  __$$UserDaoImplCopyWithImpl(
      _$UserDaoImpl _value, $Res Function(_$UserDaoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDao
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? ageAccess = freezed,
    Object? timezoneId = freezed,
    Object? level = null,
    Object? experienceInLevel = null,
    Object? levelExperience = null,
    Object? streakDays = null,
    Object? bestStreakDays = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? totalPoints = null,
    Object? memberSinceIso = null,
    Object? achievementsUnlocked = null,
    Object? achievementsTotal = null,
    Object? rating = null,
    Object? bestRating = null,
    Object? ratingOfficialAnswers = null,
    Object? ratingProvisional = null,
  }) {
    return _then(_$UserDaoImpl(
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
      ageAccess: freezed == ageAccess
          ? _value.ageAccess
          : ageAccess // ignore: cast_nullable_to_non_nullable
              as AgeAccessDao?,
      timezoneId: freezed == timezoneId
          ? _value.timezoneId
          : timezoneId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      memberSinceIso: null == memberSinceIso
          ? _value.memberSinceIso
          : memberSinceIso // ignore: cast_nullable_to_non_nullable
              as String,
      achievementsUnlocked: null == achievementsUnlocked
          ? _value.achievementsUnlocked
          : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      achievementsTotal: null == achievementsTotal
          ? _value.achievementsTotal
          : achievementsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      bestRating: null == bestRating
          ? _value.bestRating
          : bestRating // ignore: cast_nullable_to_non_nullable
              as int,
      ratingOfficialAnswers: null == ratingOfficialAnswers
          ? _value.ratingOfficialAnswers
          : ratingOfficialAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      ratingProvisional: null == ratingProvisional
          ? _value.ratingProvisional
          : ratingProvisional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDaoImpl extends _UserDao {
  const _$UserDaoImpl(
      {required this.id,
      this.email,
      this.name,
      this.ageAccess,
      this.timezoneId,
      required this.level,
      required this.experienceInLevel,
      required this.levelExperience,
      required this.streakDays,
      required this.bestStreakDays,
      required this.questionsAnswered,
      required this.correctAnswers,
      required this.accuracy,
      required this.totalPoints,
      required this.memberSinceIso,
      required this.achievementsUnlocked,
      required this.achievementsTotal,
      this.rating = 1000,
      this.bestRating = 1000,
      this.ratingOfficialAnswers = 0,
      this.ratingProvisional = true})
      : super._();

  factory _$UserDaoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDaoImplFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final AgeAccessDao? ageAccess;
  @override
  final String? timezoneId;
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
  final String memberSinceIso;
  @override
  final int achievementsUnlocked;
  @override
  final int achievementsTotal;
  @override
  @JsonKey()
  final int rating;
  @override
  @JsonKey()
  final int bestRating;
  @override
  @JsonKey()
  final int ratingOfficialAnswers;
  @override
  @JsonKey()
  final bool ratingProvisional;

  @override
  String toString() {
    return 'UserDao(id: $id, email: $email, name: $name, ageAccess: $ageAccess, timezoneId: $timezoneId, level: $level, experienceInLevel: $experienceInLevel, levelExperience: $levelExperience, streakDays: $streakDays, bestStreakDays: $bestStreakDays, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, accuracy: $accuracy, totalPoints: $totalPoints, memberSinceIso: $memberSinceIso, achievementsUnlocked: $achievementsUnlocked, achievementsTotal: $achievementsTotal, rating: $rating, bestRating: $bestRating, ratingOfficialAnswers: $ratingOfficialAnswers, ratingProvisional: $ratingProvisional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDaoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ageAccess, ageAccess) ||
                other.ageAccess == ageAccess) &&
            (identical(other.timezoneId, timezoneId) ||
                other.timezoneId == timezoneId) &&
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
            (identical(other.memberSinceIso, memberSinceIso) ||
                other.memberSinceIso == memberSinceIso) &&
            (identical(other.achievementsUnlocked, achievementsUnlocked) ||
                other.achievementsUnlocked == achievementsUnlocked) &&
            (identical(other.achievementsTotal, achievementsTotal) ||
                other.achievementsTotal == achievementsTotal) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.bestRating, bestRating) ||
                other.bestRating == bestRating) &&
            (identical(other.ratingOfficialAnswers, ratingOfficialAnswers) ||
                other.ratingOfficialAnswers == ratingOfficialAnswers) &&
            (identical(other.ratingProvisional, ratingProvisional) ||
                other.ratingProvisional == ratingProvisional));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        email,
        name,
        ageAccess,
        timezoneId,
        level,
        experienceInLevel,
        levelExperience,
        streakDays,
        bestStreakDays,
        questionsAnswered,
        correctAnswers,
        accuracy,
        totalPoints,
        memberSinceIso,
        achievementsUnlocked,
        achievementsTotal,
        rating,
        bestRating,
        ratingOfficialAnswers,
        ratingProvisional
      ]);

  /// Create a copy of UserDao
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDaoImplCopyWith<_$UserDaoImpl> get copyWith =>
      __$$UserDaoImplCopyWithImpl<_$UserDaoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDaoImplToJson(
      this,
    );
  }
}

abstract class _UserDao extends UserDao {
  const factory _UserDao(
      {required final String id,
      final String? email,
      final String? name,
      final AgeAccessDao? ageAccess,
      final String? timezoneId,
      required final int level,
      required final int experienceInLevel,
      required final int levelExperience,
      required final int streakDays,
      required final int bestStreakDays,
      required final int questionsAnswered,
      required final int correctAnswers,
      required final double accuracy,
      required final int totalPoints,
      required final String memberSinceIso,
      required final int achievementsUnlocked,
      required final int achievementsTotal,
      final int rating,
      final int bestRating,
      final int ratingOfficialAnswers,
      final bool ratingProvisional}) = _$UserDaoImpl;
  const _UserDao._() : super._();

  factory _UserDao.fromJson(Map<String, dynamic> json) = _$UserDaoImpl.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get name;
  @override
  AgeAccessDao? get ageAccess;
  @override
  String? get timezoneId;
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
  String get memberSinceIso;
  @override
  int get achievementsUnlocked;
  @override
  int get achievementsTotal;
  @override
  int get rating;
  @override
  int get bestRating;
  @override
  int get ratingOfficialAnswers;
  @override
  bool get ratingProvisional;

  /// Create a copy of UserDao
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDaoImplCopyWith<_$UserDaoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
