// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) {
  return _SubscriptionDto.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionDto {
  bool get active => throw _privateConstructorUsedError;
  String get plan => throw _privateConstructorUsedError;
  @JsonKey(name: 'renews_at')
  DateTime? get renewsAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionDtoCopyWith<SubscriptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDtoCopyWith<$Res> {
  factory $SubscriptionDtoCopyWith(
          SubscriptionDto value, $Res Function(SubscriptionDto) then) =
      _$SubscriptionDtoCopyWithImpl<$Res, SubscriptionDto>;
  @useResult
  $Res call(
      {bool active,
      String plan,
      @JsonKey(name: 'renews_at') DateTime? renewsAt});
}

/// @nodoc
class _$SubscriptionDtoCopyWithImpl<$Res, $Val extends SubscriptionDto>
    implements $SubscriptionDtoCopyWith<$Res> {
  _$SubscriptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? plan = null,
    Object? renewsAt = freezed,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      renewsAt: freezed == renewsAt
          ? _value.renewsAt
          : renewsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionDtoImplCopyWith<$Res>
    implements $SubscriptionDtoCopyWith<$Res> {
  factory _$$SubscriptionDtoImplCopyWith(_$SubscriptionDtoImpl value,
          $Res Function(_$SubscriptionDtoImpl) then) =
      __$$SubscriptionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      String plan,
      @JsonKey(name: 'renews_at') DateTime? renewsAt});
}

/// @nodoc
class __$$SubscriptionDtoImplCopyWithImpl<$Res>
    extends _$SubscriptionDtoCopyWithImpl<$Res, _$SubscriptionDtoImpl>
    implements _$$SubscriptionDtoImplCopyWith<$Res> {
  __$$SubscriptionDtoImplCopyWithImpl(
      _$SubscriptionDtoImpl _value, $Res Function(_$SubscriptionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? plan = null,
    Object? renewsAt = freezed,
  }) {
    return _then(_$SubscriptionDtoImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      renewsAt: freezed == renewsAt
          ? _value.renewsAt
          : renewsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionDtoImpl implements _SubscriptionDto {
  const _$SubscriptionDtoImpl(
      {required this.active,
      required this.plan,
      @JsonKey(name: 'renews_at') this.renewsAt});

  factory _$SubscriptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDtoImplFromJson(json);

  @override
  final bool active;
  @override
  final String plan;
  @override
  @JsonKey(name: 'renews_at')
  final DateTime? renewsAt;

  @override
  String toString() {
    return 'SubscriptionDto(active: $active, plan: $plan, renewsAt: $renewsAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDtoImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.renewsAt, renewsAt) ||
                other.renewsAt == renewsAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, active, plan, renewsAt);

  /// Create a copy of SubscriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionDtoImplCopyWith<_$SubscriptionDtoImpl> get copyWith =>
      __$$SubscriptionDtoImplCopyWithImpl<_$SubscriptionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionDtoImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionDto implements SubscriptionDto {
  const factory _SubscriptionDto(
          {required final bool active,
          required final String plan,
          @JsonKey(name: 'renews_at') final DateTime? renewsAt}) =
      _$SubscriptionDtoImpl;

  factory _SubscriptionDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDtoImpl.fromJson;

  @override
  bool get active;
  @override
  String get plan;
  @override
  @JsonKey(name: 'renews_at')
  DateTime? get renewsAt;

  /// Create a copy of SubscriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDtoImplCopyWith<_$SubscriptionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
