import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_dto.freezed.dart';
part 'token_dto.g.dart';

@freezed
class TokenDto with _$TokenDto {
  const factory TokenDto({
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _TokenDto;

  factory TokenDto.fromJson(Map<String, dynamic> json) => _$TokenDtoFromJson(json);
}
