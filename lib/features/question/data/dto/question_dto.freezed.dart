// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) {
  return _QuestionDto.fromJson(json);
}

/// @nodoc
mixin _$QuestionDto {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TopicDto get topic => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;
  List<AnswerDto> get answers => throw _privateConstructorUsedError;

  /// Serializes this QuestionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionDtoCopyWith<QuestionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDtoCopyWith<$Res> {
  factory $QuestionDtoCopyWith(
          QuestionDto value, $Res Function(QuestionDto) then) =
      _$QuestionDtoCopyWithImpl<$Res, QuestionDto>;
  @useResult
  $Res call(
      {String id,
      String question,
      String description,
      TopicDto topic,
      String hint,
      List<AnswerDto> answers});

  $TopicDtoCopyWith<$Res> get topic;
}

/// @nodoc
class _$QuestionDtoCopyWithImpl<$Res, $Val extends QuestionDto>
    implements $QuestionDtoCopyWith<$Res> {
  _$QuestionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? description = null,
    Object? topic = null,
    Object? hint = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as TopicDto,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDto>,
    ) as $Val);
  }

  /// Create a copy of QuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TopicDtoCopyWith<$Res> get topic {
    return $TopicDtoCopyWith<$Res>(_value.topic, (value) {
      return _then(_value.copyWith(topic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionDtoImplCopyWith<$Res>
    implements $QuestionDtoCopyWith<$Res> {
  factory _$$QuestionDtoImplCopyWith(
          _$QuestionDtoImpl value, $Res Function(_$QuestionDtoImpl) then) =
      __$$QuestionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      String description,
      TopicDto topic,
      String hint,
      List<AnswerDto> answers});

  @override
  $TopicDtoCopyWith<$Res> get topic;
}

/// @nodoc
class __$$QuestionDtoImplCopyWithImpl<$Res>
    extends _$QuestionDtoCopyWithImpl<$Res, _$QuestionDtoImpl>
    implements _$$QuestionDtoImplCopyWith<$Res> {
  __$$QuestionDtoImplCopyWithImpl(
      _$QuestionDtoImpl _value, $Res Function(_$QuestionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? description = null,
    Object? topic = null,
    Object? hint = null,
    Object? answers = null,
  }) {
    return _then(_$QuestionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as TopicDto,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionDtoImpl implements _QuestionDto {
  const _$QuestionDtoImpl(
      {required this.id,
      required this.question,
      required this.description,
      required this.topic,
      required this.hint,
      required final List<AnswerDto> answers})
      : _answers = answers;

  factory _$QuestionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  @override
  final String description;
  @override
  final TopicDto topic;
  @override
  final String hint;
  final List<AnswerDto> _answers;
  @override
  List<AnswerDto> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QuestionDto(id: $id, question: $question, description: $description, topic: $topic, hint: $hint, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, description, topic,
      hint, const DeepCollectionEquality().hash(_answers));

  /// Create a copy of QuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionDtoImplCopyWith<_$QuestionDtoImpl> get copyWith =>
      __$$QuestionDtoImplCopyWithImpl<_$QuestionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionDtoImplToJson(
      this,
    );
  }
}

abstract class _QuestionDto implements QuestionDto {
  const factory _QuestionDto(
      {required final String id,
      required final String question,
      required final String description,
      required final TopicDto topic,
      required final String hint,
      required final List<AnswerDto> answers}) = _$QuestionDtoImpl;

  factory _QuestionDto.fromJson(Map<String, dynamic> json) =
      _$QuestionDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  String get description;
  @override
  TopicDto get topic;
  @override
  String get hint;
  @override
  List<AnswerDto> get answers;

  /// Create a copy of QuestionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionDtoImplCopyWith<_$QuestionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
