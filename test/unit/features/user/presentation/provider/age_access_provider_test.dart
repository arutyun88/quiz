import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/age_access_repository.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';
import 'package:quiz/features/user/presentation/provider/age_access_provider.dart';

class _MockAgeAccessRepository extends Mock implements AgeAccessRepository {}

class _MockLocalUserRepository extends Mock implements LocalUserRepository {}

void main() {
  late _MockAgeAccessRepository repository;
  late _MockLocalUserRepository localRepository;
  late UserEntity user;
  late List<UserEntity> updates;
  late AgeAccessNotifier notifier;

  const eligible = AgeAccessEntity(
    adultEligibleAt: '2026-08-25',
    ageSignalSource: AgeSignalSource.selfDeclared,
    storeAgeSignal: StoreAgeSignal.unknown,
    adultEligible: true,
    adultContentEnabled: false,
    confirmedAt: null,
    policyVersion: null,
    revokedAt: null,
    adultAccessOverride: AdultAccessOverride.none,
    currentPolicyVersion: 'adult-content-v2',
  );

  const enabled = AgeAccessEntity(
    adultEligibleAt: '2026-08-25',
    ageSignalSource: AgeSignalSource.selfDeclared,
    storeAgeSignal: StoreAgeSignal.adult,
    adultEligible: true,
    adultContentEnabled: true,
    confirmedAt: null,
    policyVersion: 'adult-content-v2',
    revokedAt: null,
    adultAccessOverride: AdultAccessOverride.none,
    currentPolicyVersion: 'adult-content-v2',
  );

  const restricted = AgeAccessEntity(
    adultEligibleAt: '2026-08-25',
    ageSignalSource: AgeSignalSource.store,
    storeAgeSignal: StoreAgeSignal.restricted,
    adultEligible: false,
    adultContentEnabled: false,
    confirmedAt: null,
    policyVersion: null,
    revokedAt: null,
    adultAccessOverride: AdultAccessOverride.allow,
    currentPolicyVersion: 'adult-content-v2',
  );

  setUpAll(() {
    registerFallbackValue(_user());
  });

  setUp(() {
    repository = _MockAgeAccessRepository();
    localRepository = _MockLocalUserRepository();
    user = _user();
    updates = [];
    notifier = AgeAccessNotifier(
      repository: repository,
      localUserRepository: localRepository,
      currentUser: () => user,
      updateUser: (updated) {
        user = updated;
        updates.add(updated);
      },
    );
    addTearDown(notifier.dispose);

    when(() => localRepository.saveUser(any())).thenAnswer((_) async {});
  });

  test('cached age access starts stale and refresh uses server flags unchanged',
      () async {
    user = user.copyWith(ageAccess: enabled);
    notifier = AgeAccessNotifier(
      repository: repository,
      localUserRepository: localRepository,
      currentUser: () => user,
      updateUser: (updated) => user = updated,
    );
    addTearDown(notifier.dispose);
    when(() => repository.fetch())
        .thenAnswer((_) async => const Result.ok(restricted));

    expect(notifier.state.status, enabled);
    expect(notifier.state.isFresh, isFalse);

    await notifier.refresh();

    expect(notifier.state.status, restricted);
    expect(notifier.state.isFresh, isTrue);
    expect(notifier.state.status?.storeAgeSignal, StoreAgeSignal.restricted);
    expect(
        notifier.state.status?.adultAccessOverride, AdultAccessOverride.allow);
    expect(notifier.state.status?.adultContentEnabled, isFalse);
  });

  test('confirm refreshes first and sends the current server policy version',
      () async {
    when(() => repository.fetch())
        .thenAnswer((_) async => const Result.ok(eligible));
    when(
      () => repository.confirm(policyVersion: any(named: 'policyVersion')),
    ).thenAnswer((_) async => const Result.ok(enabled));

    await notifier.confirm();

    verifyInOrder([
      () => repository.fetch(),
      () => repository.confirm(policyVersion: 'adult-content-v2'),
    ]);
    expect(notifier.state.status, enabled);
    expect(user.ageAccess, enabled);
    expect(updates.last.ageAccess, enabled);
  });

  test('confirm never enables optimistically when server rejects it', () async {
    const forbidden = Failure.network(
      NetworkFailureReason.badResponse(
        'restricted',
        statusCode: 403,
        errorCode: 'ADULT_CONTENT_NOT_ALLOWED',
      ),
    );
    var fetchCount = 0;
    when(() => repository.fetch()).thenAnswer((_) async {
      fetchCount += 1;
      return Result.ok(fetchCount == 1 ? eligible : restricted);
    });
    when(
      () => repository.confirm(policyVersion: any(named: 'policyVersion')),
    ).thenAnswer((_) async => const Result.failed(forbidden));

    await notifier.confirm();

    expect(fetchCount, 2);
    expect(notifier.state.status, restricted);
    expect(notifier.state.status?.adultContentEnabled, isFalse);
    expect(notifier.state.failure, forbidden);
  });

  test('revoke updates auth and cache only from the server response', () async {
    user = user.copyWith(ageAccess: enabled);
    when(() => repository.revoke())
        .thenAnswer((_) async => const Result.ok(eligible));

    await notifier.revoke();

    verify(() => localRepository.saveUser(any(that: isA<UserEntity>())))
        .called(1);
    expect(user.ageAccess, eligible);
    expect(notifier.state.status, eligible);
    expect(notifier.state.isFresh, isTrue);
  });
}

UserEntity _user() => UserEntity(
      id: 'user-1',
      email: 'user@example.test',
      name: 'User',
      level: 1,
      experienceInLevel: 0,
      levelExperience: 100,
      streakDays: 0,
      bestStreakDays: 0,
      questionsAnswered: 0,
      correctAnswers: 0,
      accuracy: 0,
      totalPoints: 0,
      memberSince: DateTime.utc(2026),
      achievementsUnlocked: 0,
      achievementsTotal: 0,
    );
