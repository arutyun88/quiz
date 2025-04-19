// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuestionEntity {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TopicEntity get topic => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;
  List<AnswerEntity> get answers => throw _privateConstructorUsedError;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionEntityCopyWith<QuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionEntityCopyWith<$Res> {
  factory $QuestionEntityCopyWith(
          QuestionEntity value, $Res Function(QuestionEntity) then) =
      _$QuestionEntityCopyWithImpl<$Res, QuestionEntity>;
  @useResult
  $Res call(
      {String id,
      String question,
      String description,
      TopicEntity topic,
      String hint,
      List<AnswerEntity> answers});

  $TopicEntityCopyWith<$Res> get topic;
}

/// @nodoc
class _$QuestionEntityCopyWithImpl<$Res, $Val extends QuestionEntity>
    implements $QuestionEntityCopyWith<$Res> {
  _$QuestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionEntity
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
              as TopicEntity,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerEntity>,
    ) as $Val);
  }

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TopicEntityCopyWith<$Res> get topic {
    return $TopicEntityCopyWith<$Res>(_value.topic, (value) {
      return _then(_value.copyWith(topic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionEntityImplCopyWith<$Res>
    implements $QuestionEntityCopyWith<$Res> {
  factory _$$QuestionEntityImplCopyWith(_$QuestionEntityImpl value,
          $Res Function(_$QuestionEntityImpl) then) =
      __$$QuestionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      String description,
      TopicEntity topic,
      String hint,
      List<AnswerEntity> answers});

  @override
  $TopicEntityCopyWith<$Res> get topic;
}

/// @nodoc
class __$$QuestionEntityImplCopyWithImpl<$Res>
    extends _$QuestionEntityCopyWithImpl<$Res, _$QuestionEntityImpl>
    implements _$$QuestionEntityImplCopyWith<$Res> {
  __$$QuestionEntityImplCopyWithImpl(
      _$QuestionEntityImpl _value, $Res Function(_$QuestionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionEntity
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
    return _then(_$QuestionEntityImpl(
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
              as TopicEntity,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerEntity>,
    ));
  }
}

/// @nodoc

class _$QuestionEntityImpl implements _QuestionEntity {
  const _$QuestionEntityImpl(
      {required this.id,
      required this.question,
      required this.description,
      required this.topic,
      required this.hint,
      required final List<AnswerEntity> answers})
      : _answers = answers;

  @override
  final String id;
  @override
  final String question;
  @override
  final String description;
  @override
  final TopicEntity topic;
  @override
  final String hint;
  final List<AnswerEntity> _answers;
  @override
  List<AnswerEntity> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QuestionEntity(id: $id, question: $question, description: $description, topic: $topic, hint: $hint, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, question, description, topic,
      hint, const DeepCollectionEquality().hash(_answers));

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionEntityImplCopyWith<_$QuestionEntityImpl> get copyWith =>
      __$$QuestionEntityImplCopyWithImpl<_$QuestionEntityImpl>(
          this, _$identity);
}

abstract class _QuestionEntity implements QuestionEntity {
  const factory _QuestionEntity(
      {required final String id,
      required final String question,
      required final String description,
      required final TopicEntity topic,
      required final String hint,
      required final List<AnswerEntity> answers}) = _$QuestionEntityImpl;

  @override
  String get id;
  @override
  String get question;
  @override
  String get description;
  @override
  TopicEntity get topic;
  @override
  String get hint;
  @override
  List<AnswerEntity> get answers;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionEntityImplCopyWith<_$QuestionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
