class NotificationPreferencesEntity {
  const NotificationPreferencesEntity({
    required this.dailyEdition,
    required this.streakRisk,
    required this.rankChange,
    required this.promotions,
  });

  final bool dailyEdition;
  final bool streakRisk;
  final bool rankChange;
  final bool promotions;

  NotificationPreferencesEntity copyWith({
    bool? dailyEdition,
    bool? streakRisk,
    bool? rankChange,
    bool? promotions,
  }) =>
      NotificationPreferencesEntity(
        dailyEdition: dailyEdition ?? this.dailyEdition,
        streakRisk: streakRisk ?? this.streakRisk,
        rankChange: rankChange ?? this.rankChange,
        promotions: promotions ?? this.promotions,
      );
}
