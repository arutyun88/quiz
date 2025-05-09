import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_statistics_dto.freezed.dart';
part 'user_statistics_dto.g.dart';

@freezed
class UserStatisticsDto with _$UserStatisticsDto {
  const factory UserStatisticsDto({
    @JsonKey(name: 'right_count') required int rightCount,
    @JsonKey(name: 'wrong_count') required int wrongCount,
  }) = _UserStatisticsDto;

  factory UserStatisticsDto.fromJson(Map<String, dynamic> json) => _$UserStatisticsDtoFromJson(json);
}
