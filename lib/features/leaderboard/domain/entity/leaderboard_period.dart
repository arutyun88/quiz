enum LeaderboardPeriod {
  daily,
  weekly,
  monthly,
  yearly;

  String toApiValue() => name.toUpperCase();
}
