// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_statistics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnsweredStatisticsDto _$AnsweredStatisticsDtoFromJson(
    Map<String, dynamic> json) {
  return _AnsweredStatisticsDto.fromJson(json);
}

/// @nodoc
mixin _$AnsweredStatisticsDto {
  @JsonKey(name: 'last_is_correct')
  bool get lastIsCorrect => throw _privateConstructorUsedError;
  UserStatisticsDto get statistics => throw _privateConstructorUsedError;

  /// Serializes this AnsweredStatisticsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnsweredStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnsweredStatisticsDtoCopyWith<AnsweredStatisticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnsweredStatisticsDtoCopyWith<$Res> {
  factory $AnsweredStatisticsDtoCopyWith(AnsweredStatisticsDto value,
          $Res Function(AnsweredStatisticsDto) then) =
      _$AnsweredStatisticsDtoCopyWithImpl<$Res, AnsweredStatisticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'last_is_correct') bool lastIsCorrect,
      UserStatisticsDto statistics});

  $UserStatisticsDtoCopyWith<$Res> get statistics;
}

/// @nodoc
class _$AnsweredStatisticsDtoCopyWithImpl<$Res,
        $Val extends AnsweredStatisticsDto>
    implements $AnsweredStatisticsDtoCopyWith<$Res> {
  _$AnsweredStatisticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnsweredStatisticsDto
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
              as UserStatisticsDto,
    ) as $Val);
  }

  /// Create a copy of AnsweredStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatisticsDtoCopyWith<$Res> get statistics {
    return $UserStatisticsDtoCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnsweredStatisticsDtoImplCopyWith<$Res>
    implements $AnsweredStatisticsDtoCopyWith<$Res> {
  factory _$$AnsweredStatisticsDtoImplCopyWith(
          _$AnsweredStatisticsDtoImpl value,
          $Res Function(_$AnsweredStatisticsDtoImpl) then) =
      __$$AnsweredStatisticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'last_is_correct') bool lastIsCorrect,
      UserStatisticsDto statistics});

  @override
  $UserStatisticsDtoCopyWith<$Res> get statistics;
}

/// @nodoc
class __$$AnsweredStatisticsDtoImplCopyWithImpl<$Res>
    extends _$AnsweredStatisticsDtoCopyWithImpl<$Res,
        _$AnsweredStatisticsDtoImpl>
    implements _$$AnsweredStatisticsDtoImplCopyWith<$Res> {
  __$$AnsweredStatisticsDtoImplCopyWithImpl(_$AnsweredStatisticsDtoImpl _value,
      $Res Function(_$AnsweredStatisticsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnsweredStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastIsCorrect = null,
    Object? statistics = null,
  }) {
    return _then(_$AnsweredStatisticsDtoImpl(
      lastIsCorrect: null == lastIsCorrect
          ? _value.lastIsCorrect
          : lastIsCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as UserStatisticsDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnsweredStatisticsDtoImpl implements _AnsweredStatisticsDto {
  const _$AnsweredStatisticsDtoImpl(
      {@JsonKey(name: 'last_is_correct') required this.lastIsCorrect,
      required this.statistics});

  factory _$AnsweredStatisticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnsweredStatisticsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'last_is_correct')
  final bool lastIsCorrect;
  @override
  final UserStatisticsDto statistics;

  @override
  String toString() {
    return 'AnsweredStatisticsDto(lastIsCorrect: $lastIsCorrect, statistics: $statistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredStatisticsDtoImpl &&
            (identical(other.lastIsCorrect, lastIsCorrect) ||
                other.lastIsCorrect == lastIsCorrect) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastIsCorrect, statistics);

  /// Create a copy of AnsweredStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredStatisticsDtoImplCopyWith<_$AnsweredStatisticsDtoImpl>
      get copyWith => __$$AnsweredStatisticsDtoImplCopyWithImpl<
          _$AnsweredStatisticsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnsweredStatisticsDtoImplToJson(
      this,
    );
  }
}

abstract class _AnsweredStatisticsDto implements AnsweredStatisticsDto {
  const factory _AnsweredStatisticsDto(
          {@JsonKey(name: 'last_is_correct') required final bool lastIsCorrect,
          required final UserStatisticsDto statistics}) =
      _$AnsweredStatisticsDtoImpl;

  factory _AnsweredStatisticsDto.fromJson(Map<String, dynamic> json) =
      _$AnsweredStatisticsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'last_is_correct')
  bool get lastIsCorrect;
  @override
  UserStatisticsDto get statistics;

  /// Create a copy of AnsweredStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnsweredStatisticsDtoImplCopyWith<_$AnsweredStatisticsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
