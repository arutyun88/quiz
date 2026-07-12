import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/features/user/presentation/provider/profile_provider.dart';
import 'package:quiz/features/user/presentation/widgets/profile_header.dart';
import 'package:quiz/features/user/presentation/widgets/profile_placeholders.dart';
import 'package:quiz/features/user/presentation/widgets/profile_view.dart';

class PublicProfilePage extends ConsumerWidget {
  const PublicProfilePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.palette;
    final profileState = ref.watch(publicProfileProvider(userId));

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeader(showBack: true),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: switch (profileState) {
                BaseLoadingState() => const ProfileLoading(),
                BaseDataState(:final data) => ProfileView(
                    profile: data,
                    isPublic: true,
                  ),
                _ => ProfileError(
                    onRetry: () => ref.read(publicProfileProvider(userId).notifier).fetch(),
                  ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
