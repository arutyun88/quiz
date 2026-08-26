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
  List<LeaderboardEntity> get entries => throw _privateConstructorUsedError;
  LeaderboardEntity get me => throw _privateConstructorUsedError;
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
  $Res call({List<LeaderboardEntity> entries, LeaderboardEntity me, int total});

  $LeaderboardEntityCopyWith<$Res> get me;
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
    Object? entries = null,
    Object? me = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntity>,
      me: null == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity,
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
  $LeaderboardEntityCopyWith<$Res> get me {
    return $LeaderboardEntityCopyWith<$Res>(_value.me, (value) {
      return _then(_value.copyWith(me: value) as $Val);
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
  $Res call({List<LeaderboardEntity> entries, LeaderboardEntity me, int total});

  @override
  $LeaderboardEntityCopyWith<$Res> get me;
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
    Object? entries = null,
    Object? me = null,
    Object? total = null,
  }) {
    return _then(_$LeaderboardOverviewEntityImpl(
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntity>,
      me: null == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity,
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
      {required final List<LeaderboardEntity> entries,
      required this.me,
      required this.total})
      : _entries = entries;

  final List<LeaderboardEntity> _entries;
  @override
  List<LeaderboardEntity> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  final LeaderboardEntity me;
  @override
  final int total;

  @override
  String toString() {
    return 'LeaderboardOverviewEntity(entries: $entries, me: $me, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardOverviewEntityImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.me, me) || other.me == me) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_entries), me, total);

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
      {required final List<LeaderboardEntity> entries,
      required final LeaderboardEntity me,
      required final int total}) = _$LeaderboardOverviewEntityImpl;

  @override
  List<LeaderboardEntity> get entries;
  @override
  LeaderboardEntity get me;
  @override
  int get total;

  /// Create a copy of LeaderboardOverviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardOverviewEntityImplCopyWith<_$LeaderboardOverviewEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
