// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStatisticsDto _$UserStatisticsDtoFromJson(Map<String, dynamic> json) {
  return _UserStatisticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserStatisticsDto {
  @JsonKey(name: 'right_count')
  int get rightCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'wrong_count')
  int get wrongCount => throw _privateConstructorUsedError;

  /// Serializes this UserStatisticsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsDtoCopyWith<UserStatisticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsDtoCopyWith<$Res> {
  factory $UserStatisticsDtoCopyWith(
          UserStatisticsDto value, $Res Function(UserStatisticsDto) then) =
      _$UserStatisticsDtoCopyWithImpl<$Res, UserStatisticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'right_count') int rightCount,
      @JsonKey(name: 'wrong_count') int wrongCount});
}

/// @nodoc
class _$UserStatisticsDtoCopyWithImpl<$Res, $Val extends UserStatisticsDto>
    implements $UserStatisticsDtoCopyWith<$Res> {
  _$UserStatisticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rightCount = null,
    Object? wrongCount = null,
  }) {
    return _then(_value.copyWith(
      rightCount: null == rightCount
          ? _value.rightCount
          : rightCount // ignore: cast_nullable_to_non_nullable
              as int,
      wrongCount: null == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatisticsDtoImplCopyWith<$Res>
    implements $UserStatisticsDtoCopyWith<$Res> {
  factory _$$UserStatisticsDtoImplCopyWith(_$UserStatisticsDtoImpl value,
          $Res Function(_$UserStatisticsDtoImpl) then) =
      __$$UserStatisticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'right_count') int rightCount,
      @JsonKey(name: 'wrong_count') int wrongCount});
}

/// @nodoc
class __$$UserStatisticsDtoImplCopyWithImpl<$Res>
    extends _$UserStatisticsDtoCopyWithImpl<$Res, _$UserStatisticsDtoImpl>
    implements _$$UserStatisticsDtoImplCopyWith<$Res> {
  __$$UserStatisticsDtoImplCopyWithImpl(_$UserStatisticsDtoImpl _value,
      $Res Function(_$UserStatisticsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rightCount = null,
    Object? wrongCount = null,
  }) {
    return _then(_$UserStatisticsDtoImpl(
      rightCount: null == rightCount
          ? _value.rightCount
          : rightCount // ignore: cast_nullable_to_non_nullable
              as int,
      wrongCount: null == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatisticsDtoImpl implements _UserStatisticsDto {
  const _$UserStatisticsDtoImpl(
      {@JsonKey(name: 'right_count') required this.rightCount,
      @JsonKey(name: 'wrong_count') required this.wrongCount});

  factory _$UserStatisticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatisticsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'right_count')
  final int rightCount;
  @override
  @JsonKey(name: 'wrong_count')
  final int wrongCount;

  @override
  String toString() {
    return 'UserStatisticsDto(rightCount: $rightCount, wrongCount: $wrongCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsDtoImpl &&
            (identical(other.rightCount, rightCount) ||
                other.rightCount == rightCount) &&
            (identical(other.wrongCount, wrongCount) ||
                other.wrongCount == wrongCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rightCount, wrongCount);

  /// Create a copy of UserStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsDtoImplCopyWith<_$UserStatisticsDtoImpl> get copyWith =>
      __$$UserStatisticsDtoImplCopyWithImpl<_$UserStatisticsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatisticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserStatisticsDto implements UserStatisticsDto {
  const factory _UserStatisticsDto(
          {@JsonKey(name: 'right_count') required final int rightCount,
          @JsonKey(name: 'wrong_count') required final int wrongCount}) =
      _$UserStatisticsDtoImpl;

  factory _UserStatisticsDto.fromJson(Map<String, dynamic> json) =
      _$UserStatisticsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'right_count')
  int get rightCount;
  @override
  @JsonKey(name: 'wrong_count')
  int get wrongCount;

  /// Create a copy of UserStatisticsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsDtoImplCopyWith<_$UserStatisticsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
