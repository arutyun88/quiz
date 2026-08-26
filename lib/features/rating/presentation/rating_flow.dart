import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/demo/presentation/guest_rating_page.dart';
import 'package:quiz/features/leaderboard/presentation/pages/leaderboard_page.dart';

class RatingFlow extends ConsumerWidget {
  const RatingFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref.watch(
        authenticationProvider.select((state) => state.isAuthenticated),
      )
          ? const LeaderboardPage()
          : const GuestRatingPage();
}
