import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/analytics/presentation/product_analytics_consent_dialog.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/user/presentation/pages/guest_profile_page.dart';
import 'package:quiz/features/user/presentation/pages/profile_page.dart';

class ProfileFlow extends ConsumerStatefulWidget {
  const ProfileFlow({super.key});

  @override
  ConsumerState<ProfileFlow> createState() => _ProfileFlowState();
}

class _ProfileFlowState extends ConsumerState<ProfileFlow> {
  late final ProductAnalytics _analytics;

  @override
  void initState() {
    super.initState();
    _analytics = getIt<ProductAnalytics>();
    WidgetsBinding.instance.addPostFrameCallback((_) => _requestConsent());
  }

  Future<void> _requestConsent() async {
    if (!mounted || _analytics.consentDecided) return;
    final granted = await showProductAnalyticsConsentDialog(context);
    if (!mounted) return;
    await _analytics.setConsent(granted);
    if (!granted) return;
    final userId = ref.read(authenticationProvider).mapOrNull(
          authenticated: (state) => state.user?.id,
        );
    if (userId != null) await _analytics.identify(userId);
  }

  @override
  Widget build(BuildContext context) => ref.watch(
        authenticationProvider.select((state) => state.isAuthenticated),
      )
          ? const ProfilePage()
          : const GuestProfilePage();
}
