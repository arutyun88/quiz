import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:quiz/app/core/database/converter/db_date_time_utc_converter.dart';
import 'package:quiz/app/core/database/dao/answered_question_dao.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/database/gen/schema_versions.dart';
import 'package:quiz/app/core/database/schema/answer.dart';
import 'package:quiz/app/core/database/schema/answered_question.dart';
import 'package:quiz/app/core/database/schema/question.dart';
import 'package:quiz/app/core/database/schema/topic.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Questions,
    Answers,
    Topics,
    AnsweredQuestions,
  ],
  daos: [
    QuestionDao,
    AnsweredQuestionDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        return stepByStep()(m, from, to);
      },
    );
  }

  void deleteDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'quiz.db'));
    await file.delete();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'quiz.db'));
    return NativeDatabase.createInBackground(file);
  });
}
