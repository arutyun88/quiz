import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/features/question/data/service/question_id_service_prefs.dart';
import 'package:quiz/features/question/domain/service/question_id_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late _MockSharedPreferences prefs;
  late QuestionIdService service;

  setUp(() {
    prefs = _MockSharedPreferences();
  });

  group('QuestionIdServicePrefs', () {
    test('implements QuestionIdService and loads id from prefs', () {
      when(() => prefs.getString('current_question_id')).thenReturn(null);

      service = QuestionIdServicePrefs(prefs: prefs);

      expect(service, isA<QuestionIdService>());
      verify(() => prefs.getString('current_question_id')).called(1);
    });

    test('questionId is null when prefs have no stored id', () {
      when(() => prefs.getString('current_question_id')).thenReturn(null);

      service = QuestionIdServicePrefs(prefs: prefs);

      expect(service.questionId, isNull);
    });

    test('questionId loads stored id from prefs on construction', () {
      when(() => prefs.getString('current_question_id')).thenReturn('q-1');

      service = QuestionIdServicePrefs(prefs: prefs);

      expect(service.questionId, 'q-1');
    });

    test('save persists id and updates questionId', () async {
      when(() => prefs.getString('current_question_id')).thenReturn(null);
      when(() => prefs.setString('current_question_id', any())).thenAnswer((_) async => true);

      service = QuestionIdServicePrefs(prefs: prefs);
      await service.save('q-new');

      expect(service.questionId, 'q-new');
      verify(() => prefs.setString('current_question_id', 'q-new')).called(1);
    });

    test('clean removes key and clears questionId', () async {
      when(() => prefs.getString('current_question_id')).thenReturn('q-old');
      when(() => prefs.remove('current_question_id')).thenAnswer((_) async => true);

      service = QuestionIdServicePrefs(prefs: prefs);
      await service.clean();

      expect(service.questionId, isNull);
      verify(() => prefs.remove('current_question_id')).called(1);
    });
  });
}
