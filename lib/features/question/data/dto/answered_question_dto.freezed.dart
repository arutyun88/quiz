// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_question_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnsweredQuestionDto _$AnsweredQuestionDtoFromJson(Map<String, dynamic> json) {
  return _AnsweredQuestionDto.fromJson(json);
}

/// @nodoc
mixin _$AnsweredQuestionDto {
  @JsonKey(name: 'question_id')
  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_id')
  String get answerId => throw _privateConstructorUsedError;

  /// Serializes this AnsweredQuestionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnsweredQuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnsweredQuestionDtoCopyWith<AnsweredQuestionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnsweredQuestionDtoCopyWith<$Res> {
  factory $AnsweredQuestionDtoCopyWith(
          AnsweredQuestionDto value, $Res Function(AnsweredQuestionDto) then) =
      _$AnsweredQuestionDtoCopyWithImpl<$Res, AnsweredQuestionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'answer_id') String answerId});
}

/// @nodoc
class _$AnsweredQuestionDtoCopyWithImpl<$Res, $Val extends AnsweredQuestionDto>
    implements $AnsweredQuestionDtoCopyWith<$Res> {
  _$AnsweredQuestionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnsweredQuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? answerId = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnsweredQuestionDtoImplCopyWith<$Res>
    implements $AnsweredQuestionDtoCopyWith<$Res> {
  factory _$$AnsweredQuestionDtoImplCopyWith(_$AnsweredQuestionDtoImpl value,
          $Res Function(_$AnsweredQuestionDtoImpl) then) =
      __$$AnsweredQuestionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'answer_id') String answerId});
}

/// @nodoc
class __$$AnsweredQuestionDtoImplCopyWithImpl<$Res>
    extends _$AnsweredQuestionDtoCopyWithImpl<$Res, _$AnsweredQuestionDtoImpl>
    implements _$$AnsweredQuestionDtoImplCopyWith<$Res> {
  __$$AnsweredQuestionDtoImplCopyWithImpl(_$AnsweredQuestionDtoImpl _value,
      $Res Function(_$AnsweredQuestionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnsweredQuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? answerId = null,
  }) {
    return _then(_$AnsweredQuestionDtoImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnsweredQuestionDtoImpl implements _AnsweredQuestionDto {
  const _$AnsweredQuestionDtoImpl(
      {@JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'answer_id') required this.answerId});

  factory _$AnsweredQuestionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnsweredQuestionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final String questionId;
  @override
  @JsonKey(name: 'answer_id')
  final String answerId;

  @override
  String toString() {
    return 'AnsweredQuestionDto(questionId: $questionId, answerId: $answerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnsweredQuestionDtoImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, answerId);

  /// Create a copy of AnsweredQuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnsweredQuestionDtoImplCopyWith<_$AnsweredQuestionDtoImpl> get copyWith =>
      __$$AnsweredQuestionDtoImplCopyWithImpl<_$AnsweredQuestionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnsweredQuestionDtoImplToJson(
      this,
    );
  }
}

abstract class _AnsweredQuestionDto implements AnsweredQuestionDto {
  const factory _AnsweredQuestionDto(
          {@JsonKey(name: 'question_id') required final String questionId,
          @JsonKey(name: 'answer_id') required final String answerId}) =
      _$AnsweredQuestionDtoImpl;

  factory _AnsweredQuestionDto.fromJson(Map<String, dynamic> json) =
      _$AnsweredQuestionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'question_id')
  String get questionId;
  @override
  @JsonKey(name: 'answer_id')
  String get answerId;

  /// Create a copy of AnsweredQuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnsweredQuestionDtoImplCopyWith<_$AnsweredQuestionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
