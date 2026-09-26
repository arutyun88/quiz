import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/user/presentation/pages/guest_profile_page.dart';
import 'package:quiz/features/user/presentation/pages/profile_page.dart';

class ProfileFlow extends ConsumerWidget {
  const ProfileFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref.watch(
        authenticationProvider.select((state) => state.isAuthenticated),
      )
          ? const ProfilePage()
          : const GuestProfilePage();
}
