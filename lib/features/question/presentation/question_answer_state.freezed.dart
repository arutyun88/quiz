// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_answer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuestionAnswerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wait,
    required TResult Function(AnswerEntity answer, AnswerTimerState timerState)
        selected,
    required TResult Function(AnswerEntity answer) sending,
    required TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)
        sent,
    required TResult Function(AnswerEntity answer, Failure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wait,
    TResult? Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult? Function(AnswerEntity answer)? sending,
    TResult? Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult? Function(AnswerEntity answer, Failure failure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wait,
    TResult Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult Function(AnswerEntity answer)? sending,
    TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult Function(AnswerEntity answer, Failure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionAnswerWaitingState value) wait,
    required TResult Function(QuestionAnswerSelectedState value) selected,
    required TResult Function(QuestionAnswerSendingState value) sending,
    required TResult Function(QuestionAnswerSentState value) sent,
    required TResult Function(QuestionAnswerFailedState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionAnswerWaitingState value)? wait,
    TResult? Function(QuestionAnswerSelectedState value)? selected,
    TResult? Function(QuestionAnswerSendingState value)? sending,
    TResult? Function(QuestionAnswerSentState value)? sent,
    TResult? Function(QuestionAnswerFailedState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionAnswerWaitingState value)? wait,
    TResult Function(QuestionAnswerSelectedState value)? selected,
    TResult Function(QuestionAnswerSendingState value)? sending,
    TResult Function(QuestionAnswerSentState value)? sent,
    TResult Function(QuestionAnswerFailedState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionAnswerStateCopyWith<$Res> {
  factory $QuestionAnswerStateCopyWith(
          QuestionAnswerState value, $Res Function(QuestionAnswerState) then) =
      _$QuestionAnswerStateCopyWithImpl<$Res, QuestionAnswerState>;
}

/// @nodoc
class _$QuestionAnswerStateCopyWithImpl<$Res, $Val extends QuestionAnswerState>
    implements $QuestionAnswerStateCopyWith<$Res> {
  _$QuestionAnswerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QuestionAnswerWaitingStateImplCopyWith<$Res> {
  factory _$$QuestionAnswerWaitingStateImplCopyWith(
          _$QuestionAnswerWaitingStateImpl value,
          $Res Function(_$QuestionAnswerWaitingStateImpl) then) =
      __$$QuestionAnswerWaitingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionAnswerWaitingStateImplCopyWithImpl<$Res>
    extends _$QuestionAnswerStateCopyWithImpl<$Res,
        _$QuestionAnswerWaitingStateImpl>
    implements _$$QuestionAnswerWaitingStateImplCopyWith<$Res> {
  __$$QuestionAnswerWaitingStateImplCopyWithImpl(
      _$QuestionAnswerWaitingStateImpl _value,
      $Res Function(_$QuestionAnswerWaitingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$QuestionAnswerWaitingStateImpl extends QuestionAnswerWaitingState {
  const _$QuestionAnswerWaitingStateImpl() : super._();

  @override
  String toString() {
    return 'QuestionAnswerState.wait()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAnswerWaitingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wait,
    required TResult Function(AnswerEntity answer, AnswerTimerState timerState)
        selected,
    required TResult Function(AnswerEntity answer) sending,
    required TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)
        sent,
    required TResult Function(AnswerEntity answer, Failure failure) failed,
  }) {
    return wait();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wait,
    TResult? Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult? Function(AnswerEntity answer)? sending,
    TResult? Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult? Function(AnswerEntity answer, Failure failure)? failed,
  }) {
    return wait?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wait,
    TResult Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult Function(AnswerEntity answer)? sending,
    TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult Function(AnswerEntity answer, Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (wait != null) {
      return wait();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionAnswerWaitingState value) wait,
    required TResult Function(QuestionAnswerSelectedState value) selected,
    required TResult Function(QuestionAnswerSendingState value) sending,
    required TResult Function(QuestionAnswerSentState value) sent,
    required TResult Function(QuestionAnswerFailedState value) failed,
  }) {
    return wait(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionAnswerWaitingState value)? wait,
    TResult? Function(QuestionAnswerSelectedState value)? selected,
    TResult? Function(QuestionAnswerSendingState value)? sending,
    TResult? Function(QuestionAnswerSentState value)? sent,
    TResult? Function(QuestionAnswerFailedState value)? failed,
  }) {
    return wait?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionAnswerWaitingState value)? wait,
    TResult Function(QuestionAnswerSelectedState value)? selected,
    TResult Function(QuestionAnswerSendingState value)? sending,
    TResult Function(QuestionAnswerSentState value)? sent,
    TResult Function(QuestionAnswerFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (wait != null) {
      return wait(this);
    }
    return orElse();
  }
}

abstract class QuestionAnswerWaitingState extends QuestionAnswerState {
  const factory QuestionAnswerWaitingState() = _$QuestionAnswerWaitingStateImpl;
  const QuestionAnswerWaitingState._() : super._();
}

/// @nodoc
abstract class _$$QuestionAnswerSelectedStateImplCopyWith<$Res> {
  factory _$$QuestionAnswerSelectedStateImplCopyWith(
          _$QuestionAnswerSelectedStateImpl value,
          $Res Function(_$QuestionAnswerSelectedStateImpl) then) =
      __$$QuestionAnswerSelectedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnswerEntity answer, AnswerTimerState timerState});

  $AnswerEntityCopyWith<$Res> get answer;
  $AnswerTimerStateCopyWith<$Res> get timerState;
}

/// @nodoc
class __$$QuestionAnswerSelectedStateImplCopyWithImpl<$Res>
    extends _$QuestionAnswerStateCopyWithImpl<$Res,
        _$QuestionAnswerSelectedStateImpl>
    implements _$$QuestionAnswerSelectedStateImplCopyWith<$Res> {
  __$$QuestionAnswerSelectedStateImplCopyWithImpl(
      _$QuestionAnswerSelectedStateImpl _value,
      $Res Function(_$QuestionAnswerSelectedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? timerState = null,
  }) {
    return _then(_$QuestionAnswerSelectedStateImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerEntity,
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as AnswerTimerState,
    ));
  }

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerEntityCopyWith<$Res> get answer {
    return $AnswerEntityCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerTimerStateCopyWith<$Res> get timerState {
    return $AnswerTimerStateCopyWith<$Res>(_value.timerState, (value) {
      return _then(_value.copyWith(timerState: value));
    });
  }
}

/// @nodoc

class _$QuestionAnswerSelectedStateImpl extends QuestionAnswerSelectedState {
  const _$QuestionAnswerSelectedStateImpl(
      {required this.answer, required this.timerState})
      : super._();

  @override
  final AnswerEntity answer;
  @override
  final AnswerTimerState timerState;

  @override
  String toString() {
    return 'QuestionAnswerState.selected(answer: $answer, timerState: $timerState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAnswerSelectedStateImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.timerState, timerState) ||
                other.timerState == timerState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answer, timerState);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAnswerSelectedStateImplCopyWith<_$QuestionAnswerSelectedStateImpl>
      get copyWith => __$$QuestionAnswerSelectedStateImplCopyWithImpl<
          _$QuestionAnswerSelectedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wait,
    required TResult Function(AnswerEntity answer, AnswerTimerState timerState)
        selected,
    required TResult Function(AnswerEntity answer) sending,
    required TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)
        sent,
    required TResult Function(AnswerEntity answer, Failure failure) failed,
  }) {
    return selected(answer, timerState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wait,
    TResult? Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult? Function(AnswerEntity answer)? sending,
    TResult? Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult? Function(AnswerEntity answer, Failure failure)? failed,
  }) {
    return selected?.call(answer, timerState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wait,
    TResult Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult Function(AnswerEntity answer)? sending,
    TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult Function(AnswerEntity answer, Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(answer, timerState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionAnswerWaitingState value) wait,
    required TResult Function(QuestionAnswerSelectedState value) selected,
    required TResult Function(QuestionAnswerSendingState value) sending,
    required TResult Function(QuestionAnswerSentState value) sent,
    required TResult Function(QuestionAnswerFailedState value) failed,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionAnswerWaitingState value)? wait,
    TResult? Function(QuestionAnswerSelectedState value)? selected,
    TResult? Function(QuestionAnswerSendingState value)? sending,
    TResult? Function(QuestionAnswerSentState value)? sent,
    TResult? Function(QuestionAnswerFailedState value)? failed,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionAnswerWaitingState value)? wait,
    TResult Function(QuestionAnswerSelectedState value)? selected,
    TResult Function(QuestionAnswerSendingState value)? sending,
    TResult Function(QuestionAnswerSentState value)? sent,
    TResult Function(QuestionAnswerFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class QuestionAnswerSelectedState extends QuestionAnswerState {
  const factory QuestionAnswerSelectedState(
          {required final AnswerEntity answer,
          required final AnswerTimerState timerState}) =
      _$QuestionAnswerSelectedStateImpl;
  const QuestionAnswerSelectedState._() : super._();

  AnswerEntity get answer;
  AnswerTimerState get timerState;

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionAnswerSelectedStateImplCopyWith<_$QuestionAnswerSelectedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionAnswerSendingStateImplCopyWith<$Res> {
  factory _$$QuestionAnswerSendingStateImplCopyWith(
          _$QuestionAnswerSendingStateImpl value,
          $Res Function(_$QuestionAnswerSendingStateImpl) then) =
      __$$QuestionAnswerSendingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnswerEntity answer});

  $AnswerEntityCopyWith<$Res> get answer;
}

/// @nodoc
class __$$QuestionAnswerSendingStateImplCopyWithImpl<$Res>
    extends _$QuestionAnswerStateCopyWithImpl<$Res,
        _$QuestionAnswerSendingStateImpl>
    implements _$$QuestionAnswerSendingStateImplCopyWith<$Res> {
  __$$QuestionAnswerSendingStateImplCopyWithImpl(
      _$QuestionAnswerSendingStateImpl _value,
      $Res Function(_$QuestionAnswerSendingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
  }) {
    return _then(_$QuestionAnswerSendingStateImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerEntity,
    ));
  }

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerEntityCopyWith<$Res> get answer {
    return $AnswerEntityCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }
}

/// @nodoc

class _$QuestionAnswerSendingStateImpl extends QuestionAnswerSendingState {
  const _$QuestionAnswerSendingStateImpl({required this.answer}) : super._();

  @override
  final AnswerEntity answer;

  @override
  String toString() {
    return 'QuestionAnswerState.sending(answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAnswerSendingStateImpl &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answer);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAnswerSendingStateImplCopyWith<_$QuestionAnswerSendingStateImpl>
      get copyWith => __$$QuestionAnswerSendingStateImplCopyWithImpl<
          _$QuestionAnswerSendingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wait,
    required TResult Function(AnswerEntity answer, AnswerTimerState timerState)
        selected,
    required TResult Function(AnswerEntity answer) sending,
    required TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)
        sent,
    required TResult Function(AnswerEntity answer, Failure failure) failed,
  }) {
    return sending(answer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wait,
    TResult? Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult? Function(AnswerEntity answer)? sending,
    TResult? Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult? Function(AnswerEntity answer, Failure failure)? failed,
  }) {
    return sending?.call(answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wait,
    TResult Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult Function(AnswerEntity answer)? sending,
    TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult Function(AnswerEntity answer, Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionAnswerWaitingState value) wait,
    required TResult Function(QuestionAnswerSelectedState value) selected,
    required TResult Function(QuestionAnswerSendingState value) sending,
    required TResult Function(QuestionAnswerSentState value) sent,
    required TResult Function(QuestionAnswerFailedState value) failed,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionAnswerWaitingState value)? wait,
    TResult? Function(QuestionAnswerSelectedState value)? selected,
    TResult? Function(QuestionAnswerSendingState value)? sending,
    TResult? Function(QuestionAnswerSentState value)? sent,
    TResult? Function(QuestionAnswerFailedState value)? failed,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionAnswerWaitingState value)? wait,
    TResult Function(QuestionAnswerSelectedState value)? selected,
    TResult Function(QuestionAnswerSendingState value)? sending,
    TResult Function(QuestionAnswerSentState value)? sent,
    TResult Function(QuestionAnswerFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class QuestionAnswerSendingState extends QuestionAnswerState {
  const factory QuestionAnswerSendingState(
      {required final AnswerEntity answer}) = _$QuestionAnswerSendingStateImpl;
  const QuestionAnswerSendingState._() : super._();

  AnswerEntity get answer;

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionAnswerSendingStateImplCopyWith<_$QuestionAnswerSendingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionAnswerSentStateImplCopyWith<$Res> {
  factory _$$QuestionAnswerSentStateImplCopyWith(
          _$QuestionAnswerSentStateImpl value,
          $Res Function(_$QuestionAnswerSentStateImpl) then) =
      __$$QuestionAnswerSentStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AnswerEntity answer,
      String? correctAnswerId,
      String? description,
      int xp,
      int streakDelta});

  $AnswerEntityCopyWith<$Res> get answer;
}

/// @nodoc
class __$$QuestionAnswerSentStateImplCopyWithImpl<$Res>
    extends _$QuestionAnswerStateCopyWithImpl<$Res,
        _$QuestionAnswerSentStateImpl>
    implements _$$QuestionAnswerSentStateImplCopyWith<$Res> {
  __$$QuestionAnswerSentStateImplCopyWithImpl(
      _$QuestionAnswerSentStateImpl _value,
      $Res Function(_$QuestionAnswerSentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? correctAnswerId = freezed,
    Object? description = freezed,
    Object? xp = null,
    Object? streakDelta = null,
  }) {
    return _then(_$QuestionAnswerSentStateImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerEntity,
      correctAnswerId: freezed == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      streakDelta: null == streakDelta
          ? _value.streakDelta
          : streakDelta // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerEntityCopyWith<$Res> get answer {
    return $AnswerEntityCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }
}

/// @nodoc

class _$QuestionAnswerSentStateImpl extends QuestionAnswerSentState {
  const _$QuestionAnswerSentStateImpl(
      {required this.answer,
      this.correctAnswerId,
      this.description,
      this.xp = 0,
      this.streakDelta = 0})
      : super._();

  @override
  final AnswerEntity answer;
  @override
  final String? correctAnswerId;
  @override
  final String? description;
  @override
  @JsonKey()
  final int xp;
  @override
  @JsonKey()
  final int streakDelta;

  @override
  String toString() {
    return 'QuestionAnswerState.sent(answer: $answer, correctAnswerId: $correctAnswerId, description: $description, xp: $xp, streakDelta: $streakDelta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAnswerSentStateImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.correctAnswerId, correctAnswerId) ||
                other.correctAnswerId == correctAnswerId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.streakDelta, streakDelta) ||
                other.streakDelta == streakDelta));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, answer, correctAnswerId, description, xp, streakDelta);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAnswerSentStateImplCopyWith<_$QuestionAnswerSentStateImpl>
      get copyWith => __$$QuestionAnswerSentStateImplCopyWithImpl<
          _$QuestionAnswerSentStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wait,
    required TResult Function(AnswerEntity answer, AnswerTimerState timerState)
        selected,
    required TResult Function(AnswerEntity answer) sending,
    required TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)
        sent,
    required TResult Function(AnswerEntity answer, Failure failure) failed,
  }) {
    return sent(answer, correctAnswerId, description, xp, streakDelta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wait,
    TResult? Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult? Function(AnswerEntity answer)? sending,
    TResult? Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult? Function(AnswerEntity answer, Failure failure)? failed,
  }) {
    return sent?.call(answer, correctAnswerId, description, xp, streakDelta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wait,
    TResult Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult Function(AnswerEntity answer)? sending,
    TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult Function(AnswerEntity answer, Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(answer, correctAnswerId, description, xp, streakDelta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionAnswerWaitingState value) wait,
    required TResult Function(QuestionAnswerSelectedState value) selected,
    required TResult Function(QuestionAnswerSendingState value) sending,
    required TResult Function(QuestionAnswerSentState value) sent,
    required TResult Function(QuestionAnswerFailedState value) failed,
  }) {
    return sent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionAnswerWaitingState value)? wait,
    TResult? Function(QuestionAnswerSelectedState value)? selected,
    TResult? Function(QuestionAnswerSendingState value)? sending,
    TResult? Function(QuestionAnswerSentState value)? sent,
    TResult? Function(QuestionAnswerFailedState value)? failed,
  }) {
    return sent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionAnswerWaitingState value)? wait,
    TResult Function(QuestionAnswerSelectedState value)? selected,
    TResult Function(QuestionAnswerSendingState value)? sending,
    TResult Function(QuestionAnswerSentState value)? sent,
    TResult Function(QuestionAnswerFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(this);
    }
    return orElse();
  }
}

abstract class QuestionAnswerSentState extends QuestionAnswerState {
  const factory QuestionAnswerSentState(
      {required final AnswerEntity answer,
      final String? correctAnswerId,
      final String? description,
      final int xp,
      final int streakDelta}) = _$QuestionAnswerSentStateImpl;
  const QuestionAnswerSentState._() : super._();

  AnswerEntity get answer;
  String? get correctAnswerId;
  String? get description;
  int get xp;
  int get streakDelta;

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionAnswerSentStateImplCopyWith<_$QuestionAnswerSentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionAnswerFailedStateImplCopyWith<$Res> {
  factory _$$QuestionAnswerFailedStateImplCopyWith(
          _$QuestionAnswerFailedStateImpl value,
          $Res Function(_$QuestionAnswerFailedStateImpl) then) =
      __$$QuestionAnswerFailedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnswerEntity answer, Failure failure});

  $AnswerEntityCopyWith<$Res> get answer;
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$QuestionAnswerFailedStateImplCopyWithImpl<$Res>
    extends _$QuestionAnswerStateCopyWithImpl<$Res,
        _$QuestionAnswerFailedStateImpl>
    implements _$$QuestionAnswerFailedStateImplCopyWith<$Res> {
  __$$QuestionAnswerFailedStateImplCopyWithImpl(
      _$QuestionAnswerFailedStateImpl _value,
      $Res Function(_$QuestionAnswerFailedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? failure = null,
  }) {
    return _then(_$QuestionAnswerFailedStateImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerEntity,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerEntityCopyWith<$Res> get answer {
    return $AnswerEntityCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value));
    });
  }

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$QuestionAnswerFailedStateImpl extends QuestionAnswerFailedState {
  const _$QuestionAnswerFailedStateImpl(
      {required this.answer, required this.failure})
      : super._();

  @override
  final AnswerEntity answer;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'QuestionAnswerState.failed(answer: $answer, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAnswerFailedStateImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answer, failure);

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAnswerFailedStateImplCopyWith<_$QuestionAnswerFailedStateImpl>
      get copyWith => __$$QuestionAnswerFailedStateImplCopyWithImpl<
          _$QuestionAnswerFailedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wait,
    required TResult Function(AnswerEntity answer, AnswerTimerState timerState)
        selected,
    required TResult Function(AnswerEntity answer) sending,
    required TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)
        sent,
    required TResult Function(AnswerEntity answer, Failure failure) failed,
  }) {
    return failed(answer, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wait,
    TResult? Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult? Function(AnswerEntity answer)? sending,
    TResult? Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult? Function(AnswerEntity answer, Failure failure)? failed,
  }) {
    return failed?.call(answer, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wait,
    TResult Function(AnswerEntity answer, AnswerTimerState timerState)?
        selected,
    TResult Function(AnswerEntity answer)? sending,
    TResult Function(AnswerEntity answer, String? correctAnswerId,
            String? description, int xp, int streakDelta)?
        sent,
    TResult Function(AnswerEntity answer, Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(answer, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionAnswerWaitingState value) wait,
    required TResult Function(QuestionAnswerSelectedState value) selected,
    required TResult Function(QuestionAnswerSendingState value) sending,
    required TResult Function(QuestionAnswerSentState value) sent,
    required TResult Function(QuestionAnswerFailedState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionAnswerWaitingState value)? wait,
    TResult? Function(QuestionAnswerSelectedState value)? selected,
    TResult? Function(QuestionAnswerSendingState value)? sending,
    TResult? Function(QuestionAnswerSentState value)? sent,
    TResult? Function(QuestionAnswerFailedState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionAnswerWaitingState value)? wait,
    TResult Function(QuestionAnswerSelectedState value)? selected,
    TResult Function(QuestionAnswerSendingState value)? sending,
    TResult Function(QuestionAnswerSentState value)? sent,
    TResult Function(QuestionAnswerFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class QuestionAnswerFailedState extends QuestionAnswerState {
  const factory QuestionAnswerFailedState(
      {required final AnswerEntity answer,
      required final Failure failure}) = _$QuestionAnswerFailedStateImpl;
  const QuestionAnswerFailedState._() : super._();

  AnswerEntity get answer;
  Failure get failure;

  /// Create a copy of QuestionAnswerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionAnswerFailedStateImplCopyWith<_$QuestionAnswerFailedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnswerTimerState {
  Duration get duration => throw _privateConstructorUsedError;
  Duration get remaining => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Create a copy of AnswerTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerTimerStateCopyWith<AnswerTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerTimerStateCopyWith<$Res> {
  factory $AnswerTimerStateCopyWith(
          AnswerTimerState value, $Res Function(AnswerTimerState) then) =
      _$AnswerTimerStateCopyWithImpl<$Res, AnswerTimerState>;
  @useResult
  $Res call({Duration duration, Duration remaining, bool isActive});
}

/// @nodoc
class _$AnswerTimerStateCopyWithImpl<$Res, $Val extends AnswerTimerState>
    implements $AnswerTimerStateCopyWith<$Res> {
  _$AnswerTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? remaining = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as Duration,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerTimerStateImplCopyWith<$Res>
    implements $AnswerTimerStateCopyWith<$Res> {
  factory _$$AnswerTimerStateImplCopyWith(_$AnswerTimerStateImpl value,
          $Res Function(_$AnswerTimerStateImpl) then) =
      __$$AnswerTimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration duration, Duration remaining, bool isActive});
}

/// @nodoc
class __$$AnswerTimerStateImplCopyWithImpl<$Res>
    extends _$AnswerTimerStateCopyWithImpl<$Res, _$AnswerTimerStateImpl>
    implements _$$AnswerTimerStateImplCopyWith<$Res> {
  __$$AnswerTimerStateImplCopyWithImpl(_$AnswerTimerStateImpl _value,
      $Res Function(_$AnswerTimerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? remaining = null,
    Object? isActive = null,
  }) {
    return _then(_$AnswerTimerStateImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as Duration,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnswerTimerStateImpl extends _AnswerTimerState {
  const _$AnswerTimerStateImpl(
      {required this.duration, required this.remaining, this.isActive = false})
      : super._();

  @override
  final Duration duration;
  @override
  final Duration remaining;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'AnswerTimerState(duration: $duration, remaining: $remaining, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerTimerStateImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, remaining, isActive);

  /// Create a copy of AnswerTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerTimerStateImplCopyWith<_$AnswerTimerStateImpl> get copyWith =>
      __$$AnswerTimerStateImplCopyWithImpl<_$AnswerTimerStateImpl>(
          this, _$identity);
}

abstract class _AnswerTimerState extends AnswerTimerState {
  const factory _AnswerTimerState(
      {required final Duration duration,
      required final Duration remaining,
      final bool isActive}) = _$AnswerTimerStateImpl;
  const _AnswerTimerState._() : super._();

  @override
  Duration get duration;
  @override
  Duration get remaining;
  @override
  bool get isActive;

  /// Create a copy of AnswerTimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerTimerStateImplCopyWith<_$AnswerTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
