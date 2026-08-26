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
  @JsonKey(name: 'season_id')
  String get seasonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_rating')
  int get bestRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'official_answers')
  int get officialAnswers => throw _privateConstructorUsedError;
  bool get provisional => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'season_id') String seasonId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'user_name') String? userName,
      int rating,
      @JsonKey(name: 'best_rating') int bestRating,
      @JsonKey(name: 'official_answers') int officialAnswers,
      bool provisional,
      int? rank});
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
    Object? seasonId = null,
    Object? userId = null,
    Object? userName = freezed,
    Object? rating = null,
    Object? bestRating = null,
    Object? officialAnswers = null,
    Object? provisional = null,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      seasonId: null == seasonId
          ? _value.seasonId
          : seasonId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      bestRating: null == bestRating
          ? _value.bestRating
          : bestRating // ignore: cast_nullable_to_non_nullable
              as int,
      officialAnswers: null == officialAnswers
          ? _value.officialAnswers
          : officialAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      provisional: null == provisional
          ? _value.provisional
          : provisional // ignore: cast_nullable_to_non_nullable
              as bool,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: 'season_id') String seasonId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'user_name') String? userName,
      int rating,
      @JsonKey(name: 'best_rating') int bestRating,
      @JsonKey(name: 'official_answers') int officialAnswers,
      bool provisional,
      int? rank});
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
    Object? seasonId = null,
    Object? userId = null,
    Object? userName = freezed,
    Object? rating = null,
    Object? bestRating = null,
    Object? officialAnswers = null,
    Object? provisional = null,
    Object? rank = freezed,
  }) {
    return _then(_$LeaderboardDtoImpl(
      seasonId: null == seasonId
          ? _value.seasonId
          : seasonId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      bestRating: null == bestRating
          ? _value.bestRating
          : bestRating // ignore: cast_nullable_to_non_nullable
              as int,
      officialAnswers: null == officialAnswers
          ? _value.officialAnswers
          : officialAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      provisional: null == provisional
          ? _value.provisional
          : provisional // ignore: cast_nullable_to_non_nullable
              as bool,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardDtoImpl implements _LeaderboardDto {
  const _$LeaderboardDtoImpl(
      {@JsonKey(name: 'season_id') required this.seasonId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'user_name') this.userName,
      required this.rating,
      @JsonKey(name: 'best_rating') required this.bestRating,
      @JsonKey(name: 'official_answers') required this.officialAnswers,
      required this.provisional,
      this.rank});

  factory _$LeaderboardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardDtoImplFromJson(json);

  @override
  @JsonKey(name: 'season_id')
  final String seasonId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  final int rating;
  @override
  @JsonKey(name: 'best_rating')
  final int bestRating;
  @override
  @JsonKey(name: 'official_answers')
  final int officialAnswers;
  @override
  final bool provisional;
  @override
  final int? rank;

  @override
  String toString() {
    return 'LeaderboardDto(seasonId: $seasonId, userId: $userId, userName: $userName, rating: $rating, bestRating: $bestRating, officialAnswers: $officialAnswers, provisional: $provisional, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardDtoImpl &&
            (identical(other.seasonId, seasonId) ||
                other.seasonId == seasonId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.bestRating, bestRating) ||
                other.bestRating == bestRating) &&
            (identical(other.officialAnswers, officialAnswers) ||
                other.officialAnswers == officialAnswers) &&
            (identical(other.provisional, provisional) ||
                other.provisional == provisional) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seasonId, userId, userName,
      rating, bestRating, officialAnswers, provisional, rank);

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
      {@JsonKey(name: 'season_id') required final String seasonId,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'user_name') final String? userName,
      required final int rating,
      @JsonKey(name: 'best_rating') required final int bestRating,
      @JsonKey(name: 'official_answers') required final int officialAnswers,
      required final bool provisional,
      final int? rank}) = _$LeaderboardDtoImpl;

  factory _LeaderboardDto.fromJson(Map<String, dynamic> json) =
      _$LeaderboardDtoImpl.fromJson;

  @override
  @JsonKey(name: 'season_id')
  String get seasonId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  int get rating;
  @override
  @JsonKey(name: 'best_rating')
  int get bestRating;
  @override
  @JsonKey(name: 'official_answers')
  int get officialAnswers;
  @override
  bool get provisional;
  @override
  int? get rank;

  /// Create a copy of LeaderboardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardDtoImplCopyWith<_$LeaderboardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
