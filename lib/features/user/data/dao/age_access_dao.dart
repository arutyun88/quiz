import 'package:quiz/features/user/domain/entity/age_access_entity.dart';

final class AgeAccessDao {
  const AgeAccessDao({
    required this.adultEligibleAt,
    required this.ageSignalSource,
    required this.storeAgeSignal,
    required this.adultEligible,
    required this.adultContentEnabled,
    required this.confirmedAtIso,
    required this.policyVersion,
    required this.revokedAtIso,
    required this.adultAccessOverride,
    required this.currentPolicyVersion,
  });

  final String? adultEligibleAt;
  final String ageSignalSource;
  final String storeAgeSignal;
  final bool adultEligible;
  final bool adultContentEnabled;
  final String? confirmedAtIso;
  final String? policyVersion;
  final String? revokedAtIso;
  final String adultAccessOverride;
  final String currentPolicyVersion;

  factory AgeAccessDao.fromJson(Map<String, dynamic> json) => AgeAccessDao(
        adultEligibleAt: json['adultEligibleAt'] as String?,
        ageSignalSource: json['ageSignalSource'] as String? ??
            AgeSignalSource.unknown.apiValue,
        storeAgeSignal: json['storeAgeSignal'] as String? ??
            StoreAgeSignal.unknown.apiValue,
        adultEligible: json['adultEligible'] as bool? ?? false,
        adultContentEnabled: json['adultContentEnabled'] as bool? ?? false,
        confirmedAtIso: json['confirmedAtIso'] as String?,
        policyVersion: json['policyVersion'] as String?,
        revokedAtIso: json['revokedAtIso'] as String?,
        adultAccessOverride: json['adultAccessOverride'] as String? ??
            AdultAccessOverride.unknown.apiValue,
        currentPolicyVersion: json['currentPolicyVersion'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'adultEligibleAt': adultEligibleAt,
        'ageSignalSource': ageSignalSource,
        'storeAgeSignal': storeAgeSignal,
        'adultEligible': adultEligible,
        'adultContentEnabled': adultContentEnabled,
        'confirmedAtIso': confirmedAtIso,
        'policyVersion': policyVersion,
        'revokedAtIso': revokedAtIso,
        'adultAccessOverride': adultAccessOverride,
        'currentPolicyVersion': currentPolicyVersion,
      };
}
