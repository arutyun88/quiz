// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_plus_package_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizPlusPackageEntity {
  String get packageId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get subscriptionPeriod => throw _privateConstructorUsedError;

  /// Create a copy of QuizPlusPackageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizPlusPackageEntityCopyWith<QuizPlusPackageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPlusPackageEntityCopyWith<$Res> {
  factory $QuizPlusPackageEntityCopyWith(QuizPlusPackageEntity value,
          $Res Function(QuizPlusPackageEntity) then) =
      _$QuizPlusPackageEntityCopyWithImpl<$Res, QuizPlusPackageEntity>;
  @useResult
  $Res call(
      {String packageId,
      String productId,
      String title,
      String description,
      String price,
      String? subscriptionPeriod});
}

/// @nodoc
class _$QuizPlusPackageEntityCopyWithImpl<$Res,
        $Val extends QuizPlusPackageEntity>
    implements $QuizPlusPackageEntityCopyWith<$Res> {
  _$QuizPlusPackageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizPlusPackageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? productId = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? subscriptionPeriod = freezed,
  }) {
    return _then(_value.copyWith(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionPeriod: freezed == subscriptionPeriod
          ? _value.subscriptionPeriod
          : subscriptionPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizPlusPackageEntityImplCopyWith<$Res>
    implements $QuizPlusPackageEntityCopyWith<$Res> {
  factory _$$QuizPlusPackageEntityImplCopyWith(
          _$QuizPlusPackageEntityImpl value,
          $Res Function(_$QuizPlusPackageEntityImpl) then) =
      __$$QuizPlusPackageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String packageId,
      String productId,
      String title,
      String description,
      String price,
      String? subscriptionPeriod});
}

/// @nodoc
class __$$QuizPlusPackageEntityImplCopyWithImpl<$Res>
    extends _$QuizPlusPackageEntityCopyWithImpl<$Res,
        _$QuizPlusPackageEntityImpl>
    implements _$$QuizPlusPackageEntityImplCopyWith<$Res> {
  __$$QuizPlusPackageEntityImplCopyWithImpl(_$QuizPlusPackageEntityImpl _value,
      $Res Function(_$QuizPlusPackageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizPlusPackageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? productId = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? subscriptionPeriod = freezed,
  }) {
    return _then(_$QuizPlusPackageEntityImpl(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionPeriod: freezed == subscriptionPeriod
          ? _value.subscriptionPeriod
          : subscriptionPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$QuizPlusPackageEntityImpl implements _QuizPlusPackageEntity {
  const _$QuizPlusPackageEntityImpl(
      {required this.packageId,
      required this.productId,
      required this.title,
      required this.description,
      required this.price,
      required this.subscriptionPeriod});

  @override
  final String packageId;
  @override
  final String productId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String price;
  @override
  final String? subscriptionPeriod;

  @override
  String toString() {
    return 'QuizPlusPackageEntity(packageId: $packageId, productId: $productId, title: $title, description: $description, price: $price, subscriptionPeriod: $subscriptionPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizPlusPackageEntityImpl &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subscriptionPeriod, subscriptionPeriod) ||
                other.subscriptionPeriod == subscriptionPeriod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, packageId, productId, title,
      description, price, subscriptionPeriod);

  /// Create a copy of QuizPlusPackageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizPlusPackageEntityImplCopyWith<_$QuizPlusPackageEntityImpl>
      get copyWith => __$$QuizPlusPackageEntityImplCopyWithImpl<
          _$QuizPlusPackageEntityImpl>(this, _$identity);
}

abstract class _QuizPlusPackageEntity implements QuizPlusPackageEntity {
  const factory _QuizPlusPackageEntity(
      {required final String packageId,
      required final String productId,
      required final String title,
      required final String description,
      required final String price,
      required final String? subscriptionPeriod}) = _$QuizPlusPackageEntityImpl;

  @override
  String get packageId;
  @override
  String get productId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get price;
  @override
  String? get subscriptionPeriod;

  /// Create a copy of QuizPlusPackageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizPlusPackageEntityImplCopyWith<_$QuizPlusPackageEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
