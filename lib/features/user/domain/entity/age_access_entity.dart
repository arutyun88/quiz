enum AgeSignalSource {
  selfDeclared('SELF_DECLARED'),
  store('STORE'),
  verified('VERIFIED'),
  unknown('UNKNOWN');

  const AgeSignalSource(this.apiValue);

  final String apiValue;

  factory AgeSignalSource.fromApiValue(String value) => switch (value) {
        'SELF_DECLARED' => AgeSignalSource.selfDeclared,
        'STORE' => AgeSignalSource.store,
        'VERIFIED' => AgeSignalSource.verified,
        _ => AgeSignalSource.unknown,
      };
}

enum StoreAgeSignal {
  adult('ADULT'),
  minor('MINOR'),
  restricted('RESTRICTED'),
  unknown('UNKNOWN');

  const StoreAgeSignal(this.apiValue);

  final String apiValue;

  factory StoreAgeSignal.fromApiValue(String value) => switch (value) {
        'ADULT' => StoreAgeSignal.adult,
        'MINOR' => StoreAgeSignal.minor,
        'RESTRICTED' => StoreAgeSignal.restricted,
        _ => StoreAgeSignal.unknown,
      };
}

enum AdultAccessOverride {
  none('NONE'),
  allow('ALLOW'),
  deny('DENY'),
  unknown('UNKNOWN');

  const AdultAccessOverride(this.apiValue);

  final String apiValue;

  factory AdultAccessOverride.fromApiValue(String value) => switch (value) {
        'NONE' => AdultAccessOverride.none,
        'ALLOW' => AdultAccessOverride.allow,
        'DENY' => AdultAccessOverride.deny,
        _ => AdultAccessOverride.unknown,
      };
}

/// Server-owned age-access snapshot.
///
/// [adultEligibleAt] is informational. Mobile code must not derive eligibility
/// or content access from the date; the server flags are authoritative.
final class AgeAccessEntity {
  const AgeAccessEntity({
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
  final AgeSignalSource ageSignalSource;
  final StoreAgeSignal storeAgeSignal;
  final bool adultEligible;
  final bool adultContentEnabled;
  final DateTime? confirmedAt;
  final String? policyVersion;
  final DateTime? revokedAt;
  final AdultAccessOverride adultAccessOverride;
  final String currentPolicyVersion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgeAccessEntity &&
          other.adultEligibleAt == adultEligibleAt &&
          other.ageSignalSource == ageSignalSource &&
          other.storeAgeSignal == storeAgeSignal &&
          other.adultEligible == adultEligible &&
          other.adultContentEnabled == adultContentEnabled &&
          other.confirmedAt == confirmedAt &&
          other.policyVersion == policyVersion &&
          other.revokedAt == revokedAt &&
          other.adultAccessOverride == adultAccessOverride &&
          other.currentPolicyVersion == currentPolicyVersion;

  @override
  int get hashCode => Object.hash(
        adultEligibleAt,
        ageSignalSource,
        storeAgeSignal,
        adultEligible,
        adultContentEnabled,
        confirmedAt,
        policyVersion,
        revokedAt,
        adultAccessOverride,
        currentPolicyVersion,
      );
}
