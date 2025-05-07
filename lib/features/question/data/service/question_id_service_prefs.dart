import 'package:injectable/injectable.dart';
import 'package:quiz/features/question/domain/service/question_id_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: QuestionIdService)
class QuestionIdServicePrefs implements QuestionIdService {
  final SharedPreferences _prefs;

  static const String _questionIdKey = 'current_question_id';

  String? _cachedQuestionId;

  QuestionIdServicePrefs({
    required SharedPreferences prefs,
  }) : _prefs = prefs {
    _load();
  }

  @override
  String? get questionId => _cachedQuestionId;

  void _load() {
    final result = _prefs.getString(_questionIdKey);
    if (result case String id) {
      _cachedQuestionId = id;
    }
  }

  @override
  Future<void> save(String id) async {
    await _prefs.setString(_questionIdKey, id);
    _cachedQuestionId = id;
  }

  @override
  Future<void> clean() async {
    await _prefs.remove(_questionIdKey);
    _cachedQuestionId = null;
  }
}
