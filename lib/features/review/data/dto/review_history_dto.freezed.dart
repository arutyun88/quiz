// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewHistoryItemDto _$ReviewHistoryItemDtoFromJson(Map<String, dynamic> json) {
  return _ReviewHistoryItemDto.fromJson(json);
}

/// @nodoc
mixin _$ReviewHistoryItemDto {
  @JsonKey(name: 'attempt_id')
  String get attemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_version_id')
  String get questionVersionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'edition_date')
  String get editionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered_at')
  DateTime get answeredAt => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_id')
  String? get answerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer_id')
  String? get correctAnswerId => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  @JsonKey(name: 'hint_used')
  bool get hintUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'version_status')
  String get versionStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_redacted')
  bool get contentRedacted => throw _privateConstructorUsedError;

  /// Serializes this ReviewHistoryItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewHistoryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewHistoryItemDtoCopyWith<ReviewHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewHistoryItemDtoCopyWith<$Res> {
  factory $ReviewHistoryItemDtoCopyWith(ReviewHistoryItemDto value,
          $Res Function(ReviewHistoryItemDto) then) =
      _$ReviewHistoryItemDtoCopyWithImpl<$Res, ReviewHistoryItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attempt_id') String attemptId,
      @JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'question_version_id') String questionVersionId,
      @JsonKey(name: 'edition_date') String editionDate,
      @JsonKey(name: 'answered_at') DateTime answeredAt,
      String action,
      @JsonKey(name: 'answer_id') String? answerId,
      @JsonKey(name: 'correct_answer_id') String? correctAnswerId,
      String? question,
      String? topic,
      String? answer,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      String? description,
      String? hint,
      @JsonKey(name: 'hint_used') bool hintUsed,
      @JsonKey(name: 'version_status') String versionStatus,
      @JsonKey(name: 'content_redacted') bool contentRedacted});
}

/// @nodoc
class _$ReviewHistoryItemDtoCopyWithImpl<$Res,
        $Val extends ReviewHistoryItemDto>
    implements $ReviewHistoryItemDtoCopyWith<$Res> {
  _$ReviewHistoryItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewHistoryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attemptId = null,
    Object? questionId = null,
    Object? questionVersionId = null,
    Object? editionDate = null,
    Object? answeredAt = null,
    Object? action = null,
    Object? answerId = freezed,
    Object? correctAnswerId = freezed,
    Object? question = freezed,
    Object? topic = freezed,
    Object? answer = freezed,
    Object? correctAnswer = freezed,
    Object? description = freezed,
    Object? hint = freezed,
    Object? hintUsed = null,
    Object? versionStatus = null,
    Object? contentRedacted = null,
  }) {
    return _then(_value.copyWith(
      attemptId: null == attemptId
          ? _value.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionVersionId: null == questionVersionId
          ? _value.questionVersionId
          : questionVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      editionDate: null == editionDate
          ? _value.editionDate
          : editionDate // ignore: cast_nullable_to_non_nullable
              as String,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerId: freezed == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      hintUsed: null == hintUsed
          ? _value.hintUsed
          : hintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      versionStatus: null == versionStatus
          ? _value.versionStatus
          : versionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      contentRedacted: null == contentRedacted
          ? _value.contentRedacted
          : contentRedacted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewHistoryItemDtoImplCopyWith<$Res>
    implements $ReviewHistoryItemDtoCopyWith<$Res> {
  factory _$$ReviewHistoryItemDtoImplCopyWith(_$ReviewHistoryItemDtoImpl value,
          $Res Function(_$ReviewHistoryItemDtoImpl) then) =
      __$$ReviewHistoryItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attempt_id') String attemptId,
      @JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'question_version_id') String questionVersionId,
      @JsonKey(name: 'edition_date') String editionDate,
      @JsonKey(name: 'answered_at') DateTime answeredAt,
      String action,
      @JsonKey(name: 'answer_id') String? answerId,
      @JsonKey(name: 'correct_answer_id') String? correctAnswerId,
      String? question,
      String? topic,
      String? answer,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      String? description,
      String? hint,
      @JsonKey(name: 'hint_used') bool hintUsed,
      @JsonKey(name: 'version_status') String versionStatus,
      @JsonKey(name: 'content_redacted') bool contentRedacted});
}

/// @nodoc
class __$$ReviewHistoryItemDtoImplCopyWithImpl<$Res>
    extends _$ReviewHistoryItemDtoCopyWithImpl<$Res, _$ReviewHistoryItemDtoImpl>
    implements _$$ReviewHistoryItemDtoImplCopyWith<$Res> {
  __$$ReviewHistoryItemDtoImplCopyWithImpl(_$ReviewHistoryItemDtoImpl _value,
      $Res Function(_$ReviewHistoryItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewHistoryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attemptId = null,
    Object? questionId = null,
    Object? questionVersionId = null,
    Object? editionDate = null,
    Object? answeredAt = null,
    Object? action = null,
    Object? answerId = freezed,
    Object? correctAnswerId = freezed,
    Object? question = freezed,
    Object? topic = freezed,
    Object? answer = freezed,
    Object? correctAnswer = freezed,
    Object? description = freezed,
    Object? hint = freezed,
    Object? hintUsed = null,
    Object? versionStatus = null,
    Object? contentRedacted = null,
  }) {
    return _then(_$ReviewHistoryItemDtoImpl(
      attemptId: null == attemptId
          ? _value.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionVersionId: null == questionVersionId
          ? _value.questionVersionId
          : questionVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      editionDate: null == editionDate
          ? _value.editionDate
          : editionDate // ignore: cast_nullable_to_non_nullable
              as String,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerId: freezed == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      hintUsed: null == hintUsed
          ? _value.hintUsed
          : hintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      versionStatus: null == versionStatus
          ? _value.versionStatus
          : versionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      contentRedacted: null == contentRedacted
          ? _value.contentRedacted
          : contentRedacted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewHistoryItemDtoImpl implements _ReviewHistoryItemDto {
  const _$ReviewHistoryItemDtoImpl(
      {@JsonKey(name: 'attempt_id') required this.attemptId,
      @JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'question_version_id') required this.questionVersionId,
      @JsonKey(name: 'edition_date') required this.editionDate,
      @JsonKey(name: 'answered_at') required this.answeredAt,
      required this.action,
      @JsonKey(name: 'answer_id') required this.answerId,
      @JsonKey(name: 'correct_answer_id') required this.correctAnswerId,
      required this.question,
      required this.topic,
      required this.answer,
      @JsonKey(name: 'correct_answer') required this.correctAnswer,
      required this.description,
      required this.hint,
      @JsonKey(name: 'hint_used') required this.hintUsed,
      @JsonKey(name: 'version_status') required this.versionStatus,
      @JsonKey(name: 'content_redacted') required this.contentRedacted});

  factory _$ReviewHistoryItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewHistoryItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'attempt_id')
  final String attemptId;
  @override
  @JsonKey(name: 'question_id')
  final String questionId;
  @override
  @JsonKey(name: 'question_version_id')
  final String questionVersionId;
  @override
  @JsonKey(name: 'edition_date')
  final String editionDate;
  @override
  @JsonKey(name: 'answered_at')
  final DateTime answeredAt;
  @override
  final String action;
  @override
  @JsonKey(name: 'answer_id')
  final String? answerId;
  @override
  @JsonKey(name: 'correct_answer_id')
  final String? correctAnswerId;
  @override
  final String? question;
  @override
  final String? topic;
  @override
  final String? answer;
  @override
  @JsonKey(name: 'correct_answer')
  final String? correctAnswer;
  @override
  final String? description;
  @override
  final String? hint;
  @override
  @JsonKey(name: 'hint_used')
  final bool hintUsed;
  @override
  @JsonKey(name: 'version_status')
  final String versionStatus;
  @override
  @JsonKey(name: 'content_redacted')
  final bool contentRedacted;

  @override
  String toString() {
    return 'ReviewHistoryItemDto(attemptId: $attemptId, questionId: $questionId, questionVersionId: $questionVersionId, editionDate: $editionDate, answeredAt: $answeredAt, action: $action, answerId: $answerId, correctAnswerId: $correctAnswerId, question: $question, topic: $topic, answer: $answer, correctAnswer: $correctAnswer, description: $description, hint: $hint, hintUsed: $hintUsed, versionStatus: $versionStatus, contentRedacted: $contentRedacted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewHistoryItemDtoImpl &&
            (identical(other.attemptId, attemptId) ||
                other.attemptId == attemptId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionVersionId, questionVersionId) ||
                other.questionVersionId == questionVersionId) &&
            (identical(other.editionDate, editionDate) ||
                other.editionDate == editionDate) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.correctAnswerId, correctAnswerId) ||
                other.correctAnswerId == correctAnswerId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.hintUsed, hintUsed) ||
                other.hintUsed == hintUsed) &&
            (identical(other.versionStatus, versionStatus) ||
                other.versionStatus == versionStatus) &&
            (identical(other.contentRedacted, contentRedacted) ||
                other.contentRedacted == contentRedacted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      attemptId,
      questionId,
      questionVersionId,
      editionDate,
      answeredAt,
      action,
      answerId,
      correctAnswerId,
      question,
      topic,
      answer,
      correctAnswer,
      description,
      hint,
      hintUsed,
      versionStatus,
      contentRedacted);

  /// Create a copy of ReviewHistoryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewHistoryItemDtoImplCopyWith<_$ReviewHistoryItemDtoImpl>
      get copyWith =>
          __$$ReviewHistoryItemDtoImplCopyWithImpl<_$ReviewHistoryItemDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewHistoryItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ReviewHistoryItemDto implements ReviewHistoryItemDto {
  const factory _ReviewHistoryItemDto(
      {@JsonKey(name: 'attempt_id') required final String attemptId,
      @JsonKey(name: 'question_id') required final String questionId,
      @JsonKey(name: 'question_version_id')
      required final String questionVersionId,
      @JsonKey(name: 'edition_date') required final String editionDate,
      @JsonKey(name: 'answered_at') required final DateTime answeredAt,
      required final String action,
      @JsonKey(name: 'answer_id') required final String? answerId,
      @JsonKey(name: 'correct_answer_id')
      required final String? correctAnswerId,
      required final String? question,
      required final String? topic,
      required final String? answer,
      @JsonKey(name: 'correct_answer') required final String? correctAnswer,
      required final String? description,
      required final String? hint,
      @JsonKey(name: 'hint_used') required final bool hintUsed,
      @JsonKey(name: 'version_status') required final String versionStatus,
      @JsonKey(name: 'content_redacted')
      required final bool contentRedacted}) = _$ReviewHistoryItemDtoImpl;

  factory _ReviewHistoryItemDto.fromJson(Map<String, dynamic> json) =
      _$ReviewHistoryItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'attempt_id')
  String get attemptId;
  @override
  @JsonKey(name: 'question_id')
  String get questionId;
  @override
  @JsonKey(name: 'question_version_id')
  String get questionVersionId;
  @override
  @JsonKey(name: 'edition_date')
  String get editionDate;
  @override
  @JsonKey(name: 'answered_at')
  DateTime get answeredAt;
  @override
  String get action;
  @override
  @JsonKey(name: 'answer_id')
  String? get answerId;
  @override
  @JsonKey(name: 'correct_answer_id')
  String? get correctAnswerId;
  @override
  String? get question;
  @override
  String? get topic;
  @override
  String? get answer;
  @override
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer;
  @override
  String? get description;
  @override
  String? get hint;
  @override
  @JsonKey(name: 'hint_used')
  bool get hintUsed;
  @override
  @JsonKey(name: 'version_status')
  String get versionStatus;
  @override
  @JsonKey(name: 'content_redacted')
  bool get contentRedacted;

  /// Create a copy of ReviewHistoryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewHistoryItemDtoImplCopyWith<_$ReviewHistoryItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
