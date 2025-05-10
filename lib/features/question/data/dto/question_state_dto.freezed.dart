// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionStateDto _$QuestionStateDtoFromJson(Map<String, dynamic> json) {
  return _QuestionStateDto.fromJson(json);
}

/// @nodoc
mixin _$QuestionStateDto {
  @JsonKey(name: 'question_id')
  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_answered')
  bool get isAnswered => throw _privateConstructorUsedError;

  /// Serializes this QuestionStateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionStateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionStateDtoCopyWith<QuestionStateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStateDtoCopyWith<$Res> {
  factory $QuestionStateDtoCopyWith(
          QuestionStateDto value, $Res Function(QuestionStateDto) then) =
      _$QuestionStateDtoCopyWithImpl<$Res, QuestionStateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'is_answered') bool isAnswered});
}

/// @nodoc
class _$QuestionStateDtoCopyWithImpl<$Res, $Val extends QuestionStateDto>
    implements $QuestionStateDtoCopyWith<$Res> {
  _$QuestionStateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionStateDto
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
abstract class _$$QuestionStateDtoImplCopyWith<$Res>
    implements $QuestionStateDtoCopyWith<$Res> {
  factory _$$QuestionStateDtoImplCopyWith(_$QuestionStateDtoImpl value,
          $Res Function(_$QuestionStateDtoImpl) then) =
      __$$QuestionStateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'is_answered') bool isAnswered});
}

/// @nodoc
class __$$QuestionStateDtoImplCopyWithImpl<$Res>
    extends _$QuestionStateDtoCopyWithImpl<$Res, _$QuestionStateDtoImpl>
    implements _$$QuestionStateDtoImplCopyWith<$Res> {
  __$$QuestionStateDtoImplCopyWithImpl(_$QuestionStateDtoImpl _value,
      $Res Function(_$QuestionStateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionStateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? isAnswered = null,
  }) {
    return _then(_$QuestionStateDtoImpl(
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
@JsonSerializable()
class _$QuestionStateDtoImpl implements _QuestionStateDto {
  const _$QuestionStateDtoImpl(
      {@JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'is_answered') required this.isAnswered});

  factory _$QuestionStateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionStateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final String questionId;
  @override
  @JsonKey(name: 'is_answered')
  final bool isAnswered;

  @override
  String toString() {
    return 'QuestionStateDto(questionId: $questionId, isAnswered: $isAnswered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionStateDtoImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, isAnswered);

  /// Create a copy of QuestionStateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionStateDtoImplCopyWith<_$QuestionStateDtoImpl> get copyWith =>
      __$$QuestionStateDtoImplCopyWithImpl<_$QuestionStateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionStateDtoImplToJson(
      this,
    );
  }
}

abstract class _QuestionStateDto implements QuestionStateDto {
  const factory _QuestionStateDto(
          {@JsonKey(name: 'question_id') required final String questionId,
          @JsonKey(name: 'is_answered') required final bool isAnswered}) =
      _$QuestionStateDtoImpl;

  factory _QuestionStateDto.fromJson(Map<String, dynamic> json) =
      _$QuestionStateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'question_id')
  String get questionId;
  @override
  @JsonKey(name: 'is_answered')
  bool get isAnswered;

  /// Create a copy of QuestionStateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionStateDtoImplCopyWith<_$QuestionStateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
