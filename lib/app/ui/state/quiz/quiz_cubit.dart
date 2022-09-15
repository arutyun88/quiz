import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/data/config/repository_config.dart';
import 'package:quiz/app/domain/model/quiz_item_model.dart';
import 'package:quiz/app/domain/model/quiz_video_model.dart';
import 'package:quiz/app/domain/repository/quiz_repository.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit()
      : _quizRepository = RepositoryConfig.quizRepository(),
        super(QuizInit());

  final QuizRepository _quizRepository;

  Future<void> getSimpleQuiz(int id) async {
    try {
      emit(QuizRequested());
      final List<QuizItemModel> games = await _quizRepository.getSimpleQuiz(id);
      emit(QuizSimpleReceived(games: games));
    } on Exception catch (_) {
      emit(QuizFailure());
    }
  }

  Future<void> getVideoQuiz(int id) async {
    try {
      emit(QuizRequested());
      final QuizVideoModel videoGame = await _quizRepository.getVideoQuiz(id);
      emit(QuizVideoReceived(videoGame: videoGame));
    } on Exception catch (_) {
      emit(QuizFailure());
    }
  }
}
