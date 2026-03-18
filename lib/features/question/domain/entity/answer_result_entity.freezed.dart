// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnswerResultEntity {
  String get answerId => throw _privateConstructorUsedError;
  String get correctAnswerId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Create a copy of AnswerResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerResultEntityCopyWith<AnswerResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerResultEntityCopyWith<$Res> {
  factory $AnswerResultEntityCopyWith(
          AnswerResultEntity value, $Res Function(AnswerResultEntity) then) =
      _$AnswerResultEntityCopyWithImpl<$Res, AnswerResultEntity>;
  @useResult
  $Res call(
      {String answerId,
      String correctAnswerId,
      String description,
      bool isCorrect});
}

/// @nodoc
class _$AnswerResultEntityCopyWithImpl<$Res, $Val extends AnswerResultEntity>
    implements $AnswerResultEntityCopyWith<$Res> {
  _$AnswerResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? correctAnswerId = null,
    Object? description = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerId: null == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerResultEntityImplCopyWith<$Res>
    implements $AnswerResultEntityCopyWith<$Res> {
  factory _$$AnswerResultEntityImplCopyWith(_$AnswerResultEntityImpl value,
          $Res Function(_$AnswerResultEntityImpl) then) =
      __$$AnswerResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String answerId,
      String correctAnswerId,
      String description,
      bool isCorrect});
}

/// @nodoc
class __$$AnswerResultEntityImplCopyWithImpl<$Res>
    extends _$AnswerResultEntityCopyWithImpl<$Res, _$AnswerResultEntityImpl>
    implements _$$AnswerResultEntityImplCopyWith<$Res> {
  __$$AnswerResultEntityImplCopyWithImpl(_$AnswerResultEntityImpl _value,
      $Res Function(_$AnswerResultEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? correctAnswerId = null,
    Object? description = null,
    Object? isCorrect = null,
  }) {
    return _then(_$AnswerResultEntityImpl(
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerId: null == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnswerResultEntityImpl implements _AnswerResultEntity {
  const _$AnswerResultEntityImpl(
      {required this.answerId,
      required this.correctAnswerId,
      required this.description,
      required this.isCorrect});

  @override
  final String answerId;
  @override
  final String correctAnswerId;
  @override
  final String description;
  @override
  final bool isCorrect;

  @override
  String toString() {
    return 'AnswerResultEntity(answerId: $answerId, correctAnswerId: $correctAnswerId, description: $description, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerResultEntityImpl &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.correctAnswerId, correctAnswerId) ||
                other.correctAnswerId == correctAnswerId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, answerId, correctAnswerId, description, isCorrect);

  /// Create a copy of AnswerResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerResultEntityImplCopyWith<_$AnswerResultEntityImpl> get copyWith =>
      __$$AnswerResultEntityImplCopyWithImpl<_$AnswerResultEntityImpl>(
          this, _$identity);
}

abstract class _AnswerResultEntity implements AnswerResultEntity {
  const factory _AnswerResultEntity(
      {required final String answerId,
      required final String correctAnswerId,
      required final String description,
      required final bool isCorrect}) = _$AnswerResultEntityImpl;

  @override
  String get answerId;
  @override
  String get correctAnswerId;
  @override
  String get description;
  @override
  bool get isCorrect;

  /// Create a copy of AnswerResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerResultEntityImplCopyWith<_$AnswerResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
