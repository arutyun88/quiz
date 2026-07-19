// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak_notice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreakNoticeDto _$StreakNoticeDtoFromJson(Map<String, dynamic> json) {
  return _StreakNoticeDto.fromJson(json);
}

/// @nodoc
mixin _$StreakNoticeDto {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get freezesLeft => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get freezesTotal => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get lostStreakDays => throw _privateConstructorUsedError;

  /// Serializes this StreakNoticeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreakNoticeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreakNoticeDtoCopyWith<StreakNoticeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakNoticeDtoCopyWith<$Res> {
  factory $StreakNoticeDtoCopyWith(
          StreakNoticeDto value, $Res Function(StreakNoticeDto) then) =
      _$StreakNoticeDtoCopyWithImpl<$Res, StreakNoticeDto>;
  @useResult
  $Res call(
      {String type,
      @JsonKey(defaultValue: 0) int freezesLeft,
      @JsonKey(defaultValue: 0) int freezesTotal,
      @JsonKey(defaultValue: 0) int lostStreakDays});
}

/// @nodoc
class _$StreakNoticeDtoCopyWithImpl<$Res, $Val extends StreakNoticeDto>
    implements $StreakNoticeDtoCopyWith<$Res> {
  _$StreakNoticeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreakNoticeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? freezesLeft = null,
    Object? freezesTotal = null,
    Object? lostStreakDays = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      freezesLeft: null == freezesLeft
          ? _value.freezesLeft
          : freezesLeft // ignore: cast_nullable_to_non_nullable
              as int,
      freezesTotal: null == freezesTotal
          ? _value.freezesTotal
          : freezesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      lostStreakDays: null == lostStreakDays
          ? _value.lostStreakDays
          : lostStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakNoticeDtoImplCopyWith<$Res>
    implements $StreakNoticeDtoCopyWith<$Res> {
  factory _$$StreakNoticeDtoImplCopyWith(_$StreakNoticeDtoImpl value,
          $Res Function(_$StreakNoticeDtoImpl) then) =
      __$$StreakNoticeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      @JsonKey(defaultValue: 0) int freezesLeft,
      @JsonKey(defaultValue: 0) int freezesTotal,
      @JsonKey(defaultValue: 0) int lostStreakDays});
}

/// @nodoc
class __$$StreakNoticeDtoImplCopyWithImpl<$Res>
    extends _$StreakNoticeDtoCopyWithImpl<$Res, _$StreakNoticeDtoImpl>
    implements _$$StreakNoticeDtoImplCopyWith<$Res> {
  __$$StreakNoticeDtoImplCopyWithImpl(
      _$StreakNoticeDtoImpl _value, $Res Function(_$StreakNoticeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreakNoticeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? freezesLeft = null,
    Object? freezesTotal = null,
    Object? lostStreakDays = null,
  }) {
    return _then(_$StreakNoticeDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      freezesLeft: null == freezesLeft
          ? _value.freezesLeft
          : freezesLeft // ignore: cast_nullable_to_non_nullable
              as int,
      freezesTotal: null == freezesTotal
          ? _value.freezesTotal
          : freezesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      lostStreakDays: null == lostStreakDays
          ? _value.lostStreakDays
          : lostStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakNoticeDtoImpl implements _StreakNoticeDto {
  const _$StreakNoticeDtoImpl(
      {required this.type,
      @JsonKey(defaultValue: 0) required this.freezesLeft,
      @JsonKey(defaultValue: 0) required this.freezesTotal,
      @JsonKey(defaultValue: 0) required this.lostStreakDays});

  factory _$StreakNoticeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakNoticeDtoImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey(defaultValue: 0)
  final int freezesLeft;
  @override
  @JsonKey(defaultValue: 0)
  final int freezesTotal;
  @override
  @JsonKey(defaultValue: 0)
  final int lostStreakDays;

  @override
  String toString() {
    return 'StreakNoticeDto(type: $type, freezesLeft: $freezesLeft, freezesTotal: $freezesTotal, lostStreakDays: $lostStreakDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakNoticeDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.freezesLeft, freezesLeft) ||
                other.freezesLeft == freezesLeft) &&
            (identical(other.freezesTotal, freezesTotal) ||
                other.freezesTotal == freezesTotal) &&
            (identical(other.lostStreakDays, lostStreakDays) ||
                other.lostStreakDays == lostStreakDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, freezesLeft, freezesTotal, lostStreakDays);

  /// Create a copy of StreakNoticeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakNoticeDtoImplCopyWith<_$StreakNoticeDtoImpl> get copyWith =>
      __$$StreakNoticeDtoImplCopyWithImpl<_$StreakNoticeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakNoticeDtoImplToJson(
      this,
    );
  }
}

abstract class _StreakNoticeDto implements StreakNoticeDto {
  const factory _StreakNoticeDto(
          {required final String type,
          @JsonKey(defaultValue: 0) required final int freezesLeft,
          @JsonKey(defaultValue: 0) required final int freezesTotal,
          @JsonKey(defaultValue: 0) required final int lostStreakDays}) =
      _$StreakNoticeDtoImpl;

  factory _StreakNoticeDto.fromJson(Map<String, dynamic> json) =
      _$StreakNoticeDtoImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(defaultValue: 0)
  int get freezesLeft;
  @override
  @JsonKey(defaultValue: 0)
  int get freezesTotal;
  @override
  @JsonKey(defaultValue: 0)
  int get lostStreakDays;

  /// Create a copy of StreakNoticeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakNoticeDtoImplCopyWith<_$StreakNoticeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
