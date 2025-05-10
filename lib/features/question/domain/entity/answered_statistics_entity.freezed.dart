// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_statistics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnsweredStatisticsEntity {
  bool get lastIsCorrect => throw _privateConstructorUsedError;
  UserStatisticsEntity get statistics => throw _privateConstructorUsedError;

  /// Create a copy of AnsweredStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnsweredStatisticsEntityCopyWith<AnsweredStatisticsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnsweredStatisticsEntityCopyWith<$Res> {
  factory $AnsweredStatisticsEntityCopyWith(AnsweredStatisticsEntity value,
          $Res Function(AnsweredStatisticsEntity) then) =
      _$AnsweredStatisticsEntityCopyWithImpl<$Res, AnsweredStatisticsEntity>;
  @useResult
  $Res call({bool lastIsCorrect, UserStatisticsEntity statistics});

  $UserStatisticsEntityCopyWith<$Res> get statistics;
}

/// @nodoc
class _$AnsweredStatisticsEntityCopyWithImpl<$Res,
        $Val extends AnsweredStatisticsEntity>
    implements $AnsweredStatisticsEntityCopyWith<$Res> {
  _$AnsweredStatisticsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnsweredStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastIsCorrect = null,
    Object? statistics = null,
  }) {
    return _then(_value.copyWith(
      lastIsCorrect: null == lastIsCorrect
          ? _value.lastIsCorrect
          : lastIsCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as UserStatisticsEntity,
    ) as $Val);
  }

  /// Create a copy of AnsweredStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatisticsEntityCopyWith<$Res> get statistics {
    return $UserStatisticsEntityCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnsweredStatisticsEntityImplCopyWith<$Res>
    implements $AnsweredStatisticsEntityCopyWith<$Res> {
  factory _$$AnsweredStatisticsEntityImplCopyWith(
          _$AnsweredStatisticsEntityImpl value,
          $Res Function(_$AnsweredStatisticsEntityImpl) then) =
      __$$AnsweredStatisticsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool lastIsCorrect, UserStatisticsEntity statistics});

  @override
  $UserStatisticsEntityCopyWith<$Res> get statistics;
}

/// @nodoc
class __$$AnsweredStatisticsEntityImplCopyWithImpl<$Res>
    extends _$AnsweredStatisticsEntityCopyWithImpl<$Res,
        _$AnsweredStatisticsEntityImpl>
    implements _$$AnsweredStatisticsEntityImplCopyWith<$Res> {
  __$$AnsweredStatisticsEntityImplCopyWithImpl(
      _$AnsweredStatisticsEntityImpl _value,
      $Res Function(_$AnsweredStatisticsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnsweredStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastIsCorrect = null,
    Object? statistics = null,
  }) {
    return _then(_$AnsweredStatisticsEntityImpl(
      lastIsCorrect: null == lastIsCorrect
          ? _value.lastIsCorrect
          : lastIsCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as UserStatisticsEntity,
    ));
  }
}

/// @nodoc

class _$AnsweredStatisticsEntityImpl implements _AnsweredStatisticsEntity {
  const _$AnsweredStatisticsEntityImpl(
      {required this.lastIsCorrect, required this.statistics});

  @override
  final bool lastIsCorrect;
  @override
  final UserStatisticsEntity statistics;

  @override
  String toString() {
    return 'AnsweredStatisticsEntity(lastIsCorrect: $lastIsCorrect, statistics: $statistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredStatisticsEntityImpl &&
            (identical(other.lastIsCorrect, lastIsCorrect) ||
                other.lastIsCorrect == lastIsCorrect) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastIsCorrect, statistics);

  /// Create a copy of AnsweredStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredStatisticsEntityImplCopyWith<_$AnsweredStatisticsEntityImpl>
      get copyWith => __$$AnsweredStatisticsEntityImplCopyWithImpl<
          _$AnsweredStatisticsEntityImpl>(this, _$identity);
}

abstract class _AnsweredStatisticsEntity implements AnsweredStatisticsEntity {
  const factory _AnsweredStatisticsEntity(
          {required final bool lastIsCorrect,
          required final UserStatisticsEntity statistics}) =
      _$AnsweredStatisticsEntityImpl;

  @override
  bool get lastIsCorrect;
  @override
  UserStatisticsEntity get statistics;

  /// Create a copy of AnsweredStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnsweredStatisticsEntityImplCopyWith<_$AnsweredStatisticsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
