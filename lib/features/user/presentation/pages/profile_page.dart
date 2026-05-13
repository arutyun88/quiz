import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/gamification/presentation/widgets/user_stats_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      isScrollable: true,
      appBar: AppBar(
        title: Text(context.t.profile.title),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => context.push('/profile/settings'),
            icon: const Icon(Icons.settings),
          ),
          if (kDebugMode)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () => context.goNamed('debug'),
                icon: Icon(Icons.add_moderator),
              ),
            ),
        ],
      ),
      body: const Column(
        children: [
          UserStatsWidget(),
        ],
      ),
    );
  }
}
