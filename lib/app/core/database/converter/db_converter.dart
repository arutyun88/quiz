abstract base class DbConverter<TEntity, TDao> {
  const DbConverter();

  TEntity toEntity(TDao dao);

  TDao toDao(TEntity entity);

  Iterable<TEntity> toEntityMultiple(Iterable<TDao> daoList) => daoList.map(toEntity);

  Iterable<TDao> toDaoMultiple(Iterable<TEntity> entityList) => entityList.map(toDao);
}
