// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnswerEntity {
  String get id => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerEntityCopyWith<AnswerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerEntityCopyWith<$Res> {
  factory $AnswerEntityCopyWith(
          AnswerEntity value, $Res Function(AnswerEntity) then) =
      _$AnswerEntityCopyWithImpl<$Res, AnswerEntity>;
  @useResult
  $Res call({String id, bool isCorrect, String text});
}

/// @nodoc
class _$AnswerEntityCopyWithImpl<$Res, $Val extends AnswerEntity>
    implements $AnswerEntityCopyWith<$Res> {
  _$AnswerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isCorrect = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerEntityImplCopyWith<$Res>
    implements $AnswerEntityCopyWith<$Res> {
  factory _$$AnswerEntityImplCopyWith(
          _$AnswerEntityImpl value, $Res Function(_$AnswerEntityImpl) then) =
      __$$AnswerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, bool isCorrect, String text});
}

/// @nodoc
class __$$AnswerEntityImplCopyWithImpl<$Res>
    extends _$AnswerEntityCopyWithImpl<$Res, _$AnswerEntityImpl>
    implements _$$AnswerEntityImplCopyWith<$Res> {
  __$$AnswerEntityImplCopyWithImpl(
      _$AnswerEntityImpl _value, $Res Function(_$AnswerEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isCorrect = null,
    Object? text = null,
  }) {
    return _then(_$AnswerEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnswerEntityImpl implements _AnswerEntity {
  const _$AnswerEntityImpl(
      {required this.id, required this.isCorrect, required this.text});

  @override
  final String id;
  @override
  final bool isCorrect;
  @override
  final String text;

  @override
  String toString() {
    return 'AnswerEntity(id: $id, isCorrect: $isCorrect, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isCorrect, text);

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerEntityImplCopyWith<_$AnswerEntityImpl> get copyWith =>
      __$$AnswerEntityImplCopyWithImpl<_$AnswerEntityImpl>(this, _$identity);
}

abstract class _AnswerEntity implements AnswerEntity {
  const factory _AnswerEntity(
      {required final String id,
      required final bool isCorrect,
      required final String text}) = _$AnswerEntityImpl;

  @override
  String get id;
  @override
  bool get isCorrect;
  @override
  String get text;

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerEntityImplCopyWith<_$AnswerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
