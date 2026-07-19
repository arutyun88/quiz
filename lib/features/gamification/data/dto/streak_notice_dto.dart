import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_notice_dto.freezed.dart';
part 'streak_notice_dto.g.dart';

@freezed
class StreakNoticeDto with _$StreakNoticeDto {
  const factory StreakNoticeDto({
    required String type,
    @JsonKey(defaultValue: 0) required int freezesLeft,
    @JsonKey(defaultValue: 0) required int freezesTotal,
    @JsonKey(defaultValue: 0) required int lostStreakDays,
  }) = _StreakNoticeDto;

  factory StreakNoticeDto.fromJson(Map<String, dynamic> json) => _$StreakNoticeDtoFromJson(json);
}
