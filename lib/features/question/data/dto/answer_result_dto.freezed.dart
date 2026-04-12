// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerResultDto _$AnswerResultDtoFromJson(Map<String, dynamic> json) {
  return _AnswerResultDto.fromJson(json);
}

/// @nodoc
mixin _$AnswerResultDto {
  @JsonKey(name: 'answer_id')
  String get userAnswerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer_id')
  String get correctAnswerId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this AnswerResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerResultDtoCopyWith<AnswerResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerResultDtoCopyWith<$Res> {
  factory $AnswerResultDtoCopyWith(
          AnswerResultDto value, $Res Function(AnswerResultDto) then) =
      _$AnswerResultDtoCopyWithImpl<$Res, AnswerResultDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'answer_id') String userAnswerId,
      @JsonKey(name: 'correct_answer_id') String correctAnswerId,
      String description,
      @JsonKey(name: 'is_correct') bool isCorrect});
}

/// @nodoc
class _$AnswerResultDtoCopyWithImpl<$Res, $Val extends AnswerResultDto>
    implements $AnswerResultDtoCopyWith<$Res> {
  _$AnswerResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAnswerId = null,
    Object? correctAnswerId = null,
    Object? description = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      userAnswerId: null == userAnswerId
          ? _value.userAnswerId
          : userAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerId: null == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerResultDtoImplCopyWith<$Res>
    implements $AnswerResultDtoCopyWith<$Res> {
  factory _$$AnswerResultDtoImplCopyWith(_$AnswerResultDtoImpl value,
          $Res Function(_$AnswerResultDtoImpl) then) =
      __$$AnswerResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'answer_id') String userAnswerId,
      @JsonKey(name: 'correct_answer_id') String correctAnswerId,
      String description,
      @JsonKey(name: 'is_correct') bool isCorrect});
}

/// @nodoc
class __$$AnswerResultDtoImplCopyWithImpl<$Res>
    extends _$AnswerResultDtoCopyWithImpl<$Res, _$AnswerResultDtoImpl>
    implements _$$AnswerResultDtoImplCopyWith<$Res> {
  __$$AnswerResultDtoImplCopyWithImpl(
      _$AnswerResultDtoImpl _value, $Res Function(_$AnswerResultDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAnswerId = null,
    Object? correctAnswerId = null,
    Object? description = null,
    Object? isCorrect = null,
  }) {
    return _then(_$AnswerResultDtoImpl(
      userAnswerId: null == userAnswerId
          ? _value.userAnswerId
          : userAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerId: null == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerResultDtoImpl implements _AnswerResultDto {
  const _$AnswerResultDtoImpl(
      {@JsonKey(name: 'answer_id') required this.userAnswerId,
      @JsonKey(name: 'correct_answer_id') required this.correctAnswerId,
      required this.description,
      @JsonKey(name: 'is_correct') required this.isCorrect});

  factory _$AnswerResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerResultDtoImplFromJson(json);

  @override
  @JsonKey(name: 'answer_id')
  final String userAnswerId;
  @override
  @JsonKey(name: 'correct_answer_id')
  final String correctAnswerId;
  @override
  final String description;
  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;

  @override
  String toString() {
    return 'AnswerResultDto(userAnswerId: $userAnswerId, correctAnswerId: $correctAnswerId, description: $description, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerResultDtoImpl &&
            (identical(other.userAnswerId, userAnswerId) ||
                other.userAnswerId == userAnswerId) &&
            (identical(other.correctAnswerId, correctAnswerId) ||
                other.correctAnswerId == correctAnswerId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userAnswerId, correctAnswerId, description, isCorrect);

  /// Create a copy of AnswerResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerResultDtoImplCopyWith<_$AnswerResultDtoImpl> get copyWith =>
      __$$AnswerResultDtoImplCopyWithImpl<_$AnswerResultDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerResultDtoImplToJson(
      this,
    );
  }
}

abstract class _AnswerResultDto implements AnswerResultDto {
  const factory _AnswerResultDto(
      {@JsonKey(name: 'answer_id') required final String userAnswerId,
      @JsonKey(name: 'correct_answer_id') required final String correctAnswerId,
      required final String description,
      @JsonKey(name: 'is_correct')
      required final bool isCorrect}) = _$AnswerResultDtoImpl;

  factory _AnswerResultDto.fromJson(Map<String, dynamic> json) =
      _$AnswerResultDtoImpl.fromJson;

  @override
  @JsonKey(name: 'answer_id')
  String get userAnswerId;
  @override
  @JsonKey(name: 'correct_answer_id')
  String get correctAnswerId;
  @override
  String get description;
  @override
  @JsonKey(name: 'is_correct')
  bool get isCorrect;

  /// Create a copy of AnswerResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerResultDtoImplCopyWith<_$AnswerResultDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
