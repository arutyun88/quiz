import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/features/user/presentation/provider/profile_provider.dart';
import 'package:quiz/features/user/presentation/widgets/profile_header.dart';
import 'package:quiz/features/user/presentation/widgets/profile_placeholders.dart';
import 'package:quiz/features/user/presentation/widgets/profile_view.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileHeader(
              trailing: Row(
                children: [
                  if (kDebugMode) ...[
                    ProfileHeaderButton(
                      icon: Icons.add_moderator_outlined,
                      onTap: () => context.goNamed('debug'),
                    ),
                    const SizedBox(width: 8),
                  ],
                  ProfileHeaderButton(
                    icon: Icons.settings_outlined,
                    onTap: () => context.push('/profile/settings'),
                  ),
                ],
              ),
            ),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: switch (profileState) {
                BaseLoadingState() => const ProfileLoading(),
                BaseDataState(:final data) => ProfileView(
                    profile: data,
                    isPublic: false,
                    onAchievementsTap: () => context.push('/profile/achievements'),
                  ),
                _ => ProfileError(
                    onRetry: () => ref.read(profileProvider.notifier).fetch(),
                  ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
