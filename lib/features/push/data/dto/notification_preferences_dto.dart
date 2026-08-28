class NotificationPreferencesDto {
  const NotificationPreferencesDto({
    required this.dailyEdition,
    required this.streakRisk,
    required this.rankChange,
    required this.promotions,
  });

  final bool dailyEdition;
  final bool streakRisk;
  final bool rankChange;
  final bool promotions;

  factory NotificationPreferencesDto.fromJson(Map<String, dynamic> json) =>
      NotificationPreferencesDto(
        dailyEdition: json['daily_edition'] as bool,
        streakRisk: json['streak_risk'] as bool,
        rankChange: json['rank_change'] as bool,
        promotions: json['promotions'] as bool,
      );
}
