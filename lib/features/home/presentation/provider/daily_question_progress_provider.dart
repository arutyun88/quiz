import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/question/domain/entity/answered_today_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

final dailyQuestionProgressProvider = FutureProvider.autoDispose<AnsweredTodayEntity>((ref) async {
  final result = await getIt<QuestionRepository>().checkAnsweredToday();

  return switch (result) {
    ResultOk(data: final progress) => progress,
    ResultFailed(error: final failure) => throw failure,
  };
});
