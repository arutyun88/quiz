// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeaderboardEntity {
  String get userId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get questionsAnswered => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardEntityCopyWith<LeaderboardEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardEntityCopyWith<$Res> {
  factory $LeaderboardEntityCopyWith(
          LeaderboardEntity value, $Res Function(LeaderboardEntity) then) =
      _$LeaderboardEntityCopyWithImpl<$Res, LeaderboardEntity>;
  @useResult
  $Res call(
      {String userId,
      String email,
      String? name,
      int points,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int rank});
}

/// @nodoc
class _$LeaderboardEntityCopyWithImpl<$Res, $Val extends LeaderboardEntity>
    implements $LeaderboardEntityCopyWith<$Res> {
  _$LeaderboardEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? name = freezed,
    Object? points = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? rank = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
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
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardEntityImplCopyWith<$Res>
    implements $LeaderboardEntityCopyWith<$Res> {
  factory _$$LeaderboardEntityImplCopyWith(_$LeaderboardEntityImpl value,
          $Res Function(_$LeaderboardEntityImpl) then) =
      __$$LeaderboardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String email,
      String? name,
      int points,
      int questionsAnswered,
      int correctAnswers,
      double accuracy,
      int rank});
}

/// @nodoc
class __$$LeaderboardEntityImplCopyWithImpl<$Res>
    extends _$LeaderboardEntityCopyWithImpl<$Res, _$LeaderboardEntityImpl>
    implements _$$LeaderboardEntityImplCopyWith<$Res> {
  __$$LeaderboardEntityImplCopyWithImpl(_$LeaderboardEntityImpl _value,
      $Res Function(_$LeaderboardEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? name = freezed,
    Object? points = null,
    Object? questionsAnswered = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? rank = null,
  }) {
    return _then(_$LeaderboardEntityImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
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
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LeaderboardEntityImpl implements _LeaderboardEntity {
  const _$LeaderboardEntityImpl(
      {required this.userId,
      required this.email,
      this.name,
      required this.points,
      required this.questionsAnswered,
      required this.correctAnswers,
      required this.accuracy,
      required this.rank});

  @override
  final String userId;
  @override
  final String email;
  @override
  final String? name;
  @override
  final int points;
  @override
  final int questionsAnswered;
  @override
  final int correctAnswers;
  @override
  final double accuracy;
  @override
  final int rank;

  @override
  String toString() {
    return 'LeaderboardEntity(userId: $userId, email: $email, name: $name, points: $points, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, accuracy: $accuracy, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardEntityImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.questionsAnswered, questionsAnswered) ||
                other.questionsAnswered == questionsAnswered) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, email, name, points,
      questionsAnswered, correctAnswers, accuracy, rank);

  /// Create a copy of LeaderboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardEntityImplCopyWith<_$LeaderboardEntityImpl> get copyWith =>
      __$$LeaderboardEntityImplCopyWithImpl<_$LeaderboardEntityImpl>(
          this, _$identity);
}

abstract class _LeaderboardEntity implements LeaderboardEntity {
  const factory _LeaderboardEntity(
      {required final String userId,
      required final String email,
      final String? name,
      required final int points,
      required final int questionsAnswered,
      required final int correctAnswers,
      required final double accuracy,
      required final int rank}) = _$LeaderboardEntityImpl;

  @override
  String get userId;
  @override
  String get email;
  @override
  String? get name;
  @override
  int get points;
  @override
  int get questionsAnswered;
  @override
  int get correctAnswers;
  @override
  double get accuracy;
  @override
  int get rank;

  /// Create a copy of LeaderboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardEntityImplCopyWith<_$LeaderboardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
