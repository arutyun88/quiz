import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/service/question_id_service.dart';
import 'package:quiz/features/question/domain/use_case/check_question_state_use_case.dart';
import 'package:quiz/features/question/domain/use_case/fetch_question_use_case.dart';
import 'package:quiz/features/question/domain/use_case/send_answer_use_case.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

part 'question_notifier.dart';
part 'question_state.dart';
part 'question_provider.freezed.dart';

final questionProvider = StateNotifierProvider<QuestionNotifier, QuestionState>(
  (ref) => QuestionNotifier(
    fetchQuestionUseCase: getIt<FetchQuestionUseCase>(),
    checkQuestionStateUseCase: getIt<CheckQuestionStateUseCase>(),
    sendAnswerUseCase: getIt<SendAnswerUseCase>(),
    questionIdService: getIt<QuestionIdService>(),
  ),
);
