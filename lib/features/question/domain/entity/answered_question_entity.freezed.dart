// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnsweredQuestionEntity {
  String get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answerId => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Create a copy of AnsweredQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnsweredQuestionEntityCopyWith<AnsweredQuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnsweredQuestionEntityCopyWith<$Res> {
  factory $AnsweredQuestionEntityCopyWith(AnsweredQuestionEntity value,
          $Res Function(AnsweredQuestionEntity) then) =
      _$AnsweredQuestionEntityCopyWithImpl<$Res, AnsweredQuestionEntity>;
  @useResult
  $Res call(
      {String questionId,
      String question,
      String answerId,
      String answer,
      bool isCorrect});
}

/// @nodoc
class _$AnsweredQuestionEntityCopyWithImpl<$Res,
        $Val extends AnsweredQuestionEntity>
    implements $AnsweredQuestionEntityCopyWith<$Res> {
  _$AnsweredQuestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnsweredQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? answerId = null,
    Object? answer = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnsweredQuestionEntityImplCopyWith<$Res>
    implements $AnsweredQuestionEntityCopyWith<$Res> {
  factory _$$AnsweredQuestionEntityImplCopyWith(
          _$AnsweredQuestionEntityImpl value,
          $Res Function(_$AnsweredQuestionEntityImpl) then) =
      __$$AnsweredQuestionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      String question,
      String answerId,
      String answer,
      bool isCorrect});
}

/// @nodoc
class __$$AnsweredQuestionEntityImplCopyWithImpl<$Res>
    extends _$AnsweredQuestionEntityCopyWithImpl<$Res,
        _$AnsweredQuestionEntityImpl>
    implements _$$AnsweredQuestionEntityImplCopyWith<$Res> {
  __$$AnsweredQuestionEntityImplCopyWithImpl(
      _$AnsweredQuestionEntityImpl _value,
      $Res Function(_$AnsweredQuestionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnsweredQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? answerId = null,
    Object? answer = null,
    Object? isCorrect = null,
  }) {
    return _then(_$AnsweredQuestionEntityImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnsweredQuestionEntityImpl implements _AnsweredQuestionEntity {
  const _$AnsweredQuestionEntityImpl(
      {required this.questionId,
      required this.question,
      required this.answerId,
      required this.answer,
      required this.isCorrect});

  @override
  final String questionId;
  @override
  final String question;
  @override
  final String answerId;
  @override
  final String answer;
  @override
  final bool isCorrect;

  @override
  String toString() {
    return 'AnsweredQuestionEntity(questionId: $questionId, question: $question, answerId: $answerId, answer: $answer, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredQuestionEntityImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, question, answerId, answer, isCorrect);

  /// Create a copy of AnsweredQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredQuestionEntityImplCopyWith<_$AnsweredQuestionEntityImpl>
      get copyWith => __$$AnsweredQuestionEntityImplCopyWithImpl<
          _$AnsweredQuestionEntityImpl>(this, _$identity);
}

abstract class _AnsweredQuestionEntity implements AnsweredQuestionEntity {
  const factory _AnsweredQuestionEntity(
      {required final String questionId,
      required final String question,
      required final String answerId,
      required final String answer,
      required final bool isCorrect}) = _$AnsweredQuestionEntityImpl;

  @override
  String get questionId;
  @override
  String get question;
  @override
  String get answerId;
  @override
  String get answer;
  @override
  bool get isCorrect;

  /// Create a copy of AnsweredQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnsweredQuestionEntityImplCopyWith<_$AnsweredQuestionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
