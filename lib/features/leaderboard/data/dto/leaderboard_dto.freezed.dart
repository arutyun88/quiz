// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardDto _$LeaderboardDtoFromJson(Map<String, dynamic> json) {
  return _LeaderboardDto.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardDto {
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userEmail')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get points => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get questionsAnswered => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get correctAnswers => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0.0)
  double get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank', defaultValue: 0)
  int get rank => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardDtoCopyWith<LeaderboardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardDtoCopyWith<$Res> {
  factory $LeaderboardDtoCopyWith(
          LeaderboardDto value, $Res Function(LeaderboardDto) then) =
      _$LeaderboardDtoCopyWithImpl<$Res, LeaderboardDto>;
  @useResult
  $Res call(
      {String userId,
      @JsonKey(name: 'userEmail') String email,
      @JsonKey(name: 'userName') String? name,
      @JsonKey(defaultValue: 0) int points,
      @JsonKey(defaultValue: 0) int questionsAnswered,
      @JsonKey(defaultValue: 0) int correctAnswers,
      @JsonKey(defaultValue: 0.0) double accuracy,
      @JsonKey(name: 'rank', defaultValue: 0) int rank});
}

/// @nodoc
class _$LeaderboardDtoCopyWithImpl<$Res, $Val extends LeaderboardDto>
    implements $LeaderboardDtoCopyWith<$Res> {
  _$LeaderboardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardDto
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
abstract class _$$LeaderboardDtoImplCopyWith<$Res>
    implements $LeaderboardDtoCopyWith<$Res> {
  factory _$$LeaderboardDtoImplCopyWith(_$LeaderboardDtoImpl value,
          $Res Function(_$LeaderboardDtoImpl) then) =
      __$$LeaderboardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      @JsonKey(name: 'userEmail') String email,
      @JsonKey(name: 'userName') String? name,
      @JsonKey(defaultValue: 0) int points,
      @JsonKey(defaultValue: 0) int questionsAnswered,
      @JsonKey(defaultValue: 0) int correctAnswers,
      @JsonKey(defaultValue: 0.0) double accuracy,
      @JsonKey(name: 'rank', defaultValue: 0) int rank});
}

/// @nodoc
class __$$LeaderboardDtoImplCopyWithImpl<$Res>
    extends _$LeaderboardDtoCopyWithImpl<$Res, _$LeaderboardDtoImpl>
    implements _$$LeaderboardDtoImplCopyWith<$Res> {
  __$$LeaderboardDtoImplCopyWithImpl(
      _$LeaderboardDtoImpl _value, $Res Function(_$LeaderboardDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardDto
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
    return _then(_$LeaderboardDtoImpl(
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
@JsonSerializable()
class _$LeaderboardDtoImpl implements _LeaderboardDto {
  const _$LeaderboardDtoImpl(
      {required this.userId,
      @JsonKey(name: 'userEmail') required this.email,
      @JsonKey(name: 'userName') this.name,
      @JsonKey(defaultValue: 0) required this.points,
      @JsonKey(defaultValue: 0) required this.questionsAnswered,
      @JsonKey(defaultValue: 0) required this.correctAnswers,
      @JsonKey(defaultValue: 0.0) required this.accuracy,
      @JsonKey(name: 'rank', defaultValue: 0) required this.rank});

  factory _$LeaderboardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardDtoImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey(name: 'userEmail')
  final String email;
  @override
  @JsonKey(name: 'userName')
  final String? name;
  @override
  @JsonKey(defaultValue: 0)
  final int points;
  @override
  @JsonKey(defaultValue: 0)
  final int questionsAnswered;
  @override
  @JsonKey(defaultValue: 0)
  final int correctAnswers;
  @override
  @JsonKey(defaultValue: 0.0)
  final double accuracy;
  @override
  @JsonKey(name: 'rank', defaultValue: 0)
  final int rank;

  @override
  String toString() {
    return 'LeaderboardDto(userId: $userId, email: $email, name: $name, points: $points, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, accuracy: $accuracy, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardDtoImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, email, name, points,
      questionsAnswered, correctAnswers, accuracy, rank);

  /// Create a copy of LeaderboardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardDtoImplCopyWith<_$LeaderboardDtoImpl> get copyWith =>
      __$$LeaderboardDtoImplCopyWithImpl<_$LeaderboardDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardDtoImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardDto implements LeaderboardDto {
  const factory _LeaderboardDto(
          {required final String userId,
          @JsonKey(name: 'userEmail') required final String email,
          @JsonKey(name: 'userName') final String? name,
          @JsonKey(defaultValue: 0) required final int points,
          @JsonKey(defaultValue: 0) required final int questionsAnswered,
          @JsonKey(defaultValue: 0) required final int correctAnswers,
          @JsonKey(defaultValue: 0.0) required final double accuracy,
          @JsonKey(name: 'rank', defaultValue: 0) required final int rank}) =
      _$LeaderboardDtoImpl;

  factory _LeaderboardDto.fromJson(Map<String, dynamic> json) =
      _$LeaderboardDtoImpl.fromJson;

  @override
  String get userId;
  @override
  @JsonKey(name: 'userEmail')
  String get email;
  @override
  @JsonKey(name: 'userName')
  String? get name;
  @override
  @JsonKey(defaultValue: 0)
  int get points;
  @override
  @JsonKey(defaultValue: 0)
  int get questionsAnswered;
  @override
  @JsonKey(defaultValue: 0)
  int get correctAnswers;
  @override
  @JsonKey(defaultValue: 0.0)
  double get accuracy;
  @override
  @JsonKey(name: 'rank', defaultValue: 0)
  int get rank;

  /// Create a copy of LeaderboardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardDtoImplCopyWith<_$LeaderboardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
