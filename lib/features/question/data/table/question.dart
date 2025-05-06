import 'package:drift/drift.dart';
import 'package:quiz/features/question/data/table/topic.dart';

class Questions extends Table {
  TextColumn get id => text()();
  TextColumn get question => text()();
  TextColumn get description => text()();
  TextColumn get hint => text()();
  TextColumn get topicId => text().references(Topics, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
