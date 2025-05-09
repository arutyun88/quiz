// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserStatisticsEntity {
  int get rightCount => throw _privateConstructorUsedError;
  int get wrongCount => throw _privateConstructorUsedError;

  /// Create a copy of UserStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsEntityCopyWith<UserStatisticsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsEntityCopyWith<$Res> {
  factory $UserStatisticsEntityCopyWith(UserStatisticsEntity value,
          $Res Function(UserStatisticsEntity) then) =
      _$UserStatisticsEntityCopyWithImpl<$Res, UserStatisticsEntity>;
  @useResult
  $Res call({int rightCount, int wrongCount});
}

/// @nodoc
class _$UserStatisticsEntityCopyWithImpl<$Res,
        $Val extends UserStatisticsEntity>
    implements $UserStatisticsEntityCopyWith<$Res> {
  _$UserStatisticsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatisticsEntity
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
abstract class _$$UserStatisticsEntityImplCopyWith<$Res>
    implements $UserStatisticsEntityCopyWith<$Res> {
  factory _$$UserStatisticsEntityImplCopyWith(_$UserStatisticsEntityImpl value,
          $Res Function(_$UserStatisticsEntityImpl) then) =
      __$$UserStatisticsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rightCount, int wrongCount});
}

/// @nodoc
class __$$UserStatisticsEntityImplCopyWithImpl<$Res>
    extends _$UserStatisticsEntityCopyWithImpl<$Res, _$UserStatisticsEntityImpl>
    implements _$$UserStatisticsEntityImplCopyWith<$Res> {
  __$$UserStatisticsEntityImplCopyWithImpl(_$UserStatisticsEntityImpl _value,
      $Res Function(_$UserStatisticsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rightCount = null,
    Object? wrongCount = null,
  }) {
    return _then(_$UserStatisticsEntityImpl(
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

class _$UserStatisticsEntityImpl implements _UserStatisticsEntity {
  const _$UserStatisticsEntityImpl(
      {required this.rightCount, required this.wrongCount});

  @override
  final int rightCount;
  @override
  final int wrongCount;

  @override
  String toString() {
    return 'UserStatisticsEntity(rightCount: $rightCount, wrongCount: $wrongCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsEntityImpl &&
            (identical(other.rightCount, rightCount) ||
                other.rightCount == rightCount) &&
            (identical(other.wrongCount, wrongCount) ||
                other.wrongCount == wrongCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rightCount, wrongCount);

  /// Create a copy of UserStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsEntityImplCopyWith<_$UserStatisticsEntityImpl>
      get copyWith =>
          __$$UserStatisticsEntityImplCopyWithImpl<_$UserStatisticsEntityImpl>(
              this, _$identity);
}

abstract class _UserStatisticsEntity implements UserStatisticsEntity {
  const factory _UserStatisticsEntity(
      {required final int rightCount,
      required final int wrongCount}) = _$UserStatisticsEntityImpl;

  @override
  int get rightCount;
  @override
  int get wrongCount;

  /// Create a copy of UserStatisticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsEntityImplCopyWith<_$UserStatisticsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
