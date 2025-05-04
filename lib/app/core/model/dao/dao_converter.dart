import 'package:quiz/app/core/model/dao/dao.dart';

abstract base class DaoConverter<TEntity, TDao extends Dao> {
  const DaoConverter();

  TEntity toEntity(TDao dao);

  TDao toDao(TEntity entity);

  Iterable<TEntity> toEntityMultiple(Iterable<TDao> daoList) => daoList.map(toEntity);

  Iterable<TDao> toDaoMultiple(Iterable<TEntity> entityList) => entityList.map(toDao);
}
