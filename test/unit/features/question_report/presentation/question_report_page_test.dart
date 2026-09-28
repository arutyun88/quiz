import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question_report/domain/entity/question_report.dart';
import 'package:quiz/features/question_report/domain/repository/question_report_repository.dart';
import 'package:quiz/features/question_report/presentation/provider/question_report_provider.dart';
import 'package:quiz/features/question_report/presentation/question_report_page.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  setUpAll(() async => LocaleSettings.setLocale(AppLocale.ru));

  testWidgets('submits a categorized report and confirms success',
      (tester) async {
    final repository = _FakeQuestionReportRepository();
    await tester.pumpWidget(_testApp(repository));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.byType(QuestionReportPage), findsOneWidget);
    expect(find.text('Проблема с отображением'), findsOneWidget);
    await tester.tap(
      find.byKey(const ValueKey('question-report-OUTDATED_FACT')),
    );
    await tester.pump();
    expect(find.byType(RadioListTile<QuestionReportCategory>), findsNothing);
    expect(find.byIcon(Icons.check), findsOneWidget);
    await tester.enterText(
      find.byKey(const ValueKey('question-report-details')),
      'Источник больше не актуален',
    );
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    final submit = find.text('ОТПРАВИТЬ ОТЗЫВ');
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pumpAndSettle();

    expect(repository.submissions, hasLength(1));
    expect(repository.submissions.single.attemptId, 'attempt-1');
    expect(repository.submissions.single.category,
        QuestionReportCategory.outdatedFact);
    expect(
        repository.submissions.single.details, 'Источник больше не актуален');
    expect(find.text('ОТЗЫВ ОТПРАВЛЕН'), findsOneWidget);
  });

  testWidgets('keeps the page usable above the keyboard and dismisses on tap',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(top: 47);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);
    addTearDown(tester.view.resetViewInsets);

    await tester.pumpWidget(_testApp(_FakeQuestionReportRepository()));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    final details = find.byKey(const ValueKey('question-report-details'));
    await tester.ensureVisible(details);
    await tester.tap(details);
    await tester.showKeyboard(details);
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    tester.binding.handleMetricsChanged();
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('СООБЩИТЬ О ПРОБЛЕМЕ'), findsOneWidget);
    expect(tester.testTextInput.isVisible, isTrue);
    final counterBottom = tester.getBottomLeft(find.text('0/4000')).dy;
    expect(counterBottom, inInclusiveRange(512, 544));

    await tester.tap(find.text('СООБЩИТЬ О ПРОБЛЕМЕ'));
    await tester.pumpAndSettle();

    expect(tester.testTextInput.isVisible, isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps the keyboard open while the report page is dragged',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(_testApp(_FakeQuestionReportRepository()));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    final details = find.byKey(const ValueKey('question-report-details'));
    await tester.ensureVisible(details);
    await tester.tap(details);
    await tester.showKeyboard(details);
    expect(tester.testTextInput.isVisible, isTrue);

    await tester.drag(
      find.byKey(const ValueKey('question-report-scroll')),
      const Offset(0, -60),
    );
    await tester.pumpAndSettle();

    expect(tester.testTextInput.isVisible, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('opens the root report route above a modal answer surface',
      (tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: TextButton(
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                builder: (sheetContext) => TextButton(
                  onPressed: () => openQuestionReportPage(
                    sheetContext,
                    attemptId: 'attempt-1',
                  ),
                  child: const Text('report'),
                ),
              ),
              child: const Text('open sheet'),
            ),
          ),
        ),
        GoRoute(
          path: '/question-report/:attemptId',
          name: 'question-report',
          builder: (context, state) => QuestionReportPage(
            attemptId: state.pathParameters['attemptId']!,
          ),
        ),
      ],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          questionReportRepositoryProvider.overrideWithValue(
            _FakeQuestionReportRepository(),
          ),
        ],
        child: TranslationProvider(
          child: MaterialApp.router(
            theme: AppTheme.light,
            routerConfig: router,
          ),
        ),
      ),
    );

    await tester.tap(find.text('open sheet'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('report'));
    await tester.pumpAndSettle();

    expect(find.byType(QuestionReportPage), findsOneWidget);
    expect(find.byType(QuestionReportPage).hitTestable(), findsOneWidget);
  });
}

Widget _testApp(QuestionReportRepository repository) {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Scaffold(
          body: TextButton(
            onPressed: () => openQuestionReportPage(
              context,
              attemptId: 'attempt-1',
            ),
            child: const Text('open'),
          ),
        ),
      ),
      GoRoute(
        path: '/question-report/:attemptId',
        name: 'question-report',
        builder: (context, state) => QuestionReportPage(
          attemptId: state.pathParameters['attemptId']!,
        ),
      ),
    ],
  );
  return ProviderScope(
    overrides: [
      questionReportRepositoryProvider.overrideWithValue(repository),
    ],
    child: TranslationProvider(
      child: MaterialApp.router(
        theme: AppTheme.light,
        routerConfig: router,
      ),
    ),
  );
}

class _FakeQuestionReportRepository implements QuestionReportRepository {
  final List<QuestionReportSubmission> submissions = [];

  @override
  Future<Result<void, Failure>> submit(
    QuestionReportSubmission submission,
  ) async {
    submissions.add(submission);
    return const Result.ok(null);
  }
}
