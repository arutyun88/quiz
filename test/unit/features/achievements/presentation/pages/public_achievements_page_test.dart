import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/data_page/page_info.dart';
import 'package:quiz/app/core/widgets/app_refresh_indicator.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/presentation/pages/public_achievements_page.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('public achievements show only unlocked items without refresh',
      (tester) async {
    await tester.pumpWidget(_appWith(_state([_unlocked, _locked])));
    await tester.pumpAndSettle();

    expect(find.text(_unlocked.name), findsOneWidget);
    expect(find.text(_locked.name), findsNothing);
    expect(find.byType(AppRefreshIndicator), findsNothing);
    expect(find.text('1/1'), findsNothing);
  });

  testWidgets('public achievements show an empty state when none are unlocked',
      (tester) async {
    await tester.pumpWidget(_appWith(_state([_locked])));
    await tester.pumpAndSettle();

    expect(find.text(_locked.name), findsNothing);
    expect(
      find.text(t.achievements.public_empty),
      findsOneWidget,
    );
  });
}

Widget _appWith(BaseState<PageEntity<UserAchievementEntity>> state) =>
    TranslationProvider(
      child: MaterialApp(
        theme: AppTheme.light,
        home: PublicAchievementsView(
          state: state,
          onRetry: () {},
        ),
      ),
    );

BaseState<PageEntity<UserAchievementEntity>> _state(
  List<UserAchievementEntity> items,
) =>
    BaseState.data(
      PageEntity(
        items: items,
        info: PageInfo(page: 0, limit: 20, hasNextPage: false),
      ),
    );

const _unlocked = UserAchievementEntity(
  id: 'unlocked',
  name: 'Earned achievement',
  description: 'Earned',
  category: 'BEGINNER',
  unlocked: true,
  points: 10,
  progressCurrent: 1,
  progressTarget: 1,
);

const _locked = UserAchievementEntity(
  id: 'locked',
  name: 'Locked achievement',
  description: 'Locked',
  category: 'PROGRESS',
  unlocked: false,
  points: 20,
  progressCurrent: 9,
  progressTarget: 10,
);
