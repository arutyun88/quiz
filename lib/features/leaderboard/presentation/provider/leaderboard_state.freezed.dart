// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeaderboardData {
  LeaderboardPeriod get period => throw _privateConstructorUsedError;
  List<LeaderboardEntity> get entries => throw _privateConstructorUsedError;
  LeaderboardEntity? get myEntry => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardDataCopyWith<LeaderboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardDataCopyWith<$Res> {
  factory $LeaderboardDataCopyWith(
          LeaderboardData value, $Res Function(LeaderboardData) then) =
      _$LeaderboardDataCopyWithImpl<$Res, LeaderboardData>;
  @useResult
  $Res call(
      {LeaderboardPeriod period,
      List<LeaderboardEntity> entries,
      LeaderboardEntity? myEntry});

  $LeaderboardEntityCopyWith<$Res>? get myEntry;
}

/// @nodoc
class _$LeaderboardDataCopyWithImpl<$Res, $Val extends LeaderboardData>
    implements $LeaderboardDataCopyWith<$Res> {
  _$LeaderboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? entries = null,
    Object? myEntry = freezed,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as LeaderboardPeriod,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntity>,
      myEntry: freezed == myEntry
          ? _value.myEntry
          : myEntry // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity?,
    ) as $Val);
  }

  /// Create a copy of LeaderboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeaderboardEntityCopyWith<$Res>? get myEntry {
    if (_value.myEntry == null) {
      return null;
    }

    return $LeaderboardEntityCopyWith<$Res>(_value.myEntry!, (value) {
      return _then(_value.copyWith(myEntry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaderboardDataImplCopyWith<$Res>
    implements $LeaderboardDataCopyWith<$Res> {
  factory _$$LeaderboardDataImplCopyWith(_$LeaderboardDataImpl value,
          $Res Function(_$LeaderboardDataImpl) then) =
      __$$LeaderboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LeaderboardPeriod period,
      List<LeaderboardEntity> entries,
      LeaderboardEntity? myEntry});

  @override
  $LeaderboardEntityCopyWith<$Res>? get myEntry;
}

/// @nodoc
class __$$LeaderboardDataImplCopyWithImpl<$Res>
    extends _$LeaderboardDataCopyWithImpl<$Res, _$LeaderboardDataImpl>
    implements _$$LeaderboardDataImplCopyWith<$Res> {
  __$$LeaderboardDataImplCopyWithImpl(
      _$LeaderboardDataImpl _value, $Res Function(_$LeaderboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? entries = null,
    Object? myEntry = freezed,
  }) {
    return _then(_$LeaderboardDataImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as LeaderboardPeriod,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardEntity>,
      myEntry: freezed == myEntry
          ? _value.myEntry
          : myEntry // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntity?,
    ));
  }
}

/// @nodoc

class _$LeaderboardDataImpl implements _LeaderboardData {
  const _$LeaderboardDataImpl(
      {required this.period,
      required final List<LeaderboardEntity> entries,
      this.myEntry})
      : _entries = entries;

  @override
  final LeaderboardPeriod period;
  final List<LeaderboardEntity> _entries;
  @override
  List<LeaderboardEntity> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  final LeaderboardEntity? myEntry;

  @override
  String toString() {
    return 'LeaderboardData(period: $period, entries: $entries, myEntry: $myEntry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardDataImpl &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.myEntry, myEntry) || other.myEntry == myEntry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period,
      const DeepCollectionEquality().hash(_entries), myEntry);

  /// Create a copy of LeaderboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardDataImplCopyWith<_$LeaderboardDataImpl> get copyWith =>
      __$$LeaderboardDataImplCopyWithImpl<_$LeaderboardDataImpl>(
          this, _$identity);
}

abstract class _LeaderboardData implements LeaderboardData {
  const factory _LeaderboardData(
      {required final LeaderboardPeriod period,
      required final List<LeaderboardEntity> entries,
      final LeaderboardEntity? myEntry}) = _$LeaderboardDataImpl;

  @override
  LeaderboardPeriod get period;
  @override
  List<LeaderboardEntity> get entries;
  @override
  LeaderboardEntity? get myEntry;

  /// Create a copy of LeaderboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardDataImplCopyWith<_$LeaderboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
