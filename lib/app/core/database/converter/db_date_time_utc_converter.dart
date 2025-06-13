import 'package:drift/drift.dart';

class DBDateTimeUtcConverter extends TypeConverter<DateTime, DateTime> {
  const DBDateTimeUtcConverter();

  @override
  DateTime fromSql(DateTime fromDb) => fromDb.toUtc();

  @override
  DateTime toSql(DateTime value) => value.toUtc();
}
