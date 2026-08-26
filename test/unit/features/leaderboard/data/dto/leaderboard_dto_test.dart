import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';

void main() {
  test('decodes the current knowledge-rating season contract', () {
    final dto = LeaderboardDto.fromJson({
      'season_id': 'season-1',
      'user_id': 'user-1',
      'user_name': 'Ada',
      'rating': 1124,
      'best_rating': 1180,
      'official_answers': 42,
      'provisional': false,
      'rank': 7,
    });

    expect(dto.seasonId, 'season-1');
    expect(dto.userId, 'user-1');
    expect(dto.userName, 'Ada');
    expect(dto.rating, 1124);
    expect(dto.bestRating, 1180);
    expect(dto.officialAnswers, 42);
    expect(dto.provisional, isFalse);
    expect(dto.rank, 7);
  });

  test('keeps a provisional user without a rank representable', () {
    final dto = LeaderboardDto.fromJson({
      'season_id': 'season-1',
      'user_id': 'user-1',
      'user_name': null,
      'rating': 1000,
      'best_rating': 1000,
      'official_answers': 0,
      'provisional': true,
      'rank': null,
    });

    expect(dto.provisional, isTrue);
    expect(dto.rank, isNull);
  });
}
