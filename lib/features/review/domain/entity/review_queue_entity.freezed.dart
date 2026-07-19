// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_queue_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewQueueEntity {
  List<ReviewItemEntity> get queued => throw _privateConstructorUsedError;
  int get queuedTotal => throw _privateConstructorUsedError;
  int get masteredTotal => throw _privateConstructorUsedError;

  /// Create a copy of ReviewQueueEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewQueueEntityCopyWith<ReviewQueueEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewQueueEntityCopyWith<$Res> {
  factory $ReviewQueueEntityCopyWith(
          ReviewQueueEntity value, $Res Function(ReviewQueueEntity) then) =
      _$ReviewQueueEntityCopyWithImpl<$Res, ReviewQueueEntity>;
  @useResult
  $Res call(
      {List<ReviewItemEntity> queued, int queuedTotal, int masteredTotal});
}

/// @nodoc
class _$ReviewQueueEntityCopyWithImpl<$Res, $Val extends ReviewQueueEntity>
    implements $ReviewQueueEntityCopyWith<$Res> {
  _$ReviewQueueEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewQueueEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queued = null,
    Object? queuedTotal = null,
    Object? masteredTotal = null,
  }) {
    return _then(_value.copyWith(
      queued: null == queued
          ? _value.queued
          : queued // ignore: cast_nullable_to_non_nullable
              as List<ReviewItemEntity>,
      queuedTotal: null == queuedTotal
          ? _value.queuedTotal
          : queuedTotal // ignore: cast_nullable_to_non_nullable
              as int,
      masteredTotal: null == masteredTotal
          ? _value.masteredTotal
          : masteredTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewQueueEntityImplCopyWith<$Res>
    implements $ReviewQueueEntityCopyWith<$Res> {
  factory _$$ReviewQueueEntityImplCopyWith(_$ReviewQueueEntityImpl value,
          $Res Function(_$ReviewQueueEntityImpl) then) =
      __$$ReviewQueueEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReviewItemEntity> queued, int queuedTotal, int masteredTotal});
}

/// @nodoc
class __$$ReviewQueueEntityImplCopyWithImpl<$Res>
    extends _$ReviewQueueEntityCopyWithImpl<$Res, _$ReviewQueueEntityImpl>
    implements _$$ReviewQueueEntityImplCopyWith<$Res> {
  __$$ReviewQueueEntityImplCopyWithImpl(_$ReviewQueueEntityImpl _value,
      $Res Function(_$ReviewQueueEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewQueueEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queued = null,
    Object? queuedTotal = null,
    Object? masteredTotal = null,
  }) {
    return _then(_$ReviewQueueEntityImpl(
      queued: null == queued
          ? _value._queued
          : queued // ignore: cast_nullable_to_non_nullable
              as List<ReviewItemEntity>,
      queuedTotal: null == queuedTotal
          ? _value.queuedTotal
          : queuedTotal // ignore: cast_nullable_to_non_nullable
              as int,
      masteredTotal: null == masteredTotal
          ? _value.masteredTotal
          : masteredTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReviewQueueEntityImpl implements _ReviewQueueEntity {
  const _$ReviewQueueEntityImpl(
      {required final List<ReviewItemEntity> queued,
      required this.queuedTotal,
      required this.masteredTotal})
      : _queued = queued;

  final List<ReviewItemEntity> _queued;
  @override
  List<ReviewItemEntity> get queued {
    if (_queued is EqualUnmodifiableListView) return _queued;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queued);
  }

  @override
  final int queuedTotal;
  @override
  final int masteredTotal;

  @override
  String toString() {
    return 'ReviewQueueEntity(queued: $queued, queuedTotal: $queuedTotal, masteredTotal: $masteredTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewQueueEntityImpl &&
            const DeepCollectionEquality().equals(other._queued, _queued) &&
            (identical(other.queuedTotal, queuedTotal) ||
                other.queuedTotal == queuedTotal) &&
            (identical(other.masteredTotal, masteredTotal) ||
                other.masteredTotal == masteredTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_queued), queuedTotal, masteredTotal);

  /// Create a copy of ReviewQueueEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewQueueEntityImplCopyWith<_$ReviewQueueEntityImpl> get copyWith =>
      __$$ReviewQueueEntityImplCopyWithImpl<_$ReviewQueueEntityImpl>(
          this, _$identity);
}

abstract class _ReviewQueueEntity implements ReviewQueueEntity {
  const factory _ReviewQueueEntity(
      {required final List<ReviewItemEntity> queued,
      required final int queuedTotal,
      required final int masteredTotal}) = _$ReviewQueueEntityImpl;

  @override
  List<ReviewItemEntity> get queued;
  @override
  int get queuedTotal;
  @override
  int get masteredTotal;

  /// Create a copy of ReviewQueueEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewQueueEntityImplCopyWith<_$ReviewQueueEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewItemEntity {
  String get question => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  int get wrongCount => throw _privateConstructorUsedError;
  int get correctCount => throw _privateConstructorUsedError;
  int get dueInDays => throw _privateConstructorUsedError;

  /// Create a copy of ReviewItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewItemEntityCopyWith<ReviewItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewItemEntityCopyWith<$Res> {
  factory $ReviewItemEntityCopyWith(
          ReviewItemEntity value, $Res Function(ReviewItemEntity) then) =
      _$ReviewItemEntityCopyWithImpl<$Res, ReviewItemEntity>;
  @useResult
  $Res call(
      {String question,
      String topic,
      int wrongCount,
      int correctCount,
      int dueInDays});
}

/// @nodoc
class _$ReviewItemEntityCopyWithImpl<$Res, $Val extends ReviewItemEntity>
    implements $ReviewItemEntityCopyWith<$Res> {
  _$ReviewItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? topic = null,
    Object? wrongCount = null,
    Object? correctCount = null,
    Object? dueInDays = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      wrongCount: null == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      dueInDays: null == dueInDays
          ? _value.dueInDays
          : dueInDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewItemEntityImplCopyWith<$Res>
    implements $ReviewItemEntityCopyWith<$Res> {
  factory _$$ReviewItemEntityImplCopyWith(_$ReviewItemEntityImpl value,
          $Res Function(_$ReviewItemEntityImpl) then) =
      __$$ReviewItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String question,
      String topic,
      int wrongCount,
      int correctCount,
      int dueInDays});
}

/// @nodoc
class __$$ReviewItemEntityImplCopyWithImpl<$Res>
    extends _$ReviewItemEntityCopyWithImpl<$Res, _$ReviewItemEntityImpl>
    implements _$$ReviewItemEntityImplCopyWith<$Res> {
  __$$ReviewItemEntityImplCopyWithImpl(_$ReviewItemEntityImpl _value,
      $Res Function(_$ReviewItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? topic = null,
    Object? wrongCount = null,
    Object? correctCount = null,
    Object? dueInDays = null,
  }) {
    return _then(_$ReviewItemEntityImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      wrongCount: null == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      dueInDays: null == dueInDays
          ? _value.dueInDays
          : dueInDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReviewItemEntityImpl implements _ReviewItemEntity {
  const _$ReviewItemEntityImpl(
      {required this.question,
      required this.topic,
      required this.wrongCount,
      required this.correctCount,
      required this.dueInDays});

  @override
  final String question;
  @override
  final String topic;
  @override
  final int wrongCount;
  @override
  final int correctCount;
  @override
  final int dueInDays;

  @override
  String toString() {
    return 'ReviewItemEntity(question: $question, topic: $topic, wrongCount: $wrongCount, correctCount: $correctCount, dueInDays: $dueInDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewItemEntityImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.wrongCount, wrongCount) ||
                other.wrongCount == wrongCount) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.dueInDays, dueInDays) ||
                other.dueInDays == dueInDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, question, topic, wrongCount, correctCount, dueInDays);

  /// Create a copy of ReviewItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewItemEntityImplCopyWith<_$ReviewItemEntityImpl> get copyWith =>
      __$$ReviewItemEntityImplCopyWithImpl<_$ReviewItemEntityImpl>(
          this, _$identity);
}

abstract class _ReviewItemEntity implements ReviewItemEntity {
  const factory _ReviewItemEntity(
      {required final String question,
      required final String topic,
      required final int wrongCount,
      required final int correctCount,
      required final int dueInDays}) = _$ReviewItemEntityImpl;

  @override
  String get question;
  @override
  String get topic;
  @override
  int get wrongCount;
  @override
  int get correctCount;
  @override
  int get dueInDays;

  /// Create a copy of ReviewItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewItemEntityImplCopyWith<_$ReviewItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
