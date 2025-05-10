import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

part 'answered_statistics_entity.freezed.dart';

@freezed
class AnsweredStatisticsEntity with _$AnsweredStatisticsEntity {
  const factory AnsweredStatisticsEntity({
    required bool lastIsCorrect,
    required UserStatisticsEntity statistics,
  }) = _AnsweredStatisticsEntity;
}
