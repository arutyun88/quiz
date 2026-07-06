// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_today_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnsweredTodayDto _$AnsweredTodayDtoFromJson(Map<String, dynamic> json) {
  return _AnsweredTodayDto.fromJson(json);
}

/// @nodoc
mixin _$AnsweredTodayDto {
  @JsonKey(name: 'answered_today')
  bool get answeredToday => throw _privateConstructorUsedError;

  /// Serializes this AnsweredTodayDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnsweredTodayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnsweredTodayDtoCopyWith<AnsweredTodayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnsweredTodayDtoCopyWith<$Res> {
  factory $AnsweredTodayDtoCopyWith(
          AnsweredTodayDto value, $Res Function(AnsweredTodayDto) then) =
      _$AnsweredTodayDtoCopyWithImpl<$Res, AnsweredTodayDto>;
  @useResult
  $Res call({@JsonKey(name: 'answered_today') bool answeredToday});
}

/// @nodoc
class _$AnsweredTodayDtoCopyWithImpl<$Res, $Val extends AnsweredTodayDto>
    implements $AnsweredTodayDtoCopyWith<$Res> {
  _$AnsweredTodayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnsweredTodayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answeredToday = null,
  }) {
    return _then(_value.copyWith(
      answeredToday: null == answeredToday
          ? _value.answeredToday
          : answeredToday // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnsweredTodayDtoImplCopyWith<$Res>
    implements $AnsweredTodayDtoCopyWith<$Res> {
  factory _$$AnsweredTodayDtoImplCopyWith(_$AnsweredTodayDtoImpl value,
          $Res Function(_$AnsweredTodayDtoImpl) then) =
      __$$AnsweredTodayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'answered_today') bool answeredToday});
}

/// @nodoc
class __$$AnsweredTodayDtoImplCopyWithImpl<$Res>
    extends _$AnsweredTodayDtoCopyWithImpl<$Res, _$AnsweredTodayDtoImpl>
    implements _$$AnsweredTodayDtoImplCopyWith<$Res> {
  __$$AnsweredTodayDtoImplCopyWithImpl(_$AnsweredTodayDtoImpl _value,
      $Res Function(_$AnsweredTodayDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnsweredTodayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answeredToday = null,
  }) {
    return _then(_$AnsweredTodayDtoImpl(
      answeredToday: null == answeredToday
          ? _value.answeredToday
          : answeredToday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnsweredTodayDtoImpl implements _AnsweredTodayDto {
  const _$AnsweredTodayDtoImpl(
      {@JsonKey(name: 'answered_today') required this.answeredToday});

  factory _$AnsweredTodayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnsweredTodayDtoImplFromJson(json);

  @override
  @JsonKey(name: 'answered_today')
  final bool answeredToday;

  @override
  String toString() {
    return 'AnsweredTodayDto(answeredToday: $answeredToday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredTodayDtoImpl &&
            (identical(other.answeredToday, answeredToday) ||
                other.answeredToday == answeredToday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answeredToday);

  /// Create a copy of AnsweredTodayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredTodayDtoImplCopyWith<_$AnsweredTodayDtoImpl> get copyWith =>
      __$$AnsweredTodayDtoImplCopyWithImpl<_$AnsweredTodayDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnsweredTodayDtoImplToJson(
      this,
    );
  }
}

abstract class _AnsweredTodayDto implements AnsweredTodayDto {
  const factory _AnsweredTodayDto(
      {@JsonKey(name: 'answered_today')
      required final bool answeredToday}) = _$AnsweredTodayDtoImpl;

  factory _AnsweredTodayDto.fromJson(Map<String, dynamic> json) =
      _$AnsweredTodayDtoImpl.fromJson;

  @override
  @JsonKey(name: 'answered_today')
  bool get answeredToday;

  /// Create a copy of AnsweredTodayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnsweredTodayDtoImplCopyWith<_$AnsweredTodayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
