import 'package:freezed_annotation/freezed_annotation.dart';

part 'answered_today_entity.freezed.dart';

@freezed
class AnsweredTodayEntity with _$AnsweredTodayEntity {
  const AnsweredTodayEntity._();

  const factory AnsweredTodayEntity({
    required int answeredQuestionCount,
  }) = _AnsweredTodayEntity;

  bool get answeredToday => answeredQuestionCount > 0;
}
