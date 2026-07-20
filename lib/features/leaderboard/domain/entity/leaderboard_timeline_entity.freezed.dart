// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_timeline_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeaderboardTimelineEntity {
  int? get currentRank => throw _privateConstructorUsedError;
  int? get deltaOverPeriod => throw _privateConstructorUsedError;
  List<TimelineDayEntity> get days => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardTimelineEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardTimelineEntityCopyWith<LeaderboardTimelineEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardTimelineEntityCopyWith<$Res> {
  factory $LeaderboardTimelineEntityCopyWith(LeaderboardTimelineEntity value,
          $Res Function(LeaderboardTimelineEntity) then) =
      _$LeaderboardTimelineEntityCopyWithImpl<$Res, LeaderboardTimelineEntity>;
  @useResult
  $Res call(
      {int? currentRank, int? deltaOverPeriod, List<TimelineDayEntity> days});
}

/// @nodoc
class _$LeaderboardTimelineEntityCopyWithImpl<$Res,
        $Val extends LeaderboardTimelineEntity>
    implements $LeaderboardTimelineEntityCopyWith<$Res> {
  _$LeaderboardTimelineEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardTimelineEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRank = freezed,
    Object? deltaOverPeriod = freezed,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      currentRank: freezed == currentRank
          ? _value.currentRank
          : currentRank // ignore: cast_nullable_to_non_nullable
              as int?,
      deltaOverPeriod: freezed == deltaOverPeriod
          ? _value.deltaOverPeriod
          : deltaOverPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<TimelineDayEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardTimelineEntityImplCopyWith<$Res>
    implements $LeaderboardTimelineEntityCopyWith<$Res> {
  factory _$$LeaderboardTimelineEntityImplCopyWith(
          _$LeaderboardTimelineEntityImpl value,
          $Res Function(_$LeaderboardTimelineEntityImpl) then) =
      __$$LeaderboardTimelineEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentRank, int? deltaOverPeriod, List<TimelineDayEntity> days});
}

/// @nodoc
class __$$LeaderboardTimelineEntityImplCopyWithImpl<$Res>
    extends _$LeaderboardTimelineEntityCopyWithImpl<$Res,
        _$LeaderboardTimelineEntityImpl>
    implements _$$LeaderboardTimelineEntityImplCopyWith<$Res> {
  __$$LeaderboardTimelineEntityImplCopyWithImpl(
      _$LeaderboardTimelineEntityImpl _value,
      $Res Function(_$LeaderboardTimelineEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardTimelineEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRank = freezed,
    Object? deltaOverPeriod = freezed,
    Object? days = null,
  }) {
    return _then(_$LeaderboardTimelineEntityImpl(
      currentRank: freezed == currentRank
          ? _value.currentRank
          : currentRank // ignore: cast_nullable_to_non_nullable
              as int?,
      deltaOverPeriod: freezed == deltaOverPeriod
          ? _value.deltaOverPeriod
          : deltaOverPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<TimelineDayEntity>,
    ));
  }
}

/// @nodoc

class _$LeaderboardTimelineEntityImpl implements _LeaderboardTimelineEntity {
  const _$LeaderboardTimelineEntityImpl(
      {required this.currentRank,
      required this.deltaOverPeriod,
      required final List<TimelineDayEntity> days})
      : _days = days;

  @override
  final int? currentRank;
  @override
  final int? deltaOverPeriod;
  final List<TimelineDayEntity> _days;
  @override
  List<TimelineDayEntity> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'LeaderboardTimelineEntity(currentRank: $currentRank, deltaOverPeriod: $deltaOverPeriod, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardTimelineEntityImpl &&
            (identical(other.currentRank, currentRank) ||
                other.currentRank == currentRank) &&
            (identical(other.deltaOverPeriod, deltaOverPeriod) ||
                other.deltaOverPeriod == deltaOverPeriod) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentRank, deltaOverPeriod,
      const DeepCollectionEquality().hash(_days));

  /// Create a copy of LeaderboardTimelineEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardTimelineEntityImplCopyWith<_$LeaderboardTimelineEntityImpl>
      get copyWith => __$$LeaderboardTimelineEntityImplCopyWithImpl<
          _$LeaderboardTimelineEntityImpl>(this, _$identity);
}

abstract class _LeaderboardTimelineEntity implements LeaderboardTimelineEntity {
  const factory _LeaderboardTimelineEntity(
          {required final int? currentRank,
          required final int? deltaOverPeriod,
          required final List<TimelineDayEntity> days}) =
      _$LeaderboardTimelineEntityImpl;

  @override
  int? get currentRank;
  @override
  int? get deltaOverPeriod;
  @override
  List<TimelineDayEntity> get days;

  /// Create a copy of LeaderboardTimelineEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardTimelineEntityImplCopyWith<_$LeaderboardTimelineEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimelineDayEntity {
  DateTime get date => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  RankTrend? get trend => throw _privateConstructorUsedError;

  /// Create a copy of TimelineDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineDayEntityCopyWith<TimelineDayEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineDayEntityCopyWith<$Res> {
  factory $TimelineDayEntityCopyWith(
          TimelineDayEntity value, $Res Function(TimelineDayEntity) then) =
      _$TimelineDayEntityCopyWithImpl<$Res, TimelineDayEntity>;
  @useResult
  $Res call({DateTime date, int? points, int? rank, RankTrend? trend});
}

/// @nodoc
class _$TimelineDayEntityCopyWithImpl<$Res, $Val extends TimelineDayEntity>
    implements $TimelineDayEntityCopyWith<$Res> {
  _$TimelineDayEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? points = freezed,
    Object? rank = freezed,
    Object? trend = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as RankTrend?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineDayEntityImplCopyWith<$Res>
    implements $TimelineDayEntityCopyWith<$Res> {
  factory _$$TimelineDayEntityImplCopyWith(_$TimelineDayEntityImpl value,
          $Res Function(_$TimelineDayEntityImpl) then) =
      __$$TimelineDayEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int? points, int? rank, RankTrend? trend});
}

/// @nodoc
class __$$TimelineDayEntityImplCopyWithImpl<$Res>
    extends _$TimelineDayEntityCopyWithImpl<$Res, _$TimelineDayEntityImpl>
    implements _$$TimelineDayEntityImplCopyWith<$Res> {
  __$$TimelineDayEntityImplCopyWithImpl(_$TimelineDayEntityImpl _value,
      $Res Function(_$TimelineDayEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? points = freezed,
    Object? rank = freezed,
    Object? trend = freezed,
  }) {
    return _then(_$TimelineDayEntityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as RankTrend?,
    ));
  }
}

/// @nodoc

class _$TimelineDayEntityImpl extends _TimelineDayEntity {
  const _$TimelineDayEntityImpl(
      {required this.date,
      required this.points,
      required this.rank,
      required this.trend})
      : super._();

  @override
  final DateTime date;
  @override
  final int? points;
  @override
  final int? rank;
  @override
  final RankTrend? trend;

  @override
  String toString() {
    return 'TimelineDayEntity(date: $date, points: $points, rank: $rank, trend: $trend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineDayEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.trend, trend) || other.trend == trend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, points, rank, trend);

  /// Create a copy of TimelineDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineDayEntityImplCopyWith<_$TimelineDayEntityImpl> get copyWith =>
      __$$TimelineDayEntityImplCopyWithImpl<_$TimelineDayEntityImpl>(
          this, _$identity);
}

abstract class _TimelineDayEntity extends TimelineDayEntity {
  const factory _TimelineDayEntity(
      {required final DateTime date,
      required final int? points,
      required final int? rank,
      required final RankTrend? trend}) = _$TimelineDayEntityImpl;
  const _TimelineDayEntity._() : super._();

  @override
  DateTime get date;
  @override
  int? get points;
  @override
  int? get rank;
  @override
  RankTrend? get trend;

  /// Create a copy of TimelineDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineDayEntityImplCopyWith<_$TimelineDayEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
