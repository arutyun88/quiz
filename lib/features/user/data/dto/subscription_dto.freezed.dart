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
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'entitlement_active')
  bool get entitlementActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'will_renew')
  bool get willRenew => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_period_ends_at')
  DateTime? get currentPeriodEndsAt => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'management_url')
  String? get managementUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_availability')
  String get purchaseAvailability => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_reason')
  String? get accessReason => throw _privateConstructorUsedError;

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
      {String status,
      @JsonKey(name: 'entitlement_active') bool entitlementActive,
      @JsonKey(name: 'will_renew') bool willRenew,
      @JsonKey(name: 'current_period_ends_at') DateTime? currentPeriodEndsAt,
      String? provider,
      @JsonKey(name: 'management_url') String? managementUrl,
      @JsonKey(name: 'purchase_availability') String purchaseAvailability,
      @JsonKey(name: 'access_reason') String? accessReason});
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
              as String,
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
              as String,
      accessReason: freezed == accessReason
          ? _value.accessReason
          : accessReason // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String status,
      @JsonKey(name: 'entitlement_active') bool entitlementActive,
      @JsonKey(name: 'will_renew') bool willRenew,
      @JsonKey(name: 'current_period_ends_at') DateTime? currentPeriodEndsAt,
      String? provider,
      @JsonKey(name: 'management_url') String? managementUrl,
      @JsonKey(name: 'purchase_availability') String purchaseAvailability,
      @JsonKey(name: 'access_reason') String? accessReason});
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
    Object? status = null,
    Object? entitlementActive = null,
    Object? willRenew = null,
    Object? currentPeriodEndsAt = freezed,
    Object? provider = freezed,
    Object? managementUrl = freezed,
    Object? purchaseAvailability = null,
    Object? accessReason = freezed,
  }) {
    return _then(_$SubscriptionDtoImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      accessReason: freezed == accessReason
          ? _value.accessReason
          : accessReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionDtoImpl implements _SubscriptionDto {
  const _$SubscriptionDtoImpl(
      {required this.status,
      @JsonKey(name: 'entitlement_active') required this.entitlementActive,
      @JsonKey(name: 'will_renew') required this.willRenew,
      @JsonKey(name: 'current_period_ends_at') this.currentPeriodEndsAt,
      this.provider,
      @JsonKey(name: 'management_url') this.managementUrl,
      @JsonKey(name: 'purchase_availability')
      required this.purchaseAvailability,
      @JsonKey(name: 'access_reason') this.accessReason});

  factory _$SubscriptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDtoImplFromJson(json);

  @override
  final String status;
  @override
  @JsonKey(name: 'entitlement_active')
  final bool entitlementActive;
  @override
  @JsonKey(name: 'will_renew')
  final bool willRenew;
  @override
  @JsonKey(name: 'current_period_ends_at')
  final DateTime? currentPeriodEndsAt;
  @override
  final String? provider;
  @override
  @JsonKey(name: 'management_url')
  final String? managementUrl;
  @override
  @JsonKey(name: 'purchase_availability')
  final String purchaseAvailability;
  @override
  @JsonKey(name: 'access_reason')
  final String? accessReason;

  @override
  String toString() {
    return 'SubscriptionDto(status: $status, entitlementActive: $entitlementActive, willRenew: $willRenew, currentPeriodEndsAt: $currentPeriodEndsAt, provider: $provider, managementUrl: $managementUrl, purchaseAvailability: $purchaseAvailability, accessReason: $accessReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDtoImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
          {required final String status,
          @JsonKey(name: 'entitlement_active')
          required final bool entitlementActive,
          @JsonKey(name: 'will_renew') required final bool willRenew,
          @JsonKey(name: 'current_period_ends_at')
          final DateTime? currentPeriodEndsAt,
          final String? provider,
          @JsonKey(name: 'management_url') final String? managementUrl,
          @JsonKey(name: 'purchase_availability')
          required final String purchaseAvailability,
          @JsonKey(name: 'access_reason') final String? accessReason}) =
      _$SubscriptionDtoImpl;

  factory _SubscriptionDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDtoImpl.fromJson;

  @override
  String get status;
  @override
  @JsonKey(name: 'entitlement_active')
  bool get entitlementActive;
  @override
  @JsonKey(name: 'will_renew')
  bool get willRenew;
  @override
  @JsonKey(name: 'current_period_ends_at')
  DateTime? get currentPeriodEndsAt;
  @override
  String? get provider;
  @override
  @JsonKey(name: 'management_url')
  String? get managementUrl;
  @override
  @JsonKey(name: 'purchase_availability')
  String get purchaseAvailability;
  @override
  @JsonKey(name: 'access_reason')
  String? get accessReason;

  /// Create a copy of SubscriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDtoImplCopyWith<_$SubscriptionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
