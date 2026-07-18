import 'package:freezed_annotation/freezed_annotation.dart';

part 'mastery_entity.freezed.dart';

/// Topic mastery over the last 30 days.
@freezed
class MasteryEntity with _$MasteryEntity {
  const factory MasteryEntity({
    required List<MasteryTopicEntity> topics,
    MasteryTopicEntity? weakest,

    /// Accuracy of the last 7 days minus the 7 days before; null without data.
    double? weeklyAccuracyDelta,

    /// ISO day of week (1 = Monday); null without data.
    int? bestDayOfWeek,
  }) = _MasteryEntity;
}

@freezed
class MasteryTopicEntity with _$MasteryTopicEntity {
  const factory MasteryTopicEntity({
    required String name,
    required double accuracy,
    required int answers,
  }) = _MasteryTopicEntity;
}
