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
  SubscriptionStatus get status => throw _privateConstructorUsedError;
  bool get entitlementActive => throw _privateConstructorUsedError;
  bool get willRenew => throw _privateConstructorUsedError;
  DateTime? get currentPeriodEndsAt => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get managementUrl => throw _privateConstructorUsedError;
  PurchaseAvailability get purchaseAvailability =>
      throw _privateConstructorUsedError;
  SubscriptionAccessReason? get accessReason =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {SubscriptionStatus status,
      bool entitlementActive,
      bool willRenew,
      DateTime? currentPeriodEndsAt,
      String? provider,
      String? managementUrl,
      PurchaseAvailability purchaseAvailability,
      SubscriptionAccessReason? accessReason});
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
    Object? status = null,
    Object? entitlementActive = null,
    Object? willRenew = null,
    Object? currentPeriodEndsAt = freezed,
    Object? provider = freezed,
    Object? managementUrl = freezed,
    Object? purchaseAvailability = null,
    Object? accessReason = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      entitlementActive: null == entitlementActive
          ? _value.entitlementActive
          : entitlementActive // ignore: cast_nullable_to_non_nullable
              as bool,
      willRenew: null == willRenew
          ? _value.willRenew
          : willRenew // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPeriodEndsAt: freezed == currentPeriodEndsAt
          ? _value.currentPeriodEndsAt
          : currentPeriodEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      managementUrl: freezed == managementUrl
          ? _value.managementUrl
          : managementUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseAvailability: null == purchaseAvailability
          ? _value.purchaseAvailability
          : purchaseAvailability // ignore: cast_nullable_to_non_nullable
              as PurchaseAvailability,
      accessReason: freezed == accessReason
          ? _value.accessReason
          : accessReason // ignore: cast_nullable_to_non_nullable
              as SubscriptionAccessReason?,
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
  $Res call(
      {SubscriptionStatus status,
      bool entitlementActive,
      bool willRenew,
      DateTime? currentPeriodEndsAt,
      String? provider,
      String? managementUrl,
      PurchaseAvailability purchaseAvailability,
      SubscriptionAccessReason? accessReason});
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
    Object? status = null,
    Object? entitlementActive = null,
    Object? willRenew = null,
    Object? currentPeriodEndsAt = freezed,
    Object? provider = freezed,
    Object? managementUrl = freezed,
    Object? purchaseAvailability = null,
    Object? accessReason = freezed,
  }) {
    return _then(_$SubscriptionEntityImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      entitlementActive: null == entitlementActive
          ? _value.entitlementActive
          : entitlementActive // ignore: cast_nullable_to_non_nullable
              as bool,
      willRenew: null == willRenew
          ? _value.willRenew
          : willRenew // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPeriodEndsAt: freezed == currentPeriodEndsAt
          ? _value.currentPeriodEndsAt
          : currentPeriodEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      managementUrl: freezed == managementUrl
          ? _value.managementUrl
          : managementUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseAvailability: null == purchaseAvailability
          ? _value.purchaseAvailability
          : purchaseAvailability // ignore: cast_nullable_to_non_nullable
              as PurchaseAvailability,
      accessReason: freezed == accessReason
          ? _value.accessReason
          : accessReason // ignore: cast_nullable_to_non_nullable
              as SubscriptionAccessReason?,
    ));
  }
}

/// @nodoc

class _$SubscriptionEntityImpl implements _SubscriptionEntity {
  const _$SubscriptionEntityImpl(
      {required this.status,
      required this.entitlementActive,
      required this.willRenew,
      this.currentPeriodEndsAt,
      this.provider,
      this.managementUrl,
      required this.purchaseAvailability,
      this.accessReason});

  @override
  final SubscriptionStatus status;
  @override
  final bool entitlementActive;
  @override
  final bool willRenew;
  @override
  final DateTime? currentPeriodEndsAt;
  @override
  final String? provider;
  @override
  final String? managementUrl;
  @override
  final PurchaseAvailability purchaseAvailability;
  @override
  final SubscriptionAccessReason? accessReason;

  @override
  String toString() {
    return 'SubscriptionEntity(status: $status, entitlementActive: $entitlementActive, willRenew: $willRenew, currentPeriodEndsAt: $currentPeriodEndsAt, provider: $provider, managementUrl: $managementUrl, purchaseAvailability: $purchaseAvailability, accessReason: $accessReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionEntityImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.entitlementActive, entitlementActive) ||
                other.entitlementActive == entitlementActive) &&
            (identical(other.willRenew, willRenew) ||
                other.willRenew == willRenew) &&
            (identical(other.currentPeriodEndsAt, currentPeriodEndsAt) ||
                other.currentPeriodEndsAt == currentPeriodEndsAt) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.managementUrl, managementUrl) ||
                other.managementUrl == managementUrl) &&
            (identical(other.purchaseAvailability, purchaseAvailability) ||
                other.purchaseAvailability == purchaseAvailability) &&
            (identical(other.accessReason, accessReason) ||
                other.accessReason == accessReason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      entitlementActive,
      willRenew,
      currentPeriodEndsAt,
      provider,
      managementUrl,
      purchaseAvailability,
      accessReason);

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
      {required final SubscriptionStatus status,
      required final bool entitlementActive,
      required final bool willRenew,
      final DateTime? currentPeriodEndsAt,
      final String? provider,
      final String? managementUrl,
      required final PurchaseAvailability purchaseAvailability,
      final SubscriptionAccessReason? accessReason}) = _$SubscriptionEntityImpl;

  @override
  SubscriptionStatus get status;
  @override
  bool get entitlementActive;
  @override
  bool get willRenew;
  @override
  DateTime? get currentPeriodEndsAt;
  @override
  String? get provider;
  @override
  String? get managementUrl;
  @override
  PurchaseAvailability get purchaseAvailability;
  @override
  SubscriptionAccessReason? get accessReason;

  /// Create a copy of SubscriptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionEntityImplCopyWith<_$SubscriptionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
