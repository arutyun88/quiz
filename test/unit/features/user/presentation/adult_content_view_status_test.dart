import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';
import 'package:quiz/features/user/presentation/pages/adult_content_settings_page.dart';
import 'package:quiz/features/user/presentation/provider/age_access_provider.dart';

void main() {
  test('eligibility alone requires separate confirmation', () {
    expect(
      adultContentViewStatus(
        AgeAccessState(status: _status(adultEligible: true), isFresh: true),
      ),
      AdultContentViewStatus.eligible,
    );
  });

  test('strict store signal wins over enabled and allow override', () {
    expect(
      adultContentViewStatus(
        AgeAccessState(
          status: _status(
            adultEligible: true,
            adultContentEnabled: true,
            storeAgeSignal: StoreAgeSignal.minor,
            adultAccessOverride: AdultAccessOverride.allow,
          ),
          isFresh: true,
        ),
      ),
      AdultContentViewStatus.blocked,
    );
  });

  test('cached enabled status cannot authorize the screen', () {
    expect(
      adultContentViewStatus(
        AgeAccessState(
          status: _status(
            adultEligible: true,
            adultContentEnabled: true,
          ),
        ),
      ),
      AdultContentViewStatus.loading,
    );
  });
}

AgeAccessEntity _status({
  bool adultEligible = false,
  bool adultContentEnabled = false,
  StoreAgeSignal storeAgeSignal = StoreAgeSignal.unknown,
  AdultAccessOverride adultAccessOverride = AdultAccessOverride.none,
}) =>
    AgeAccessEntity(
      adultEligibleAt: '2026-01-01',
      ageSignalSource: AgeSignalSource.selfDeclared,
      storeAgeSignal: storeAgeSignal,
      adultEligible: adultEligible,
      adultContentEnabled: adultContentEnabled,
      confirmedAt: null,
      policyVersion: null,
      revokedAt: null,
      adultAccessOverride: adultAccessOverride,
      currentPolicyVersion: 'v1',
    );
