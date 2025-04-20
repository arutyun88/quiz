// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageEntity<T> {
  List<T> get items => throw _privateConstructorUsedError;
  PageInfo get info => throw _privateConstructorUsedError;

  /// Create a copy of PageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageEntityCopyWith<T, PageEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageEntityCopyWith<T, $Res> {
  factory $PageEntityCopyWith(
          PageEntity<T> value, $Res Function(PageEntity<T>) then) =
      _$PageEntityCopyWithImpl<T, $Res, PageEntity<T>>;
  @useResult
  $Res call({List<T> items, PageInfo info});

  $PageInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$PageEntityCopyWithImpl<T, $Res, $Val extends PageEntity<T>>
    implements $PageEntityCopyWith<T, $Res> {
  _$PageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as PageInfo,
    ) as $Val);
  }

  /// Create a copy of PageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res> get info {
    return $PageInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PageEntityImplCopyWith<T, $Res>
    implements $PageEntityCopyWith<T, $Res> {
  factory _$$PageEntityImplCopyWith(
          _$PageEntityImpl<T> value, $Res Function(_$PageEntityImpl<T>) then) =
      __$$PageEntityImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items, PageInfo info});

  @override
  $PageInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$PageEntityImplCopyWithImpl<T, $Res>
    extends _$PageEntityCopyWithImpl<T, $Res, _$PageEntityImpl<T>>
    implements _$$PageEntityImplCopyWith<T, $Res> {
  __$$PageEntityImplCopyWithImpl(
      _$PageEntityImpl<T> _value, $Res Function(_$PageEntityImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? info = null,
  }) {
    return _then(_$PageEntityImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as PageInfo,
    ));
  }
}

/// @nodoc

class _$PageEntityImpl<T> implements _PageEntity<T> {
  const _$PageEntityImpl({required final List<T> items, required this.info})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PageInfo info;

  @override
  String toString() {
    return 'PageEntity<$T>(items: $items, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageEntityImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), info);

  /// Create a copy of PageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageEntityImplCopyWith<T, _$PageEntityImpl<T>> get copyWith =>
      __$$PageEntityImplCopyWithImpl<T, _$PageEntityImpl<T>>(this, _$identity);
}

abstract class _PageEntity<T> implements PageEntity<T> {
  const factory _PageEntity(
      {required final List<T> items,
      required final PageInfo info}) = _$PageEntityImpl<T>;

  @override
  List<T> get items;
  @override
  PageInfo get info;

  /// Create a copy of PageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageEntityImplCopyWith<T, _$PageEntityImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
