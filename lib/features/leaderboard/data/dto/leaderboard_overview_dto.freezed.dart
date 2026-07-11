// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_overview_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardOverviewDto _$LeaderboardOverviewDtoFromJson(
    Map<String, dynamic> json) {
  return _LeaderboardOverviewDto.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardOverviewDto {
  @JsonKey(defaultValue: [])
  List<LeaderboardDto> get top => throw _privateConstructorUsedError;
  LeaderboardDto? get me => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<LeaderboardDto> get around => throw _privateConstructorUsedError;
  LeaderboardDto? get previousMe => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get total => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardOverviewDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardOverviewDtoCopyWith<LeaderboardOverviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardOverviewDtoCopyWith<$Res> {
  factory $LeaderboardOverviewDtoCopyWith(LeaderboardOverviewDto value,
          $Res Function(LeaderboardOverviewDto) then) =
      _$LeaderboardOverviewDtoCopyWithImpl<$Res, LeaderboardOverviewDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<LeaderboardDto> top,
      LeaderboardDto? me,
      @JsonKey(defaultValue: []) List<LeaderboardDto> around,
      LeaderboardDto? previousMe,
      @JsonKey(defaultValue: 0) int total});

  $LeaderboardDtoCopyWith<$Res>? get me;
  $LeaderboardDtoCopyWith<$Res>? get previousMe;
}

/// @nodoc
class _$LeaderboardOverviewDtoCopyWithImpl<$Res,
        $Val extends LeaderboardOverviewDto>
    implements $LeaderboardOverviewDtoCopyWith<$Res> {
  _$LeaderboardOverviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? me = freezed,
    Object? around = null,
    Object? previousMe = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDto>,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as LeaderboardDto?,
      around: null == around
          ? _value.around
          : around // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDto>,
      previousMe: freezed == previousMe
          ? _value.previousMe
          : previousMe // ignore: cast_nullable_to_non_nullable
              as LeaderboardDto?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of LeaderboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeaderboardDtoCopyWith<$Res>? get me {
    if (_value.me == null) {
      return null;
    }

    return $LeaderboardDtoCopyWith<$Res>(_value.me!, (value) {
      return _then(_value.copyWith(me: value) as $Val);
    });
  }

  /// Create a copy of LeaderboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeaderboardDtoCopyWith<$Res>? get previousMe {
    if (_value.previousMe == null) {
      return null;
    }

    return $LeaderboardDtoCopyWith<$Res>(_value.previousMe!, (value) {
      return _then(_value.copyWith(previousMe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaderboardOverviewDtoImplCopyWith<$Res>
    implements $LeaderboardOverviewDtoCopyWith<$Res> {
  factory _$$LeaderboardOverviewDtoImplCopyWith(
          _$LeaderboardOverviewDtoImpl value,
          $Res Function(_$LeaderboardOverviewDtoImpl) then) =
      __$$LeaderboardOverviewDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: []) List<LeaderboardDto> top,
      LeaderboardDto? me,
      @JsonKey(defaultValue: []) List<LeaderboardDto> around,
      LeaderboardDto? previousMe,
      @JsonKey(defaultValue: 0) int total});

  @override
  $LeaderboardDtoCopyWith<$Res>? get me;
  @override
  $LeaderboardDtoCopyWith<$Res>? get previousMe;
}

/// @nodoc
class __$$LeaderboardOverviewDtoImplCopyWithImpl<$Res>
    extends _$LeaderboardOverviewDtoCopyWithImpl<$Res,
        _$LeaderboardOverviewDtoImpl>
    implements _$$LeaderboardOverviewDtoImplCopyWith<$Res> {
  __$$LeaderboardOverviewDtoImplCopyWithImpl(
      _$LeaderboardOverviewDtoImpl _value,
      $Res Function(_$LeaderboardOverviewDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? me = freezed,
    Object? around = null,
    Object? previousMe = freezed,
    Object? total = null,
  }) {
    return _then(_$LeaderboardOverviewDtoImpl(
      top: null == top
          ? _value._top
          : top // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDto>,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as LeaderboardDto?,
      around: null == around
          ? _value._around
          : around // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDto>,
      previousMe: freezed == previousMe
          ? _value.previousMe
          : previousMe // ignore: cast_nullable_to_non_nullable
              as LeaderboardDto?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardOverviewDtoImpl implements _LeaderboardOverviewDto {
  const _$LeaderboardOverviewDtoImpl(
      {@JsonKey(defaultValue: []) required final List<LeaderboardDto> top,
      this.me,
      @JsonKey(defaultValue: []) required final List<LeaderboardDto> around,
      this.previousMe,
      @JsonKey(defaultValue: 0) required this.total})
      : _top = top,
        _around = around;

  factory _$LeaderboardOverviewDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardOverviewDtoImplFromJson(json);

  final List<LeaderboardDto> _top;
  @override
  @JsonKey(defaultValue: [])
  List<LeaderboardDto> get top {
    if (_top is EqualUnmodifiableListView) return _top;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top);
  }

  @override
  final LeaderboardDto? me;
  final List<LeaderboardDto> _around;
  @override
  @JsonKey(defaultValue: [])
  List<LeaderboardDto> get around {
    if (_around is EqualUnmodifiableListView) return _around;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_around);
  }

  @override
  final LeaderboardDto? previousMe;
  @override
  @JsonKey(defaultValue: 0)
  final int total;

  @override
  String toString() {
    return 'LeaderboardOverviewDto(top: $top, me: $me, around: $around, previousMe: $previousMe, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardOverviewDtoImpl &&
            const DeepCollectionEquality().equals(other._top, _top) &&
            (identical(other.me, me) || other.me == me) &&
            const DeepCollectionEquality().equals(other._around, _around) &&
            (identical(other.previousMe, previousMe) ||
                other.previousMe == previousMe) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_top),
      me,
      const DeepCollectionEquality().hash(_around),
      previousMe,
      total);

  /// Create a copy of LeaderboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardOverviewDtoImplCopyWith<_$LeaderboardOverviewDtoImpl>
      get copyWith => __$$LeaderboardOverviewDtoImplCopyWithImpl<
          _$LeaderboardOverviewDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardOverviewDtoImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardOverviewDto implements LeaderboardOverviewDto {
  const factory _LeaderboardOverviewDto(
          {@JsonKey(defaultValue: []) required final List<LeaderboardDto> top,
          final LeaderboardDto? me,
          @JsonKey(defaultValue: []) required final List<LeaderboardDto> around,
          final LeaderboardDto? previousMe,
          @JsonKey(defaultValue: 0) required final int total}) =
      _$LeaderboardOverviewDtoImpl;

  factory _LeaderboardOverviewDto.fromJson(Map<String, dynamic> json) =
      _$LeaderboardOverviewDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: [])
  List<LeaderboardDto> get top;
  @override
  LeaderboardDto? get me;
  @override
  @JsonKey(defaultValue: [])
  List<LeaderboardDto> get around;
  @override
  LeaderboardDto? get previousMe;
  @override
  @JsonKey(defaultValue: 0)
  int get total;

  /// Create a copy of LeaderboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardOverviewDtoImplCopyWith<_$LeaderboardOverviewDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
