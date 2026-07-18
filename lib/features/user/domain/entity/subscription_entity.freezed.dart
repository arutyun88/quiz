// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionEntity {
  bool get active => throw _privateConstructorUsedError;
  SubscriptionPlan get plan => throw _privateConstructorUsedError;
  DateTime? get renewsAt => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionEntityCopyWith<SubscriptionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionEntityCopyWith<$Res> {
  factory $SubscriptionEntityCopyWith(
          SubscriptionEntity value, $Res Function(SubscriptionEntity) then) =
      _$SubscriptionEntityCopyWithImpl<$Res, SubscriptionEntity>;
  @useResult
  $Res call({bool active, SubscriptionPlan plan, DateTime? renewsAt});
}

/// @nodoc
class _$SubscriptionEntityCopyWithImpl<$Res, $Val extends SubscriptionEntity>
    implements $SubscriptionEntityCopyWith<$Res> {
  _$SubscriptionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionEntity
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
              as SubscriptionPlan,
      renewsAt: freezed == renewsAt
          ? _value.renewsAt
          : renewsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionEntityImplCopyWith<$Res>
    implements $SubscriptionEntityCopyWith<$Res> {
  factory _$$SubscriptionEntityImplCopyWith(_$SubscriptionEntityImpl value,
          $Res Function(_$SubscriptionEntityImpl) then) =
      __$$SubscriptionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool active, SubscriptionPlan plan, DateTime? renewsAt});
}

/// @nodoc
class __$$SubscriptionEntityImplCopyWithImpl<$Res>
    extends _$SubscriptionEntityCopyWithImpl<$Res, _$SubscriptionEntityImpl>
    implements _$$SubscriptionEntityImplCopyWith<$Res> {
  __$$SubscriptionEntityImplCopyWithImpl(_$SubscriptionEntityImpl _value,
      $Res Function(_$SubscriptionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? plan = null,
    Object? renewsAt = freezed,
  }) {
    return _then(_$SubscriptionEntityImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlan,
      renewsAt: freezed == renewsAt
          ? _value.renewsAt
          : renewsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$SubscriptionEntityImpl implements _SubscriptionEntity {
  const _$SubscriptionEntityImpl(
      {required this.active, required this.plan, this.renewsAt});

  @override
  final bool active;
  @override
  final SubscriptionPlan plan;
  @override
  final DateTime? renewsAt;

  @override
  String toString() {
    return 'SubscriptionEntity(active: $active, plan: $plan, renewsAt: $renewsAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionEntityImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.renewsAt, renewsAt) ||
                other.renewsAt == renewsAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, active, plan, renewsAt);

  /// Create a copy of SubscriptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionEntityImplCopyWith<_$SubscriptionEntityImpl> get copyWith =>
      __$$SubscriptionEntityImplCopyWithImpl<_$SubscriptionEntityImpl>(
          this, _$identity);
}

abstract class _SubscriptionEntity implements SubscriptionEntity {
  const factory _SubscriptionEntity(
      {required final bool active,
      required final SubscriptionPlan plan,
      final DateTime? renewsAt}) = _$SubscriptionEntityImpl;

  @override
  bool get active;
  @override
  SubscriptionPlan get plan;
  @override
  DateTime? get renewsAt;

  /// Create a copy of SubscriptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionEntityImplCopyWith<_$SubscriptionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
