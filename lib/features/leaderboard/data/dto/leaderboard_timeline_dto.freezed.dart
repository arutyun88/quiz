// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_timeline_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardTimelineDto _$LeaderboardTimelineDtoFromJson(
    Map<String, dynamic> json) {
  return _LeaderboardTimelineDto.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardTimelineDto {
  @JsonKey(name: 'current_rank')
  int? get currentRank => throw _privateConstructorUsedError;
  @JsonKey(name: 'delta_over_period')
  int? get deltaOverPeriod => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<TimelineDayDto> get days => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardTimelineDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardTimelineDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardTimelineDtoCopyWith<LeaderboardTimelineDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardTimelineDtoCopyWith<$Res> {
  factory $LeaderboardTimelineDtoCopyWith(LeaderboardTimelineDto value,
          $Res Function(LeaderboardTimelineDto) then) =
      _$LeaderboardTimelineDtoCopyWithImpl<$Res, LeaderboardTimelineDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_rank') int? currentRank,
      @JsonKey(name: 'delta_over_period') int? deltaOverPeriod,
      @JsonKey(defaultValue: []) List<TimelineDayDto> days});
}

/// @nodoc
class _$LeaderboardTimelineDtoCopyWithImpl<$Res,
        $Val extends LeaderboardTimelineDto>
    implements $LeaderboardTimelineDtoCopyWith<$Res> {
  _$LeaderboardTimelineDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardTimelineDto
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
              as List<TimelineDayDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardTimelineDtoImplCopyWith<$Res>
    implements $LeaderboardTimelineDtoCopyWith<$Res> {
  factory _$$LeaderboardTimelineDtoImplCopyWith(
          _$LeaderboardTimelineDtoImpl value,
          $Res Function(_$LeaderboardTimelineDtoImpl) then) =
      __$$LeaderboardTimelineDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_rank') int? currentRank,
      @JsonKey(name: 'delta_over_period') int? deltaOverPeriod,
      @JsonKey(defaultValue: []) List<TimelineDayDto> days});
}

/// @nodoc
class __$$LeaderboardTimelineDtoImplCopyWithImpl<$Res>
    extends _$LeaderboardTimelineDtoCopyWithImpl<$Res,
        _$LeaderboardTimelineDtoImpl>
    implements _$$LeaderboardTimelineDtoImplCopyWith<$Res> {
  __$$LeaderboardTimelineDtoImplCopyWithImpl(
      _$LeaderboardTimelineDtoImpl _value,
      $Res Function(_$LeaderboardTimelineDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardTimelineDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRank = freezed,
    Object? deltaOverPeriod = freezed,
    Object? days = null,
  }) {
    return _then(_$LeaderboardTimelineDtoImpl(
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
              as List<TimelineDayDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardTimelineDtoImpl implements _LeaderboardTimelineDto {
  const _$LeaderboardTimelineDtoImpl(
      {@JsonKey(name: 'current_rank') this.currentRank,
      @JsonKey(name: 'delta_over_period') this.deltaOverPeriod,
      @JsonKey(defaultValue: []) required final List<TimelineDayDto> days})
      : _days = days;

  factory _$LeaderboardTimelineDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardTimelineDtoImplFromJson(json);

  @override
  @JsonKey(name: 'current_rank')
  final int? currentRank;
  @override
  @JsonKey(name: 'delta_over_period')
  final int? deltaOverPeriod;
  final List<TimelineDayDto> _days;
  @override
  @JsonKey(defaultValue: [])
  List<TimelineDayDto> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'LeaderboardTimelineDto(currentRank: $currentRank, deltaOverPeriod: $deltaOverPeriod, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardTimelineDtoImpl &&
            (identical(other.currentRank, currentRank) ||
                other.currentRank == currentRank) &&
            (identical(other.deltaOverPeriod, deltaOverPeriod) ||
                other.deltaOverPeriod == deltaOverPeriod) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentRank, deltaOverPeriod,
      const DeepCollectionEquality().hash(_days));

  /// Create a copy of LeaderboardTimelineDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardTimelineDtoImplCopyWith<_$LeaderboardTimelineDtoImpl>
      get copyWith => __$$LeaderboardTimelineDtoImplCopyWithImpl<
          _$LeaderboardTimelineDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardTimelineDtoImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardTimelineDto implements LeaderboardTimelineDto {
  const factory _LeaderboardTimelineDto(
      {@JsonKey(name: 'current_rank') final int? currentRank,
      @JsonKey(name: 'delta_over_period') final int? deltaOverPeriod,
      @JsonKey(defaultValue: [])
      required final List<TimelineDayDto> days}) = _$LeaderboardTimelineDtoImpl;

  factory _LeaderboardTimelineDto.fromJson(Map<String, dynamic> json) =
      _$LeaderboardTimelineDtoImpl.fromJson;

  @override
  @JsonKey(name: 'current_rank')
  int? get currentRank;
  @override
  @JsonKey(name: 'delta_over_period')
  int? get deltaOverPeriod;
  @override
  @JsonKey(defaultValue: [])
  List<TimelineDayDto> get days;

  /// Create a copy of LeaderboardTimelineDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardTimelineDtoImplCopyWith<_$LeaderboardTimelineDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TimelineDayDto _$TimelineDayDtoFromJson(Map<String, dynamic> json) {
  return _TimelineDayDto.fromJson(json);
}

/// @nodoc
mixin _$TimelineDayDto {
  DateTime get date => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  String? get trend => throw _privateConstructorUsedError;

  /// Serializes this TimelineDayDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimelineDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineDayDtoCopyWith<TimelineDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineDayDtoCopyWith<$Res> {
  factory $TimelineDayDtoCopyWith(
          TimelineDayDto value, $Res Function(TimelineDayDto) then) =
      _$TimelineDayDtoCopyWithImpl<$Res, TimelineDayDto>;
  @useResult
  $Res call({DateTime date, int? points, int? rank, String? trend});
}

/// @nodoc
class _$TimelineDayDtoCopyWithImpl<$Res, $Val extends TimelineDayDto>
    implements $TimelineDayDtoCopyWith<$Res> {
  _$TimelineDayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineDayDto
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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineDayDtoImplCopyWith<$Res>
    implements $TimelineDayDtoCopyWith<$Res> {
  factory _$$TimelineDayDtoImplCopyWith(_$TimelineDayDtoImpl value,
          $Res Function(_$TimelineDayDtoImpl) then) =
      __$$TimelineDayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int? points, int? rank, String? trend});
}

/// @nodoc
class __$$TimelineDayDtoImplCopyWithImpl<$Res>
    extends _$TimelineDayDtoCopyWithImpl<$Res, _$TimelineDayDtoImpl>
    implements _$$TimelineDayDtoImplCopyWith<$Res> {
  __$$TimelineDayDtoImplCopyWithImpl(
      _$TimelineDayDtoImpl _value, $Res Function(_$TimelineDayDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? points = freezed,
    Object? rank = freezed,
    Object? trend = freezed,
  }) {
    return _then(_$TimelineDayDtoImpl(
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimelineDayDtoImpl implements _TimelineDayDto {
  const _$TimelineDayDtoImpl(
      {required this.date, this.points, this.rank, this.trend});

  factory _$TimelineDayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimelineDayDtoImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int? points;
  @override
  final int? rank;
  @override
  final String? trend;

  @override
  String toString() {
    return 'TimelineDayDto(date: $date, points: $points, rank: $rank, trend: $trend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineDayDtoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.trend, trend) || other.trend == trend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, points, rank, trend);

  /// Create a copy of TimelineDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineDayDtoImplCopyWith<_$TimelineDayDtoImpl> get copyWith =>
      __$$TimelineDayDtoImplCopyWithImpl<_$TimelineDayDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimelineDayDtoImplToJson(
      this,
    );
  }
}

abstract class _TimelineDayDto implements TimelineDayDto {
  const factory _TimelineDayDto(
      {required final DateTime date,
      final int? points,
      final int? rank,
      final String? trend}) = _$TimelineDayDtoImpl;

  factory _TimelineDayDto.fromJson(Map<String, dynamic> json) =
      _$TimelineDayDtoImpl.fromJson;

  @override
  DateTime get date;
  @override
  int? get points;
  @override
  int? get rank;
  @override
  String? get trend;

  /// Create a copy of TimelineDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineDayDtoImplCopyWith<_$TimelineDayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
