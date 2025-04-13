// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserAuthenticatedEntity.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate => throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      @JsonKey(name: 'birth_date') DateTime? birthDate});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAuthenticatedEntityImplCopyWith<$Res>
    implements $UserDtoCopyWith<$Res> {
  factory _$$UserAuthenticatedEntityImplCopyWith(
          _$UserAuthenticatedEntityImpl value,
          $Res Function(_$UserAuthenticatedEntityImpl) then) =
      __$$UserAuthenticatedEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      @JsonKey(name: 'birth_date') DateTime? birthDate});
}

/// @nodoc
class __$$UserAuthenticatedEntityImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserAuthenticatedEntityImpl>
    implements _$$UserAuthenticatedEntityImplCopyWith<$Res> {
  __$$UserAuthenticatedEntityImplCopyWithImpl(
      _$UserAuthenticatedEntityImpl _value,
      $Res Function(_$UserAuthenticatedEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_$UserAuthenticatedEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAuthenticatedEntityImpl implements _UserAuthenticatedEntity {
  const _$UserAuthenticatedEntityImpl(
      {required this.id,
      required this.email,
      this.name,
      @JsonKey(name: 'birth_date') this.birthDate});

  factory _$UserAuthenticatedEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAuthenticatedEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  @override
  @JsonKey(name: 'birth_date')
  final DateTime? birthDate;

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, name: $name, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthenticatedEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, birthDate);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthenticatedEntityImplCopyWith<_$UserAuthenticatedEntityImpl>
      get copyWith => __$$UserAuthenticatedEntityImplCopyWithImpl<
          _$UserAuthenticatedEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAuthenticatedEntityImplToJson(
      this,
    );
  }
}

abstract class _UserAuthenticatedEntity implements UserDto {
  const factory _UserAuthenticatedEntity(
          {required final String id,
          required final String email,
          final String? name,
          @JsonKey(name: 'birth_date') final DateTime? birthDate}) =
      _$UserAuthenticatedEntityImpl;

  factory _UserAuthenticatedEntity.fromJson(Map<String, dynamic> json) =
      _$UserAuthenticatedEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get name;
  @override
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAuthenticatedEntityImplCopyWith<_$UserAuthenticatedEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
