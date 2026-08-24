final class AgeAccessDto {
  const AgeAccessDto({
    required this.adultEligibleAt,
    required this.ageSignalSource,
    required this.storeAgeSignal,
    required this.adultEligible,
    required this.adultContentEnabled,
    required this.confirmedAt,
    required this.policyVersion,
    required this.revokedAt,
    required this.adultAccessOverride,
    required this.currentPolicyVersion,
  });

  final String? adultEligibleAt;
  final String ageSignalSource;
  final String storeAgeSignal;
  final bool adultEligible;
  final bool adultContentEnabled;
  final DateTime? confirmedAt;
  final String? policyVersion;
  final DateTime? revokedAt;
  final String adultAccessOverride;
  final String currentPolicyVersion;

  factory AgeAccessDto.fromJson(Map<String, dynamic> json) => AgeAccessDto(
        adultEligibleAt: json['adult_eligible_at'] as String?,
        ageSignalSource: json['age_signal_source'] as String,
        storeAgeSignal: json['store_age_signal'] as String,
        adultEligible: json['adult_eligible'] as bool,
        adultContentEnabled: json['adult_content_enabled'] as bool,
        confirmedAt: _parseDate(json['confirmed_at']),
        policyVersion: json['policy_version'] as String?,
        revokedAt: _parseDate(json['revoked_at']),
        adultAccessOverride: json['override'] as String,
        currentPolicyVersion: json['current_policy_version'] as String,
      );

  Map<String, dynamic> toJson() => {
        'adult_eligible_at': adultEligibleAt,
        'age_signal_source': ageSignalSource,
        'store_age_signal': storeAgeSignal,
        'adult_eligible': adultEligible,
        'adult_content_enabled': adultContentEnabled,
        'confirmed_at': confirmedAt?.toIso8601String(),
        'policy_version': policyVersion,
        'revoked_at': revokedAt?.toIso8601String(),
        'override': adultAccessOverride,
        'current_policy_version': currentPolicyVersion,
      };

  static DateTime? _parseDate(Object? value) =>
      value is String ? DateTime.parse(value) : null;
}
