import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/authentication/data/dto/token_dto.dart';
import 'package:quiz/features/authentication/domain/entity/token_entity.dart';

typedef TokenConverter = DtoConverter<TokenEntity, DataDto<TokenDto>>;

@Injectable(as: TokenConverter)
final class TokenConverterImpl extends TokenConverter {
  @override
  TokenEntity convert(DataDto<TokenDto> dto) {
    return TokenEntity(
      accessToken: dto.data.accessToken,
      refreshToken: dto.data.refreshToken,
    );
  }
}
