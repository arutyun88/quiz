import 'package:quiz/features/user/data/dao/age_access_dao.dart';
import 'package:quiz/features/user/data/dto/age_access_dto.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';

extension AgeAccessDtoConverter on AgeAccessDto {
  AgeAccessEntity toEntity() => AgeAccessEntity(
        adultEligibleAt: adultEligibleAt,
        ageSignalSource: AgeSignalSource.fromApiValue(ageSignalSource),
        storeAgeSignal: StoreAgeSignal.fromApiValue(storeAgeSignal),
        adultEligible: adultEligible,
        adultContentEnabled: adultContentEnabled,
        confirmedAt: confirmedAt,
        policyVersion: policyVersion,
        revokedAt: revokedAt,
        adultAccessOverride:
            AdultAccessOverride.fromApiValue(adultAccessOverride),
        currentPolicyVersion: currentPolicyVersion,
      );
}

extension AgeAccessDaoConverter on AgeAccessDao {
  AgeAccessEntity toEntity() => AgeAccessEntity(
        adultEligibleAt: adultEligibleAt,
        ageSignalSource: AgeSignalSource.fromApiValue(ageSignalSource),
        storeAgeSignal: StoreAgeSignal.fromApiValue(storeAgeSignal),
        adultEligible: adultEligible,
        adultContentEnabled: adultContentEnabled,
        confirmedAt: _parseDate(confirmedAtIso),
        policyVersion: policyVersion,
        revokedAt: _parseDate(revokedAtIso),
        adultAccessOverride:
            AdultAccessOverride.fromApiValue(adultAccessOverride),
        currentPolicyVersion: currentPolicyVersion,
      );
}

extension AgeAccessEntityDaoConverter on AgeAccessEntity {
  AgeAccessDao toDao() => AgeAccessDao(
        adultEligibleAt: adultEligibleAt,
        ageSignalSource: ageSignalSource.apiValue,
        storeAgeSignal: storeAgeSignal.apiValue,
        adultEligible: adultEligible,
        adultContentEnabled: adultContentEnabled,
        confirmedAtIso: confirmedAt?.toIso8601String(),
        policyVersion: policyVersion,
        revokedAtIso: revokedAt?.toIso8601String(),
        adultAccessOverride: adultAccessOverride.apiValue,
        currentPolicyVersion: currentPolicyVersion,
      );
}

DateTime? _parseDate(String? value) =>
    value == null ? null : DateTime.parse(value);
