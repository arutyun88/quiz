import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/utils/route_authenticated_user.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

void main() {
  final user = _user(name: 'User');

  test('complete profile without a started edition routes home', () {
    expect(
      authenticatedUserDestination(user, const DailyEditionInitialState()),
      AuthenticatedUserDestination.home,
    );
  });

  test('missing name routes to profile completion', () {
    expect(
      authenticatedUserDestination(
        _user(name: null),
        _activeState(startedAt: DateTime.utc(2026, 9, 9)),
      ),
      AuthenticatedUserDestination.profileEdit,
    );
  });

  test('started daily edition routes directly to the quiz', () {
    expect(
      authenticatedUserDestination(
        user,
        _activeState(startedAt: DateTime.utc(2026, 9, 9)),
      ),
      AuthenticatedUserDestination.quiz,
    );
  });
}

DailyEditionState _activeState({required DateTime? startedAt}) =>
    DailyEditionActiveState(
      run: DailyRunEntity(
        runId: 'run-1',
        editionDate: '2026-09-09',
        status: DailyRunStatus.inProgress,
        startedAt: startedAt,
        closesAt: DateTime.parse('2026-09-10T00:00:00Z'),
        graceEndsAt: DateTime.parse('2026-09-10T00:30:00Z'),
        requiredCount: 10,
        resolvedCount: 0,
        ratingAtOpen: 1000,
      ),
      assignment: const DailyAssignmentEntity(
        assignmentId: 'assignment-1',
        questionId: 'question-1',
        questionVersionId: 'version-1',
        position: 1,
        kind: DailyAssignmentKind.main,
        topic: 'Science',
        text: 'Question?',
        answers: [],
        hintUsed: false,
      ),
    );

UserEntity _user({required String? name}) => UserEntity(
      id: 'user-1',
      email: 'user@example.test',
      name: name,
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
