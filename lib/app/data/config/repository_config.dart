import 'package:quiz/app/data/api/quiz/quiz_api.dart';
import 'package:quiz/app/data/api_util.dart';
import 'package:quiz/app/data/repository/quiz_data_repository.dart';
import 'package:quiz/app/domain/repository/quiz_repository.dart';

abstract class RepositoryConfig {
  static QuizRepository? _forecastGameRepository;

  static QuizRepository quizRepository() {
    _forecastGameRepository ??= QuizDataRepository(_ApiConfig.apiUtil());
    return _forecastGameRepository!;
  }
}

class _ApiConfig {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(
      quizApi: QuizApi(),
    );
    return _apiUtil!;
  }
}
