import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_statistics_entity.freezed.dart';

@freezed
class UserStatisticsEntity with _$UserStatisticsEntity {
  const factory UserStatisticsEntity({
    required int rightCount,
    required int wrongCount,
  }) = _UserStatisticsEntity;
}
