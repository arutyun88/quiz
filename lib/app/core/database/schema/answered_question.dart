import 'package:drift/drift.dart';
import 'package:quiz/app/core/database/converter/db_date_time_utc_converter.dart';

class AnsweredQuestions extends Table {
  TextColumn get questionId => text()();
  TextColumn get question => text()();
  TextColumn get answerId => text()();
  TextColumn get answer => text()();
  BoolColumn get isCorrect => boolean()();
  DateTimeColumn get answeredAt => dateTime().map(DBDateTimeUtcConverter())();

  @override
  Set<Column<Object>>? get primaryKey => {questionId};
}
