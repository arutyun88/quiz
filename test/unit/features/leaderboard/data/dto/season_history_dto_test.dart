import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/leaderboard/data/converter/season_history_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/season_history_dto.dart';

void main() {
  test('decodes authoritative season aggregates and nullable rank', () {
    final entity = SeasonHistoryDto.fromJson({
      'season_id': 'season-1',
      'starts_at': '2026-08-01T00:00:00Z',
      'ends_at': '2026-08-29T00:00:00Z',
      'is_current': false,
      'rating_before': 1000,
      'rating_after': 1080,
      'rating_delta': 80,
      'best_rating': 1110,
      'official_answers': 24,
      'correct_answers': 18,
      'accuracy': 0.75,
      'rank': null,
    }).toEntity();

    expect(entity.seasonId, 'season-1');
    expect(entity.ratingDelta, 80);
    expect(entity.accuracy, 0.75);
    expect(entity.rank, isNull);
    expect(entity.isCurrent, isFalse);
  });
}
