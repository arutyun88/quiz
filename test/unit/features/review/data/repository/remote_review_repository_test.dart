import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/review/data/converter/review_history_converter.dart';
import 'package:quiz/features/review/data/dto/review_history_dto.dart';
import 'package:quiz/features/review/data/repository/remote_review_repository.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemoteReviewRepository repository;

  const history = ReviewHistoryEntity(
    items: [],
    total: 41,
    offset: 20,
    limit: 20,
  );

  setUp(() {
    client = MockApiClient();
    repository = RemoteReviewRepository(
      client: client,
      reviewHistoryConverter: ReviewHistoryConverterImpl(),
    );
  });

  test('fetches localized paginated immutable attempt history', () async {
    when(
      () => client.get<ReviewHistoryEntity, DataPageDto<ReviewHistoryItemDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(history));

    final result = await repository.fetch(limit: 20, offset: 20);

    expect(result, const Result.ok(history));
    final query = verify(
      () => client.get<ReviewHistoryEntity, DataPageDto<ReviewHistoryItemDto>>(
        '/questions/review/history',
        queryParameters: captureAny(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: true,
      ),
    ).captured.single as Map<String, dynamic>;
    expect(query, {'limit': 20, 'offset': 20});
  });
}
