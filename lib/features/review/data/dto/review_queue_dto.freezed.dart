// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_queue_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewQueueDto _$ReviewQueueDtoFromJson(Map<String, dynamic> json) {
  return _ReviewQueueDto.fromJson(json);
}

/// @nodoc
mixin _$ReviewQueueDto {
  List<ReviewItemDto> get queued => throw _privateConstructorUsedError;
  @JsonKey(name: 'queued_total')
  int get queuedTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'mastered_total')
  int get masteredTotal => throw _privateConstructorUsedError;

  /// Serializes this ReviewQueueDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewQueueDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewQueueDtoCopyWith<ReviewQueueDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewQueueDtoCopyWith<$Res> {
  factory $ReviewQueueDtoCopyWith(
          ReviewQueueDto value, $Res Function(ReviewQueueDto) then) =
      _$ReviewQueueDtoCopyWithImpl<$Res, ReviewQueueDto>;
  @useResult
  $Res call(
      {List<ReviewItemDto> queued,
      @JsonKey(name: 'queued_total') int queuedTotal,
      @JsonKey(name: 'mastered_total') int masteredTotal});
}

/// @nodoc
class _$ReviewQueueDtoCopyWithImpl<$Res, $Val extends ReviewQueueDto>
    implements $ReviewQueueDtoCopyWith<$Res> {
  _$ReviewQueueDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewQueueDto
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
              as List<ReviewItemDto>,
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
abstract class _$$ReviewQueueDtoImplCopyWith<$Res>
    implements $ReviewQueueDtoCopyWith<$Res> {
  factory _$$ReviewQueueDtoImplCopyWith(_$ReviewQueueDtoImpl value,
          $Res Function(_$ReviewQueueDtoImpl) then) =
      __$$ReviewQueueDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReviewItemDto> queued,
      @JsonKey(name: 'queued_total') int queuedTotal,
      @JsonKey(name: 'mastered_total') int masteredTotal});
}

/// @nodoc
class __$$ReviewQueueDtoImplCopyWithImpl<$Res>
    extends _$ReviewQueueDtoCopyWithImpl<$Res, _$ReviewQueueDtoImpl>
    implements _$$ReviewQueueDtoImplCopyWith<$Res> {
  __$$ReviewQueueDtoImplCopyWithImpl(
      _$ReviewQueueDtoImpl _value, $Res Function(_$ReviewQueueDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewQueueDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queued = null,
    Object? queuedTotal = null,
    Object? masteredTotal = null,
  }) {
    return _then(_$ReviewQueueDtoImpl(
      queued: null == queued
          ? _value._queued
          : queued // ignore: cast_nullable_to_non_nullable
              as List<ReviewItemDto>,
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
@JsonSerializable()
class _$ReviewQueueDtoImpl implements _ReviewQueueDto {
  const _$ReviewQueueDtoImpl(
      {required final List<ReviewItemDto> queued,
      @JsonKey(name: 'queued_total') required this.queuedTotal,
      @JsonKey(name: 'mastered_total') required this.masteredTotal})
      : _queued = queued;

  factory _$ReviewQueueDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewQueueDtoImplFromJson(json);

  final List<ReviewItemDto> _queued;
  @override
  List<ReviewItemDto> get queued {
    if (_queued is EqualUnmodifiableListView) return _queued;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queued);
  }

  @override
  @JsonKey(name: 'queued_total')
  final int queuedTotal;
  @override
  @JsonKey(name: 'mastered_total')
  final int masteredTotal;

  @override
  String toString() {
    return 'ReviewQueueDto(queued: $queued, queuedTotal: $queuedTotal, masteredTotal: $masteredTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewQueueDtoImpl &&
            const DeepCollectionEquality().equals(other._queued, _queued) &&
            (identical(other.queuedTotal, queuedTotal) ||
                other.queuedTotal == queuedTotal) &&
            (identical(other.masteredTotal, masteredTotal) ||
                other.masteredTotal == masteredTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_queued), queuedTotal, masteredTotal);

  /// Create a copy of ReviewQueueDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewQueueDtoImplCopyWith<_$ReviewQueueDtoImpl> get copyWith =>
      __$$ReviewQueueDtoImplCopyWithImpl<_$ReviewQueueDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewQueueDtoImplToJson(
      this,
    );
  }
}

abstract class _ReviewQueueDto implements ReviewQueueDto {
  const factory _ReviewQueueDto(
          {required final List<ReviewItemDto> queued,
          @JsonKey(name: 'queued_total') required final int queuedTotal,
          @JsonKey(name: 'mastered_total') required final int masteredTotal}) =
      _$ReviewQueueDtoImpl;

  factory _ReviewQueueDto.fromJson(Map<String, dynamic> json) =
      _$ReviewQueueDtoImpl.fromJson;

  @override
  List<ReviewItemDto> get queued;
  @override
  @JsonKey(name: 'queued_total')
  int get queuedTotal;
  @override
  @JsonKey(name: 'mastered_total')
  int get masteredTotal;

  /// Create a copy of ReviewQueueDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewQueueDtoImplCopyWith<_$ReviewQueueDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewItemDto _$ReviewItemDtoFromJson(Map<String, dynamic> json) {
  return _ReviewItemDto.fromJson(json);
}

/// @nodoc
mixin _$ReviewItemDto {
  String get question => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'wrong_count')
  int get wrongCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_count')
  int get correctCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_in_days')
  int get dueInDays => throw _privateConstructorUsedError;

  /// Serializes this ReviewItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewItemDtoCopyWith<ReviewItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewItemDtoCopyWith<$Res> {
  factory $ReviewItemDtoCopyWith(
          ReviewItemDto value, $Res Function(ReviewItemDto) then) =
      _$ReviewItemDtoCopyWithImpl<$Res, ReviewItemDto>;
  @useResult
  $Res call(
      {String question,
      String topic,
      @JsonKey(name: 'wrong_count') int wrongCount,
      @JsonKey(name: 'correct_count') int correctCount,
      @JsonKey(name: 'due_in_days') int dueInDays});
}

/// @nodoc
class _$ReviewItemDtoCopyWithImpl<$Res, $Val extends ReviewItemDto>
    implements $ReviewItemDtoCopyWith<$Res> {
  _$ReviewItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewItemDto
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
abstract class _$$ReviewItemDtoImplCopyWith<$Res>
    implements $ReviewItemDtoCopyWith<$Res> {
  factory _$$ReviewItemDtoImplCopyWith(
          _$ReviewItemDtoImpl value, $Res Function(_$ReviewItemDtoImpl) then) =
      __$$ReviewItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String question,
      String topic,
      @JsonKey(name: 'wrong_count') int wrongCount,
      @JsonKey(name: 'correct_count') int correctCount,
      @JsonKey(name: 'due_in_days') int dueInDays});
}

/// @nodoc
class __$$ReviewItemDtoImplCopyWithImpl<$Res>
    extends _$ReviewItemDtoCopyWithImpl<$Res, _$ReviewItemDtoImpl>
    implements _$$ReviewItemDtoImplCopyWith<$Res> {
  __$$ReviewItemDtoImplCopyWithImpl(
      _$ReviewItemDtoImpl _value, $Res Function(_$ReviewItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewItemDto
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
    return _then(_$ReviewItemDtoImpl(
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
@JsonSerializable()
class _$ReviewItemDtoImpl implements _ReviewItemDto {
  const _$ReviewItemDtoImpl(
      {required this.question,
      required this.topic,
      @JsonKey(name: 'wrong_count') required this.wrongCount,
      @JsonKey(name: 'correct_count') required this.correctCount,
      @JsonKey(name: 'due_in_days') required this.dueInDays});

  factory _$ReviewItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewItemDtoImplFromJson(json);

  @override
  final String question;
  @override
  final String topic;
  @override
  @JsonKey(name: 'wrong_count')
  final int wrongCount;
  @override
  @JsonKey(name: 'correct_count')
  final int correctCount;
  @override
  @JsonKey(name: 'due_in_days')
  final int dueInDays;

  @override
  String toString() {
    return 'ReviewItemDto(question: $question, topic: $topic, wrongCount: $wrongCount, correctCount: $correctCount, dueInDays: $dueInDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewItemDtoImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, question, topic, wrongCount, correctCount, dueInDays);

  /// Create a copy of ReviewItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewItemDtoImplCopyWith<_$ReviewItemDtoImpl> get copyWith =>
      __$$ReviewItemDtoImplCopyWithImpl<_$ReviewItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ReviewItemDto implements ReviewItemDto {
  const factory _ReviewItemDto(
          {required final String question,
          required final String topic,
          @JsonKey(name: 'wrong_count') required final int wrongCount,
          @JsonKey(name: 'correct_count') required final int correctCount,
          @JsonKey(name: 'due_in_days') required final int dueInDays}) =
      _$ReviewItemDtoImpl;

  factory _ReviewItemDto.fromJson(Map<String, dynamic> json) =
      _$ReviewItemDtoImpl.fromJson;

  @override
  String get question;
  @override
  String get topic;
  @override
  @JsonKey(name: 'wrong_count')
  int get wrongCount;
  @override
  @JsonKey(name: 'correct_count')
  int get correctCount;
  @override
  @JsonKey(name: 'due_in_days')
  int get dueInDays;

  /// Create a copy of ReviewItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewItemDtoImplCopyWith<_$ReviewItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
