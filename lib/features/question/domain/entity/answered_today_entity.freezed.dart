// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_today_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnsweredTodayEntity {
  int get answeredQuestionCount => throw _privateConstructorUsedError;

  /// Create a copy of AnsweredTodayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnsweredTodayEntityCopyWith<AnsweredTodayEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnsweredTodayEntityCopyWith<$Res> {
  factory $AnsweredTodayEntityCopyWith(
          AnsweredTodayEntity value, $Res Function(AnsweredTodayEntity) then) =
      _$AnsweredTodayEntityCopyWithImpl<$Res, AnsweredTodayEntity>;
  @useResult
  $Res call({int answeredQuestionCount});
}

/// @nodoc
class _$AnsweredTodayEntityCopyWithImpl<$Res, $Val extends AnsweredTodayEntity>
    implements $AnsweredTodayEntityCopyWith<$Res> {
  _$AnsweredTodayEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnsweredTodayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answeredQuestionCount = null,
  }) {
    return _then(_value.copyWith(
      answeredQuestionCount: null == answeredQuestionCount
          ? _value.answeredQuestionCount
          : answeredQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnsweredTodayEntityImplCopyWith<$Res>
    implements $AnsweredTodayEntityCopyWith<$Res> {
  factory _$$AnsweredTodayEntityImplCopyWith(_$AnsweredTodayEntityImpl value,
          $Res Function(_$AnsweredTodayEntityImpl) then) =
      __$$AnsweredTodayEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int answeredQuestionCount});
}

/// @nodoc
class __$$AnsweredTodayEntityImplCopyWithImpl<$Res>
    extends _$AnsweredTodayEntityCopyWithImpl<$Res, _$AnsweredTodayEntityImpl>
    implements _$$AnsweredTodayEntityImplCopyWith<$Res> {
  __$$AnsweredTodayEntityImplCopyWithImpl(_$AnsweredTodayEntityImpl _value,
      $Res Function(_$AnsweredTodayEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnsweredTodayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answeredQuestionCount = null,
  }) {
    return _then(_$AnsweredTodayEntityImpl(
      answeredQuestionCount: null == answeredQuestionCount
          ? _value.answeredQuestionCount
          : answeredQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AnsweredTodayEntityImpl extends _AnsweredTodayEntity {
  const _$AnsweredTodayEntityImpl({required this.answeredQuestionCount})
      : super._();

  @override
  final int answeredQuestionCount;

  @override
  String toString() {
    return 'AnsweredTodayEntity(answeredQuestionCount: $answeredQuestionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredTodayEntityImpl &&
            (identical(other.answeredQuestionCount, answeredQuestionCount) ||
                other.answeredQuestionCount == answeredQuestionCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answeredQuestionCount);

  /// Create a copy of AnsweredTodayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredTodayEntityImplCopyWith<_$AnsweredTodayEntityImpl> get copyWith =>
      __$$AnsweredTodayEntityImplCopyWithImpl<_$AnsweredTodayEntityImpl>(
          this, _$identity);
}

abstract class _AnsweredTodayEntity extends AnsweredTodayEntity {
  const factory _AnsweredTodayEntity(
      {required final int answeredQuestionCount}) = _$AnsweredTodayEntityImpl;
  const _AnsweredTodayEntity._() : super._();

  @override
  int get answeredQuestionCount;

  /// Create a copy of AnsweredTodayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnsweredTodayEntityImplCopyWith<_$AnsweredTodayEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
