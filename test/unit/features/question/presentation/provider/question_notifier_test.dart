import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';
import 'package:quiz/features/question/domain/service/question_id_service.dart';
import 'package:quiz/features/question/domain/use_case/check_question_state_use_case.dart';
import 'package:quiz/features/question/domain/use_case/fetch_question_use_case.dart';
import 'package:quiz/features/question/domain/use_case/send_answer_use_case.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';

class MockFetchQuestionUseCase extends Mock implements FetchQuestionUseCase {}

class MockCheckQuestionStateUseCase extends Mock implements CheckQuestionStateUseCase {}

class MockSendAnswerUseCase extends Mock implements SendAnswerUseCase {}

class MockQuestionIdService extends Mock implements QuestionIdService {}

const _question = QuestionEntity(
  id: 'q1',
  question: '2+2?',
  topic: TopicEntity(id: 't1', name: 'Math', description: ''),
  hint: '',
  answers: [
    AnswerEntity(id: 'a1', text: '3'),
    AnswerEntity(id: 'a2', text: '4'),
  ],
);

void main() {
  late FetchQuestionUseCase fetchQuestionUseCase;
  late CheckQuestionStateUseCase checkQuestionStateUseCase;
  late SendAnswerUseCase sendAnswerUseCase;
  late QuestionIdService questionIdService;
  late QuestionNotifier notifier;

  setUp(() {
    fetchQuestionUseCase = MockFetchQuestionUseCase();
    checkQuestionStateUseCase = MockCheckQuestionStateUseCase();
    sendAnswerUseCase = MockSendAnswerUseCase();
    questionIdService = MockQuestionIdService();
    notifier = QuestionNotifier(
      fetchQuestionUseCase: fetchQuestionUseCase,
      checkQuestionStateUseCase: checkQuestionStateUseCase,
      sendAnswerUseCase: sendAnswerUseCase,
      questionIdService: questionIdService,
    );
  });

  group('QuestionNotifier', () {
    test('waits for current question id to be saved when fetching a new question', () async {
      final saveCompleter = Completer<void>();

      when(() => questionIdService.questionId).thenReturn(null);
      when(() => fetchQuestionUseCase.fetch()).thenAnswer((_) async => Result.ok(_question));
      when(() => questionIdService.save(_question.id)).thenAnswer((_) => saveCompleter.future);

      var completed = false;
      final fetchFuture = notifier.fetch().then((_) {
        completed = true;
      });

      await untilCalled(() => questionIdService.save(_question.id));
      expect(notifier.state, isA<QuestionDataState>());

      await Future<void>.delayed(Duration.zero);
      expect(completed, isFalse);

      saveCompleter.complete();
      await fetchFuture;

      expect(completed, isTrue);
      verify(() => questionIdService.save(_question.id)).called(1);
    });

    test('keeps saved id when state check fails but cached question exists', () async {
      when(() => questionIdService.questionId).thenReturn(_question.id);
      when(() => checkQuestionStateUseCase.checkById(_question.id)).thenAnswer(
        (_) async => Result<QuestionStateEntity, Failure>.failed(
          const Failure.network(NetworkFailureReason.timeout('timeout')),
        ),
      );
      when(() => fetchQuestionUseCase.fetchById(_question.id)).thenAnswer((_) async => Result.ok(_question));

      await notifier.fetch();

      final state = notifier.state;
      expect(state, isA<QuestionDataState>());
      expect((state as QuestionDataState).question, _question);
      verify(() => checkQuestionStateUseCase.checkById(_question.id)).called(1);
      verify(() => fetchQuestionUseCase.fetchById(_question.id)).called(1);
      verifyNever(() => questionIdService.clean());
      verifyNever(() => fetchQuestionUseCase.fetch());
    });
  });
}
