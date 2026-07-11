// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_overview_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeaderboardOverviewEntity {
  List<LeaderboardEntity> get top => throw _privateConstructorUsedError;
  LeaderboardEntity? get me => throw _privateConstructorUsedError;
  List<LeaderboardEntity> get around => throw _privateConstructorUsedError;
  LeaderboardEntity? get previousMe => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardOverviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardOverviewEntityCopyWith<LeaderboardOverviewEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardOverviewEntityCopyWith<$Res> {
  factory $LeaderboardOverviewEntityCopyWith(LeaderboardOverviewEntity value,
          $Res Function(LeaderboardOverviewEntity) then) =
      _$LeaderboardOverviewEntityCopyWithImpl<$Res, LeaderboardOverviewEntity>;
  @useResult
  $Res call(
      {List<LeaderboardEntity> top,
      LeaderboardEntity? me,
      List<LeaderboardEntity> around,
      LeaderboardEntity? previousMe,
      int total});

  $LeaderboardEntityCopyWith<$Res>? get me;
  $LeaderboardEntityCopyWith<$Res>? get previousMe;
}

/// @nodoc
class _$LeaderboardOverviewEntityCopyWithImpl<$Res,
        $Val extends LeaderboardOverviewEntity>
    implements $LeaderboardOverviewEntityCopyWith<$Res> {
  _$LeaderboardOverviewEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardOverviewEntity
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
              as List<LeaderboardEntity>,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity?,
      around: null == around
          ? _value.around
          : around // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntity>,
      previousMe: freezed == previousMe
          ? _value.previousMe
          : previousMe // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of LeaderboardOverviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeaderboardEntityCopyWith<$Res>? get me {
    if (_value.me == null) {
      return null;
    }

    return $LeaderboardEntityCopyWith<$Res>(_value.me!, (value) {
      return _then(_value.copyWith(me: value) as $Val);
    });
  }

  /// Create a copy of LeaderboardOverviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeaderboardEntityCopyWith<$Res>? get previousMe {
    if (_value.previousMe == null) {
      return null;
    }

    return $LeaderboardEntityCopyWith<$Res>(_value.previousMe!, (value) {
      return _then(_value.copyWith(previousMe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaderboardOverviewEntityImplCopyWith<$Res>
    implements $LeaderboardOverviewEntityCopyWith<$Res> {
  factory _$$LeaderboardOverviewEntityImplCopyWith(
          _$LeaderboardOverviewEntityImpl value,
          $Res Function(_$LeaderboardOverviewEntityImpl) then) =
      __$$LeaderboardOverviewEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LeaderboardEntity> top,
      LeaderboardEntity? me,
      List<LeaderboardEntity> around,
      LeaderboardEntity? previousMe,
      int total});

  @override
  $LeaderboardEntityCopyWith<$Res>? get me;
  @override
  $LeaderboardEntityCopyWith<$Res>? get previousMe;
}

/// @nodoc
class __$$LeaderboardOverviewEntityImplCopyWithImpl<$Res>
    extends _$LeaderboardOverviewEntityCopyWithImpl<$Res,
        _$LeaderboardOverviewEntityImpl>
    implements _$$LeaderboardOverviewEntityImplCopyWith<$Res> {
  __$$LeaderboardOverviewEntityImplCopyWithImpl(
      _$LeaderboardOverviewEntityImpl _value,
      $Res Function(_$LeaderboardOverviewEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardOverviewEntity
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
    return _then(_$LeaderboardOverviewEntityImpl(
      top: null == top
          ? _value._top
          : top // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntity>,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity?,
      around: null == around
          ? _value._around
          : around // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntity>,
      previousMe: freezed == previousMe
          ? _value.previousMe
          : previousMe // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LeaderboardOverviewEntityImpl implements _LeaderboardOverviewEntity {
  const _$LeaderboardOverviewEntityImpl(
      {required final List<LeaderboardEntity> top,
      this.me,
      required final List<LeaderboardEntity> around,
      this.previousMe,
      required this.total})
      : _top = top,
        _around = around;

  final List<LeaderboardEntity> _top;
  @override
  List<LeaderboardEntity> get top {
    if (_top is EqualUnmodifiableListView) return _top;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top);
  }

  @override
  final LeaderboardEntity? me;
  final List<LeaderboardEntity> _around;
  @override
  List<LeaderboardEntity> get around {
    if (_around is EqualUnmodifiableListView) return _around;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_around);
  }

  @override
  final LeaderboardEntity? previousMe;
  @override
  final int total;

  @override
  String toString() {
    return 'LeaderboardOverviewEntity(top: $top, me: $me, around: $around, previousMe: $previousMe, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardOverviewEntityImpl &&
            const DeepCollectionEquality().equals(other._top, _top) &&
            (identical(other.me, me) || other.me == me) &&
            const DeepCollectionEquality().equals(other._around, _around) &&
            (identical(other.previousMe, previousMe) ||
                other.previousMe == previousMe) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_top),
      me,
      const DeepCollectionEquality().hash(_around),
      previousMe,
      total);

  /// Create a copy of LeaderboardOverviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardOverviewEntityImplCopyWith<_$LeaderboardOverviewEntityImpl>
      get copyWith => __$$LeaderboardOverviewEntityImplCopyWithImpl<
          _$LeaderboardOverviewEntityImpl>(this, _$identity);
}

abstract class _LeaderboardOverviewEntity implements LeaderboardOverviewEntity {
  const factory _LeaderboardOverviewEntity(
      {required final List<LeaderboardEntity> top,
      final LeaderboardEntity? me,
      required final List<LeaderboardEntity> around,
      final LeaderboardEntity? previousMe,
      required final int total}) = _$LeaderboardOverviewEntityImpl;

  @override
  List<LeaderboardEntity> get top;
  @override
  LeaderboardEntity? get me;
  @override
  List<LeaderboardEntity> get around;
  @override
  LeaderboardEntity? get previousMe;
  @override
  int get total;

  /// Create a copy of LeaderboardOverviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardOverviewEntityImplCopyWith<_$LeaderboardOverviewEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
