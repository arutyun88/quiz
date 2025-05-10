// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuestionStateEntity {
  String get questionId => throw _privateConstructorUsedError;
  bool get isAnswered => throw _privateConstructorUsedError;

  /// Create a copy of QuestionStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionStateEntityCopyWith<QuestionStateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStateEntityCopyWith<$Res> {
  factory $QuestionStateEntityCopyWith(
          QuestionStateEntity value, $Res Function(QuestionStateEntity) then) =
      _$QuestionStateEntityCopyWithImpl<$Res, QuestionStateEntity>;
  @useResult
  $Res call({String questionId, bool isAnswered});
}

/// @nodoc
class _$QuestionStateEntityCopyWithImpl<$Res, $Val extends QuestionStateEntity>
    implements $QuestionStateEntityCopyWith<$Res> {
  _$QuestionStateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? isAnswered = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionStateEntityImplCopyWith<$Res>
    implements $QuestionStateEntityCopyWith<$Res> {
  factory _$$QuestionStateEntityImplCopyWith(_$QuestionStateEntityImpl value,
          $Res Function(_$QuestionStateEntityImpl) then) =
      __$$QuestionStateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String questionId, bool isAnswered});
}

/// @nodoc
class __$$QuestionStateEntityImplCopyWithImpl<$Res>
    extends _$QuestionStateEntityCopyWithImpl<$Res, _$QuestionStateEntityImpl>
    implements _$$QuestionStateEntityImplCopyWith<$Res> {
  __$$QuestionStateEntityImplCopyWithImpl(_$QuestionStateEntityImpl _value,
      $Res Function(_$QuestionStateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? isAnswered = null,
  }) {
    return _then(_$QuestionStateEntityImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QuestionStateEntityImpl implements _QuestionStateEntity {
  const _$QuestionStateEntityImpl(
      {required this.questionId, required this.isAnswered});

  @override
  final String questionId;
  @override
  final bool isAnswered;

  @override
  String toString() {
    return 'QuestionStateEntity(questionId: $questionId, isAnswered: $isAnswered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionStateEntityImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, isAnswered);

  /// Create a copy of QuestionStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionStateEntityImplCopyWith<_$QuestionStateEntityImpl> get copyWith =>
      __$$QuestionStateEntityImplCopyWithImpl<_$QuestionStateEntityImpl>(
          this, _$identity);
}

abstract class _QuestionStateEntity implements QuestionStateEntity {
  const factory _QuestionStateEntity(
      {required final String questionId,
      required final bool isAnswered}) = _$QuestionStateEntityImpl;

  @override
  String get questionId;
  @override
  bool get isAnswered;

  /// Create a copy of QuestionStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionStateEntityImplCopyWith<_$QuestionStateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
