import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_dto.freezed.dart';
part 'subscription_dto.g.dart';

@freezed
class SubscriptionDto with _$SubscriptionDto {
  const factory SubscriptionDto({
    required bool active,
    required String plan,
    @JsonKey(name: 'renews_at') DateTime? renewsAt,
  }) = _SubscriptionDto;

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) => _$SubscriptionDtoFromJson(json);
}
