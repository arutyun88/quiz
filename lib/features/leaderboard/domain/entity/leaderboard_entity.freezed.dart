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
  String get seasonId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  int get bestRating => throw _privateConstructorUsedError;
  int get officialAnswers => throw _privateConstructorUsedError;
  bool get provisional => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;

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
      {String seasonId,
      String userId,
      String? userName,
      int rating,
      int bestRating,
      int officialAnswers,
      bool provisional,
      int? rank});
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
abstract class _$$LeaderboardEntityImplCopyWith<$Res>
    implements $LeaderboardEntityCopyWith<$Res> {
  factory _$$LeaderboardEntityImplCopyWith(_$LeaderboardEntityImpl value,
          $Res Function(_$LeaderboardEntityImpl) then) =
      __$$LeaderboardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String seasonId,
      String userId,
      String? userName,
      int rating,
      int bestRating,
      int officialAnswers,
      bool provisional,
      int? rank});
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
    Object? seasonId = null,
    Object? userId = null,
    Object? userName = freezed,
    Object? rating = null,
    Object? bestRating = null,
    Object? officialAnswers = null,
    Object? provisional = null,
    Object? rank = freezed,
  }) {
    return _then(_$LeaderboardEntityImpl(
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

class _$LeaderboardEntityImpl implements _LeaderboardEntity {
  const _$LeaderboardEntityImpl(
      {required this.seasonId,
      required this.userId,
      this.userName,
      required this.rating,
      required this.bestRating,
      required this.officialAnswers,
      required this.provisional,
      this.rank});

  @override
  final String seasonId;
  @override
  final String userId;
  @override
  final String? userName;
  @override
  final int rating;
  @override
  final int bestRating;
  @override
  final int officialAnswers;
  @override
  final bool provisional;
  @override
  final int? rank;

  @override
  String toString() {
    return 'LeaderboardEntity(seasonId: $seasonId, userId: $userId, userName: $userName, rating: $rating, bestRating: $bestRating, officialAnswers: $officialAnswers, provisional: $provisional, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardEntityImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, seasonId, userId, userName,
      rating, bestRating, officialAnswers, provisional, rank);

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
      {required final String seasonId,
      required final String userId,
      final String? userName,
      required final int rating,
      required final int bestRating,
      required final int officialAnswers,
      required final bool provisional,
      final int? rank}) = _$LeaderboardEntityImpl;

  @override
  String get seasonId;
  @override
  String get userId;
  @override
  String? get userName;
  @override
  int get rating;
  @override
  int get bestRating;
  @override
  int get officialAnswers;
  @override
  bool get provisional;
  @override
  int? get rank;

  /// Create a copy of LeaderboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardEntityImplCopyWith<_$LeaderboardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
