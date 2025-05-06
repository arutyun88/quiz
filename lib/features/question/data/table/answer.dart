import 'package:drift/drift.dart';
import 'package:quiz/features/question/data/table/question.dart';

class Answers extends Table {
  TextColumn get id => text()();
  TextColumn get answer => text()();
  BoolColumn get isCorrect => boolean()();
  TextColumn get questionId => text().references(Questions, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
