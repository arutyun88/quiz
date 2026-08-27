// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewHistoryEntity {
  List<ReviewHistoryItemEntity> get items => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Create a copy of ReviewHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewHistoryEntityCopyWith<ReviewHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewHistoryEntityCopyWith<$Res> {
  factory $ReviewHistoryEntityCopyWith(
          ReviewHistoryEntity value, $Res Function(ReviewHistoryEntity) then) =
      _$ReviewHistoryEntityCopyWithImpl<$Res, ReviewHistoryEntity>;
  @useResult
  $Res call(
      {List<ReviewHistoryItemEntity> items, int total, int offset, int limit});
}

/// @nodoc
class _$ReviewHistoryEntityCopyWithImpl<$Res, $Val extends ReviewHistoryEntity>
    implements $ReviewHistoryEntityCopyWith<$Res> {
  _$ReviewHistoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReviewHistoryItemEntity>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewHistoryEntityImplCopyWith<$Res>
    implements $ReviewHistoryEntityCopyWith<$Res> {
  factory _$$ReviewHistoryEntityImplCopyWith(_$ReviewHistoryEntityImpl value,
          $Res Function(_$ReviewHistoryEntityImpl) then) =
      __$$ReviewHistoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReviewHistoryItemEntity> items, int total, int offset, int limit});
}

/// @nodoc
class __$$ReviewHistoryEntityImplCopyWithImpl<$Res>
    extends _$ReviewHistoryEntityCopyWithImpl<$Res, _$ReviewHistoryEntityImpl>
    implements _$$ReviewHistoryEntityImplCopyWith<$Res> {
  __$$ReviewHistoryEntityImplCopyWithImpl(_$ReviewHistoryEntityImpl _value,
      $Res Function(_$ReviewHistoryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_$ReviewHistoryEntityImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReviewHistoryItemEntity>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReviewHistoryEntityImpl implements _ReviewHistoryEntity {
  const _$ReviewHistoryEntityImpl(
      {required final List<ReviewHistoryItemEntity> items,
      required this.total,
      required this.offset,
      required this.limit})
      : _items = items;

  final List<ReviewHistoryItemEntity> _items;
  @override
  List<ReviewHistoryItemEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int total;
  @override
  final int offset;
  @override
  final int limit;

  @override
  String toString() {
    return 'ReviewHistoryEntity(items: $items, total: $total, offset: $offset, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewHistoryEntityImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), total, offset, limit);

  /// Create a copy of ReviewHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewHistoryEntityImplCopyWith<_$ReviewHistoryEntityImpl> get copyWith =>
      __$$ReviewHistoryEntityImplCopyWithImpl<_$ReviewHistoryEntityImpl>(
          this, _$identity);
}

abstract class _ReviewHistoryEntity implements ReviewHistoryEntity {
  const factory _ReviewHistoryEntity(
      {required final List<ReviewHistoryItemEntity> items,
      required final int total,
      required final int offset,
      required final int limit}) = _$ReviewHistoryEntityImpl;

  @override
  List<ReviewHistoryItemEntity> get items;
  @override
  int get total;
  @override
  int get offset;
  @override
  int get limit;

  /// Create a copy of ReviewHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewHistoryEntityImplCopyWith<_$ReviewHistoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewHistoryItemEntity {
  String get attemptId => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get questionVersionId => throw _privateConstructorUsedError;
  String get editionDate => throw _privateConstructorUsedError;
  DateTime get answeredAt => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String? get answerId => throw _privateConstructorUsedError;
  String? get correctAnswerId => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;
  String? get correctAnswer => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  bool get hintUsed => throw _privateConstructorUsedError;
  ReviewVersionStatus get versionStatus => throw _privateConstructorUsedError;
  bool get contentRedacted => throw _privateConstructorUsedError;

  /// Create a copy of ReviewHistoryItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewHistoryItemEntityCopyWith<ReviewHistoryItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewHistoryItemEntityCopyWith<$Res> {
  factory $ReviewHistoryItemEntityCopyWith(ReviewHistoryItemEntity value,
          $Res Function(ReviewHistoryItemEntity) then) =
      _$ReviewHistoryItemEntityCopyWithImpl<$Res, ReviewHistoryItemEntity>;
  @useResult
  $Res call(
      {String attemptId,
      String questionId,
      String questionVersionId,
      String editionDate,
      DateTime answeredAt,
      String action,
      String? answerId,
      String? correctAnswerId,
      String? question,
      String? topic,
      String? answer,
      String? correctAnswer,
      String? description,
      String? hint,
      bool hintUsed,
      ReviewVersionStatus versionStatus,
      bool contentRedacted});
}

/// @nodoc
class _$ReviewHistoryItemEntityCopyWithImpl<$Res,
        $Val extends ReviewHistoryItemEntity>
    implements $ReviewHistoryItemEntityCopyWith<$Res> {
  _$ReviewHistoryItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewHistoryItemEntity
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
              as ReviewVersionStatus,
      contentRedacted: null == contentRedacted
          ? _value.contentRedacted
          : contentRedacted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewHistoryItemEntityImplCopyWith<$Res>
    implements $ReviewHistoryItemEntityCopyWith<$Res> {
  factory _$$ReviewHistoryItemEntityImplCopyWith(
          _$ReviewHistoryItemEntityImpl value,
          $Res Function(_$ReviewHistoryItemEntityImpl) then) =
      __$$ReviewHistoryItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String attemptId,
      String questionId,
      String questionVersionId,
      String editionDate,
      DateTime answeredAt,
      String action,
      String? answerId,
      String? correctAnswerId,
      String? question,
      String? topic,
      String? answer,
      String? correctAnswer,
      String? description,
      String? hint,
      bool hintUsed,
      ReviewVersionStatus versionStatus,
      bool contentRedacted});
}

/// @nodoc
class __$$ReviewHistoryItemEntityImplCopyWithImpl<$Res>
    extends _$ReviewHistoryItemEntityCopyWithImpl<$Res,
        _$ReviewHistoryItemEntityImpl>
    implements _$$ReviewHistoryItemEntityImplCopyWith<$Res> {
  __$$ReviewHistoryItemEntityImplCopyWithImpl(
      _$ReviewHistoryItemEntityImpl _value,
      $Res Function(_$ReviewHistoryItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewHistoryItemEntity
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
    return _then(_$ReviewHistoryItemEntityImpl(
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
              as ReviewVersionStatus,
      contentRedacted: null == contentRedacted
          ? _value.contentRedacted
          : contentRedacted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReviewHistoryItemEntityImpl implements _ReviewHistoryItemEntity {
  const _$ReviewHistoryItemEntityImpl(
      {required this.attemptId,
      required this.questionId,
      required this.questionVersionId,
      required this.editionDate,
      required this.answeredAt,
      required this.action,
      required this.answerId,
      required this.correctAnswerId,
      required this.question,
      required this.topic,
      required this.answer,
      required this.correctAnswer,
      required this.description,
      required this.hint,
      required this.hintUsed,
      required this.versionStatus,
      required this.contentRedacted});

  @override
  final String attemptId;
  @override
  final String questionId;
  @override
  final String questionVersionId;
  @override
  final String editionDate;
  @override
  final DateTime answeredAt;
  @override
  final String action;
  @override
  final String? answerId;
  @override
  final String? correctAnswerId;
  @override
  final String? question;
  @override
  final String? topic;
  @override
  final String? answer;
  @override
  final String? correctAnswer;
  @override
  final String? description;
  @override
  final String? hint;
  @override
  final bool hintUsed;
  @override
  final ReviewVersionStatus versionStatus;
  @override
  final bool contentRedacted;

  @override
  String toString() {
    return 'ReviewHistoryItemEntity(attemptId: $attemptId, questionId: $questionId, questionVersionId: $questionVersionId, editionDate: $editionDate, answeredAt: $answeredAt, action: $action, answerId: $answerId, correctAnswerId: $correctAnswerId, question: $question, topic: $topic, answer: $answer, correctAnswer: $correctAnswer, description: $description, hint: $hint, hintUsed: $hintUsed, versionStatus: $versionStatus, contentRedacted: $contentRedacted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewHistoryItemEntityImpl &&
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

  /// Create a copy of ReviewHistoryItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewHistoryItemEntityImplCopyWith<_$ReviewHistoryItemEntityImpl>
      get copyWith => __$$ReviewHistoryItemEntityImplCopyWithImpl<
          _$ReviewHistoryItemEntityImpl>(this, _$identity);
}

abstract class _ReviewHistoryItemEntity implements ReviewHistoryItemEntity {
  const factory _ReviewHistoryItemEntity(
      {required final String attemptId,
      required final String questionId,
      required final String questionVersionId,
      required final String editionDate,
      required final DateTime answeredAt,
      required final String action,
      required final String? answerId,
      required final String? correctAnswerId,
      required final String? question,
      required final String? topic,
      required final String? answer,
      required final String? correctAnswer,
      required final String? description,
      required final String? hint,
      required final bool hintUsed,
      required final ReviewVersionStatus versionStatus,
      required final bool contentRedacted}) = _$ReviewHistoryItemEntityImpl;

  @override
  String get attemptId;
  @override
  String get questionId;
  @override
  String get questionVersionId;
  @override
  String get editionDate;
  @override
  DateTime get answeredAt;
  @override
  String get action;
  @override
  String? get answerId;
  @override
  String? get correctAnswerId;
  @override
  String? get question;
  @override
  String? get topic;
  @override
  String? get answer;
  @override
  String? get correctAnswer;
  @override
  String? get description;
  @override
  String? get hint;
  @override
  bool get hintUsed;
  @override
  ReviewVersionStatus get versionStatus;
  @override
  bool get contentRedacted;

  /// Create a copy of ReviewHistoryItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewHistoryItemEntityImplCopyWith<_$ReviewHistoryItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
