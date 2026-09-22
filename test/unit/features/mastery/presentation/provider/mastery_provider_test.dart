import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';
import 'package:quiz/features/mastery/domain/repository/mastery_repository.dart';
import 'package:quiz/features/mastery/presentation/provider/mastery_provider.dart';

class _MockMasteryRepository extends Mock implements MasteryRepository {}

void main() {
  test('coalesces initial refresh and preserves data when refresh fails',
      () async {
    final repository = _MockMasteryRepository();
    const mastery = MasteryEntity(topics: []);
    when(repository.fetch).thenAnswer((_) async => const Result.ok(mastery));
    final notifier = MasteryNotifier(masteryRepository: repository);
    addTearDown(notifier.dispose);

    await notifier.refresh();

    verify(repository.fetch).called(1);
    expect((notifier.state as BaseDataState).data, mastery);

    when(repository.fetch).thenAnswer(
      (_) async => const Result.failed(Failure.noConnection()),
    );
    await notifier.refresh();

    expect((notifier.state as BaseDataState).data, mastery);
  });
}
