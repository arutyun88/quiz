// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'acquisition_attribution_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AcquisitionAttributionRequestDto _$AcquisitionAttributionRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _AcquisitionAttributionRequestDto.fromJson(json);
}

/// @nodoc
mixin _$AcquisitionAttributionRequestDto {
  @JsonKey(name: 'client_event_id')
  String get clientEventId => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_attribution_id')
  String get providerAttributionId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get campaign => throw _privateConstructorUsedError;
  @JsonKey(name: 'ad_group', includeIfNull: false)
  String? get adGroup => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get creative => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribution_model', includeIfNull: false)
  String? get attributionModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'attributed_at', includeIfNull: false)
  DateTime? get attributedAt => throw _privateConstructorUsedError;

  /// Serializes this AcquisitionAttributionRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AcquisitionAttributionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AcquisitionAttributionRequestDtoCopyWith<AcquisitionAttributionRequestDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcquisitionAttributionRequestDtoCopyWith<$Res> {
  factory $AcquisitionAttributionRequestDtoCopyWith(
          AcquisitionAttributionRequestDto value,
          $Res Function(AcquisitionAttributionRequestDto) then) =
      _$AcquisitionAttributionRequestDtoCopyWithImpl<$Res,
          AcquisitionAttributionRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_event_id') String clientEventId,
      String provider,
      @JsonKey(name: 'provider_attribution_id') String providerAttributionId,
      @JsonKey(includeIfNull: false) String? source,
      @JsonKey(includeIfNull: false) String? campaign,
      @JsonKey(name: 'ad_group', includeIfNull: false) String? adGroup,
      @JsonKey(includeIfNull: false) String? creative,
      @JsonKey(name: 'attribution_model', includeIfNull: false)
      String? attributionModel,
      @JsonKey(name: 'attributed_at', includeIfNull: false)
      DateTime? attributedAt});
}

/// @nodoc
class _$AcquisitionAttributionRequestDtoCopyWithImpl<$Res,
        $Val extends AcquisitionAttributionRequestDto>
    implements $AcquisitionAttributionRequestDtoCopyWith<$Res> {
  _$AcquisitionAttributionRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AcquisitionAttributionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientEventId = null,
    Object? provider = null,
    Object? providerAttributionId = null,
    Object? source = freezed,
    Object? campaign = freezed,
    Object? adGroup = freezed,
    Object? creative = freezed,
    Object? attributionModel = freezed,
    Object? attributedAt = freezed,
  }) {
    return _then(_value.copyWith(
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerAttributionId: null == providerAttributionId
          ? _value.providerAttributionId
          : providerAttributionId // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      campaign: freezed == campaign
          ? _value.campaign
          : campaign // ignore: cast_nullable_to_non_nullable
              as String?,
      adGroup: freezed == adGroup
          ? _value.adGroup
          : adGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      creative: freezed == creative
          ? _value.creative
          : creative // ignore: cast_nullable_to_non_nullable
              as String?,
      attributionModel: freezed == attributionModel
          ? _value.attributionModel
          : attributionModel // ignore: cast_nullable_to_non_nullable
              as String?,
      attributedAt: freezed == attributedAt
          ? _value.attributedAt
          : attributedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AcquisitionAttributionRequestDtoImplCopyWith<$Res>
    implements $AcquisitionAttributionRequestDtoCopyWith<$Res> {
  factory _$$AcquisitionAttributionRequestDtoImplCopyWith(
          _$AcquisitionAttributionRequestDtoImpl value,
          $Res Function(_$AcquisitionAttributionRequestDtoImpl) then) =
      __$$AcquisitionAttributionRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_event_id') String clientEventId,
      String provider,
      @JsonKey(name: 'provider_attribution_id') String providerAttributionId,
      @JsonKey(includeIfNull: false) String? source,
      @JsonKey(includeIfNull: false) String? campaign,
      @JsonKey(name: 'ad_group', includeIfNull: false) String? adGroup,
      @JsonKey(includeIfNull: false) String? creative,
      @JsonKey(name: 'attribution_model', includeIfNull: false)
      String? attributionModel,
      @JsonKey(name: 'attributed_at', includeIfNull: false)
      DateTime? attributedAt});
}

/// @nodoc
class __$$AcquisitionAttributionRequestDtoImplCopyWithImpl<$Res>
    extends _$AcquisitionAttributionRequestDtoCopyWithImpl<$Res,
        _$AcquisitionAttributionRequestDtoImpl>
    implements _$$AcquisitionAttributionRequestDtoImplCopyWith<$Res> {
  __$$AcquisitionAttributionRequestDtoImplCopyWithImpl(
      _$AcquisitionAttributionRequestDtoImpl _value,
      $Res Function(_$AcquisitionAttributionRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AcquisitionAttributionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientEventId = null,
    Object? provider = null,
    Object? providerAttributionId = null,
    Object? source = freezed,
    Object? campaign = freezed,
    Object? adGroup = freezed,
    Object? creative = freezed,
    Object? attributionModel = freezed,
    Object? attributedAt = freezed,
  }) {
    return _then(_$AcquisitionAttributionRequestDtoImpl(
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerAttributionId: null == providerAttributionId
          ? _value.providerAttributionId
          : providerAttributionId // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      campaign: freezed == campaign
          ? _value.campaign
          : campaign // ignore: cast_nullable_to_non_nullable
              as String?,
      adGroup: freezed == adGroup
          ? _value.adGroup
          : adGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      creative: freezed == creative
          ? _value.creative
          : creative // ignore: cast_nullable_to_non_nullable
              as String?,
      attributionModel: freezed == attributionModel
          ? _value.attributionModel
          : attributionModel // ignore: cast_nullable_to_non_nullable
              as String?,
      attributedAt: freezed == attributedAt
          ? _value.attributedAt
          : attributedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AcquisitionAttributionRequestDtoImpl
    implements _AcquisitionAttributionRequestDto {
  const _$AcquisitionAttributionRequestDtoImpl(
      {@JsonKey(name: 'client_event_id') required this.clientEventId,
      required this.provider,
      @JsonKey(name: 'provider_attribution_id')
      required this.providerAttributionId,
      @JsonKey(includeIfNull: false) this.source,
      @JsonKey(includeIfNull: false) this.campaign,
      @JsonKey(name: 'ad_group', includeIfNull: false) this.adGroup,
      @JsonKey(includeIfNull: false) this.creative,
      @JsonKey(name: 'attribution_model', includeIfNull: false)
      this.attributionModel,
      @JsonKey(name: 'attributed_at', includeIfNull: false) this.attributedAt});

  factory _$AcquisitionAttributionRequestDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AcquisitionAttributionRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'client_event_id')
  final String clientEventId;
  @override
  final String provider;
  @override
  @JsonKey(name: 'provider_attribution_id')
  final String providerAttributionId;
  @override
  @JsonKey(includeIfNull: false)
  final String? source;
  @override
  @JsonKey(includeIfNull: false)
  final String? campaign;
  @override
  @JsonKey(name: 'ad_group', includeIfNull: false)
  final String? adGroup;
  @override
  @JsonKey(includeIfNull: false)
  final String? creative;
  @override
  @JsonKey(name: 'attribution_model', includeIfNull: false)
  final String? attributionModel;
  @override
  @JsonKey(name: 'attributed_at', includeIfNull: false)
  final DateTime? attributedAt;

  @override
  String toString() {
    return 'AcquisitionAttributionRequestDto(clientEventId: $clientEventId, provider: $provider, providerAttributionId: $providerAttributionId, source: $source, campaign: $campaign, adGroup: $adGroup, creative: $creative, attributionModel: $attributionModel, attributedAt: $attributedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcquisitionAttributionRequestDtoImpl &&
            (identical(other.clientEventId, clientEventId) ||
                other.clientEventId == clientEventId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerAttributionId, providerAttributionId) ||
                other.providerAttributionId == providerAttributionId) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.campaign, campaign) ||
                other.campaign == campaign) &&
            (identical(other.adGroup, adGroup) || other.adGroup == adGroup) &&
            (identical(other.creative, creative) ||
                other.creative == creative) &&
            (identical(other.attributionModel, attributionModel) ||
                other.attributionModel == attributionModel) &&
            (identical(other.attributedAt, attributedAt) ||
                other.attributedAt == attributedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientEventId,
      provider,
      providerAttributionId,
      source,
      campaign,
      adGroup,
      creative,
      attributionModel,
      attributedAt);

  /// Create a copy of AcquisitionAttributionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcquisitionAttributionRequestDtoImplCopyWith<
          _$AcquisitionAttributionRequestDtoImpl>
      get copyWith => __$$AcquisitionAttributionRequestDtoImplCopyWithImpl<
          _$AcquisitionAttributionRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcquisitionAttributionRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _AcquisitionAttributionRequestDto
    implements AcquisitionAttributionRequestDto {
  const factory _AcquisitionAttributionRequestDto(
      {@JsonKey(name: 'client_event_id') required final String clientEventId,
      required final String provider,
      @JsonKey(name: 'provider_attribution_id')
      required final String providerAttributionId,
      @JsonKey(includeIfNull: false) final String? source,
      @JsonKey(includeIfNull: false) final String? campaign,
      @JsonKey(name: 'ad_group', includeIfNull: false) final String? adGroup,
      @JsonKey(includeIfNull: false) final String? creative,
      @JsonKey(name: 'attribution_model', includeIfNull: false)
      final String? attributionModel,
      @JsonKey(name: 'attributed_at', includeIfNull: false)
      final DateTime? attributedAt}) = _$AcquisitionAttributionRequestDtoImpl;

  factory _AcquisitionAttributionRequestDto.fromJson(
          Map<String, dynamic> json) =
      _$AcquisitionAttributionRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'client_event_id')
  String get clientEventId;
  @override
  String get provider;
  @override
  @JsonKey(name: 'provider_attribution_id')
  String get providerAttributionId;
  @override
  @JsonKey(includeIfNull: false)
  String? get source;
  @override
  @JsonKey(includeIfNull: false)
  String? get campaign;
  @override
  @JsonKey(name: 'ad_group', includeIfNull: false)
  String? get adGroup;
  @override
  @JsonKey(includeIfNull: false)
  String? get creative;
  @override
  @JsonKey(name: 'attribution_model', includeIfNull: false)
  String? get attributionModel;
  @override
  @JsonKey(name: 'attributed_at', includeIfNull: false)
  DateTime? get attributedAt;

  /// Create a copy of AcquisitionAttributionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcquisitionAttributionRequestDtoImplCopyWith<
          _$AcquisitionAttributionRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AcquisitionAttributionReceiptDto _$AcquisitionAttributionReceiptDtoFromJson(
    Map<String, dynamic> json) {
  return _AcquisitionAttributionReceiptDto.fromJson(json);
}

/// @nodoc
mixin _$AcquisitionAttributionReceiptDto {
  @JsonKey(name: 'attribution_id')
  String get attributionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_event_id')
  String get clientEventId => throw _privateConstructorUsedError;

  /// Serializes this AcquisitionAttributionReceiptDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AcquisitionAttributionReceiptDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AcquisitionAttributionReceiptDtoCopyWith<AcquisitionAttributionReceiptDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcquisitionAttributionReceiptDtoCopyWith<$Res> {
  factory $AcquisitionAttributionReceiptDtoCopyWith(
          AcquisitionAttributionReceiptDto value,
          $Res Function(AcquisitionAttributionReceiptDto) then) =
      _$AcquisitionAttributionReceiptDtoCopyWithImpl<$Res,
          AcquisitionAttributionReceiptDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attribution_id') String attributionId,
      @JsonKey(name: 'client_event_id') String clientEventId});
}

/// @nodoc
class _$AcquisitionAttributionReceiptDtoCopyWithImpl<$Res,
        $Val extends AcquisitionAttributionReceiptDto>
    implements $AcquisitionAttributionReceiptDtoCopyWith<$Res> {
  _$AcquisitionAttributionReceiptDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AcquisitionAttributionReceiptDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributionId = null,
    Object? clientEventId = null,
  }) {
    return _then(_value.copyWith(
      attributionId: null == attributionId
          ? _value.attributionId
          : attributionId // ignore: cast_nullable_to_non_nullable
              as String,
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AcquisitionAttributionReceiptDtoImplCopyWith<$Res>
    implements $AcquisitionAttributionReceiptDtoCopyWith<$Res> {
  factory _$$AcquisitionAttributionReceiptDtoImplCopyWith(
          _$AcquisitionAttributionReceiptDtoImpl value,
          $Res Function(_$AcquisitionAttributionReceiptDtoImpl) then) =
      __$$AcquisitionAttributionReceiptDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attribution_id') String attributionId,
      @JsonKey(name: 'client_event_id') String clientEventId});
}

/// @nodoc
class __$$AcquisitionAttributionReceiptDtoImplCopyWithImpl<$Res>
    extends _$AcquisitionAttributionReceiptDtoCopyWithImpl<$Res,
        _$AcquisitionAttributionReceiptDtoImpl>
    implements _$$AcquisitionAttributionReceiptDtoImplCopyWith<$Res> {
  __$$AcquisitionAttributionReceiptDtoImplCopyWithImpl(
      _$AcquisitionAttributionReceiptDtoImpl _value,
      $Res Function(_$AcquisitionAttributionReceiptDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AcquisitionAttributionReceiptDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributionId = null,
    Object? clientEventId = null,
  }) {
    return _then(_$AcquisitionAttributionReceiptDtoImpl(
      attributionId: null == attributionId
          ? _value.attributionId
          : attributionId // ignore: cast_nullable_to_non_nullable
              as String,
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AcquisitionAttributionReceiptDtoImpl
    implements _AcquisitionAttributionReceiptDto {
  const _$AcquisitionAttributionReceiptDtoImpl(
      {@JsonKey(name: 'attribution_id') required this.attributionId,
      @JsonKey(name: 'client_event_id') required this.clientEventId});

  factory _$AcquisitionAttributionReceiptDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AcquisitionAttributionReceiptDtoImplFromJson(json);

  @override
  @JsonKey(name: 'attribution_id')
  final String attributionId;
  @override
  @JsonKey(name: 'client_event_id')
  final String clientEventId;

  @override
  String toString() {
    return 'AcquisitionAttributionReceiptDto(attributionId: $attributionId, clientEventId: $clientEventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcquisitionAttributionReceiptDtoImpl &&
            (identical(other.attributionId, attributionId) ||
                other.attributionId == attributionId) &&
            (identical(other.clientEventId, clientEventId) ||
                other.clientEventId == clientEventId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attributionId, clientEventId);

  /// Create a copy of AcquisitionAttributionReceiptDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcquisitionAttributionReceiptDtoImplCopyWith<
          _$AcquisitionAttributionReceiptDtoImpl>
      get copyWith => __$$AcquisitionAttributionReceiptDtoImplCopyWithImpl<
          _$AcquisitionAttributionReceiptDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcquisitionAttributionReceiptDtoImplToJson(
      this,
    );
  }
}

abstract class _AcquisitionAttributionReceiptDto
    implements AcquisitionAttributionReceiptDto {
  const factory _AcquisitionAttributionReceiptDto(
          {@JsonKey(name: 'attribution_id') required final String attributionId,
          @JsonKey(name: 'client_event_id')
          required final String clientEventId}) =
      _$AcquisitionAttributionReceiptDtoImpl;

  factory _AcquisitionAttributionReceiptDto.fromJson(
          Map<String, dynamic> json) =
      _$AcquisitionAttributionReceiptDtoImpl.fromJson;

  @override
  @JsonKey(name: 'attribution_id')
  String get attributionId;
  @override
  @JsonKey(name: 'client_event_id')
  String get clientEventId;

  /// Create a copy of AcquisitionAttributionReceiptDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcquisitionAttributionReceiptDtoImplCopyWith<
          _$AcquisitionAttributionReceiptDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
