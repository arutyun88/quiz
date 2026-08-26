import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/data_page/page_info.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/demo/domain/entity/demo_answer_entity.dart';
import 'package:quiz/features/demo/domain/repository/demo_repository.dart';
import 'package:quiz/features/demo/presentation/provider/demo_provider.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';

class MockDemoRepository extends Mock implements DemoRepository {}

void main() {
  late MockDemoRepository repository;

  setUp(() => repository = MockDemoRepository());

  test('loads the configured number of questions without local cache',
      () async {
    when(() => repository.fetchQuestions(limit: 3)).thenAnswer(
      (_) async => Result.ok(_page([_question('question-1')])),
    );
    final notifier = DemoNotifier(repository: repository, questionLimit: 3);
    addTearDown(notifier.dispose);

    await notifier.bootstrap();

    final state = notifier.state as DemoActiveState;
    expect(state.question.id, 'question-1');
    expect(state.position, 1);
    verify(() => repository.fetchQuestions(limit: 3)).called(1);
  });

  test('keeps only the authoritative server reveal', () async {
    when(() => repository.fetchQuestions(limit: 1)).thenAnswer(
      (_) async => Result.ok(_page([_question('question-1')])),
    );
    when(
      () => repository.checkAnswer(
        questionId: 'question-1',
        answerId: 'answer-2',
      ),
    ).thenAnswer(
      (_) async => const Result.ok(
        DemoAnswerEntity(
          isCorrect: false,
          answerId: 'answer-2',
          correctAnswerId: 'answer-1',
          description: 'Server explanation',
        ),
      ),
    );
    final notifier = DemoNotifier(repository: repository, questionLimit: 1);
    addTearDown(notifier.dispose);
    await notifier.bootstrap();

    await notifier.submitAnswer('answer-2');

    final state = notifier.state as DemoActiveState;
    expect(state.reveal?.correctAnswerId, 'answer-1');
    expect(state.reveal?.description, 'Server explanation');
  });

  test('does not send an answer that is absent from the loaded question',
      () async {
    when(() => repository.fetchQuestions(limit: 1)).thenAnswer(
      (_) async => Result.ok(_page([_question('question-1')])),
    );
    final notifier = DemoNotifier(repository: repository, questionLimit: 1);
    addTearDown(notifier.dispose);
    await notifier.bootstrap();

    await notifier.submitAnswer('manufactured-answer');

    verifyNever(
      () => repository.checkAnswer(
        questionId: any(named: 'questionId'),
        answerId: any(named: 'answerId'),
      ),
    );
  });

  test('advances only after a server reveal and completes in memory', () async {
    when(() => repository.fetchQuestions(limit: 1)).thenAnswer(
      (_) async => Result.ok(_page([_question('question-1')])),
    );
    when(
      () => repository.checkAnswer(
        questionId: 'question-1',
        answerId: 'answer-1',
      ),
    ).thenAnswer(
      (_) async => const Result.ok(
        DemoAnswerEntity(
          isCorrect: true,
          answerId: 'answer-1',
          correctAnswerId: 'answer-1',
          description: 'Server explanation',
        ),
      ),
    );
    final notifier = DemoNotifier(repository: repository, questionLimit: 1);
    addTearDown(notifier.dispose);
    await notifier.bootstrap();

    notifier.advance();
    expect(notifier.state, isA<DemoActiveState>());
    await notifier.submitAnswer('answer-1');
    notifier.advance();

    expect(notifier.state, isA<DemoCompletedState>());
  });

  test('keeps the current question retryable after a network failure',
      () async {
    when(() => repository.fetchQuestions(limit: 1)).thenAnswer(
      (_) async => Result.ok(_page([_question('question-1')])),
    );
    when(
      () => repository.checkAnswer(
        questionId: 'question-1',
        answerId: 'answer-1',
      ),
    ).thenAnswer(
      (_) async => const Result.failed(Failure.noConnection()),
    );
    final notifier = DemoNotifier(repository: repository, questionLimit: 1);
    addTearDown(notifier.dispose);
    await notifier.bootstrap();

    await notifier.submitAnswer('answer-1');

    final state = notifier.state as DemoActiveState;
    expect(state.question.id, 'question-1');
    expect(state.failure, isA<NoConnectionFailure>());
    expect(state.reveal, isNull);
  });
}

PageEntity<QuestionEntity> _page(List<QuestionEntity> questions) => PageEntity(
      items: questions,
      info: PageInfo(page: 0, limit: questions.length, hasNextPage: false),
    );

QuestionEntity _question(String id) => QuestionEntity(
      id: id,
      question: 'Question?',
      topic: const TopicEntity(id: 'topic-1', name: 'Topic', description: ''),
      hint: 'Hint',
      answers: const [
        AnswerEntity(id: 'answer-1', text: 'One'),
        AnswerEntity(id: 'answer-2', text: 'Two'),
      ],
    );
