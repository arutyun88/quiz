import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/meta.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';
import 'package:quiz/features/leaderboard/data/repository/remote_leaderboard_repository.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemoteLeaderboardRepository repository;

  const rankedDto = LeaderboardDto(
    seasonId: 'season-1',
    userId: 'user-2',
    userName: 'Grace',
    rating: 1200,
    bestRating: 1220,
    officialAnswers: 50,
    provisional: false,
    rank: 1,
  );
  const me = LeaderboardEntity(
    seasonId: 'season-1',
    userId: 'user-1',
    userName: 'Ada',
    rating: 1050,
    bestRating: 1080,
    officialAnswers: 12,
    provisional: true,
    rank: null,
  );

  setUpAll(() => registerFallbackValue(<String, dynamic>{}));

  setUp(() {
    client = MockApiClient();
    repository = RemoteLeaderboardRepository(
      client: client,
      converter: LeaderboardConverterImpl(),
    );
  });

  test('combines the current season page with authoritative own state',
      () async {
    final page = DataPageDto<LeaderboardDto>(
      data: const [rankedDto],
      meta: const Meta(limit: 100, offset: 0, total: 1),
    );
    when(
      () =>
          client.get<DataPageDto<LeaderboardDto>, DataPageDto<LeaderboardDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => Result.ok(page));
    when(
      () => client.get<LeaderboardEntity, DataDto<LeaderboardDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(me));

    final result = await repository.fetchCurrentSeason();

    expect(result, isA<ResultOk>());
    final overview = (result as ResultOk).data;
    expect(overview.entries.single.rating, 1200);
    expect(overview.me, me);
    expect(overview.total, 1);
    verify(
      () =>
          client.get<DataPageDto<LeaderboardDto>, DataPageDto<LeaderboardDto>>(
        '/gamification/leaderboard',
        queryParameters: {'limit': 100, 'offset': 0},
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).called(1);
    verify(
      () => client.get<LeaderboardEntity, DataDto<LeaderboardDto>>(
        '/gamification/leaderboard/me',
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).called(1);
  });
}
