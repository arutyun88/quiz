typedef DtoConversionDelegate<TEntity, TDto> = TEntity Function(TDto dto);

abstract base class DtoConverter<TEntity, TDto> {
  const DtoConverter();

  TEntity convert(TDto dto);

  TDto revert(TEntity entity) => throw UnimplementedError();

  Iterable<TEntity> convertMultiple(Iterable<TDto> dtoList) => dtoList.map(convert);
}
