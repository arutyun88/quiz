import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';
import 'package:quiz/features/review/presentation/provider/review_provider.dart';

class _MockReviewRepository extends Mock implements ReviewRepository {}

void main() {
  test('coalesces initial refresh and preserves data when refresh fails',
      () async {
    final repository = _MockReviewRepository();
    const history = ReviewHistoryEntity(
      items: [],
      total: 0,
      offset: 0,
      limit: 20,
    );
    when(
      () => repository.fetch(limit: any(named: 'limit'), offset: 0),
    ).thenAnswer((_) async => const Result.ok(history));
    final notifier = ReviewNotifier(reviewRepository: repository);
    addTearDown(notifier.dispose);

    await notifier.refresh();

    verify(() => repository.fetch(limit: 20, offset: 0)).called(1);
    expect((notifier.state as ReviewDataState).items, isEmpty);

    when(
      () => repository.fetch(limit: any(named: 'limit'), offset: 0),
    ).thenAnswer(
      (_) async => const Result.failed(Failure.noConnection()),
    );
    await notifier.refresh();

    expect(notifier.state, isA<ReviewDataState>());
  });
}
