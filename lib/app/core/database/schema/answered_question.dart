import 'package:drift/drift.dart';

class AnsweredQuestions extends Table {
  TextColumn get questionId => text()();
  TextColumn get question => text()();
  TextColumn get answerId => text()();
  TextColumn get answer => text()();
  BoolColumn get isCorrect => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {questionId};
}
