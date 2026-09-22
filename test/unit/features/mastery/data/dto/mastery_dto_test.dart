import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/mastery/data/dto/mastery_dto.dart';

void main() {
  test('decodes daily accuracy rhythm', () {
    final dto = MasteryDto.fromJson(const {
      'topics': <Object>[],
      'weekly_accuracy_delta': 0.08,
      'best_day_of_week': 7,
      'daily_accuracy': [
        {
          'day_of_week': 1,
          'accuracy': 0.6,
          'answers': 10,
        },
        {
          'day_of_week': 7,
          'accuracy': 0.84,
          'answers': 25,
        },
      ],
      'best_day': {
        'date': '2026-09-19',
        'accuracy': 0.9,
        'answers': 10,
      },
    });

    expect(dto.bestDayOfWeek, 7);
    expect(dto.dailyAccuracy, hasLength(2));
    expect(dto.dailyAccuracy.last.dayOfWeek, 7);
    expect(dto.dailyAccuracy.last.accuracy, 0.84);
    expect(dto.dailyAccuracy.last.answers, 25);
    expect(dto.bestDay?.date, DateTime(2026, 9, 19));
    expect(dto.bestDay?.accuracy, 0.9);
    expect(dto.bestDay?.answers, 10);
  });

  test('keeps daily accuracy empty for an older response', () {
    final dto = MasteryDto.fromJson(const {
      'topics': <Object>[],
      'best_day_of_week': 7,
    });

    expect(dto.dailyAccuracy, isEmpty);
  });
}
