part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizInit extends QuizState {}

class QuizRequested extends QuizState {}

class QuizSimpleReceived extends QuizState {
  final List<QuizItemModel> games;

  QuizSimpleReceived({
    required this.games,
  });

  @override
  List<Object?> get props => [games];
}

class QuizVideoReceived extends QuizState {
  final QuizVideoModel videoGame;

  QuizVideoReceived({
    required this.videoGame,
  });

  @override
  List<Object?> get props => [videoGame];
}

class QuizFailure extends QuizState {}
