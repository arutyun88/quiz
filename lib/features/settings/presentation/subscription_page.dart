import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/subscription/domain/entity/quiz_plus_package_entity.dart';
import 'package:quiz/features/subscription/presentation/provider/quiz_plus_purchase_provider.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';
import 'package:quiz/gen/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

final subscriptionManagementLauncherProvider =
    Provider<SubscriptionManagementLauncher>(
  (_) => const UrlSubscriptionManagementLauncher(),
);

abstract interface class SubscriptionManagementLauncher {
  Future<bool> launch(String url);
}

class UrlSubscriptionManagementLauncher
    implements SubscriptionManagementLauncher {
  const UrlSubscriptionManagementLauncher();

  @override
  Future<bool> launch(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null ||
        uri.scheme != 'https' ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty) {
      return false;
    }
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class SubscriptionPage extends ConsumerWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings.subscription_page;
    final subscription = ref
        .watch(authenticationProvider)
        .mapOrNull(authenticated: (state) => state.user?.subscription);
    final purchases = ref.watch(quizPlusPurchaseProvider);
    final entitlementActive = subscription?.entitlementActive == true;
    final purchaseAvailability =
        subscription?.purchaseAvailability ?? PurchaseAvailability.unknown;
    final canPurchase = !entitlementActive &&
        purchaseAvailability == PurchaseAvailability.available;
    final canManage = entitlementActive &&
        subscription?.accessReason == SubscriptionAccessReason.subscription &&
        subscription?.provider?.isNotEmpty == true &&
        subscription?.managementUrl?.isNotEmpty == true;

    return AppScaffold(
      title: t.title,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SubscriptionSummaryCard(subscription: subscription),
            const SizedBox(height: 24),
            if (canPurchase) ...[
              Text(
                t.choose_plan.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                  color: context.palette.text.secondary,
                ),
              ),
              const SizedBox(height: 12),
              _Offerings(purchases: purchases),
              const SizedBox(height: 18),
            ] else if (!entitlementActive) ...[
              PurchaseAvailabilityInfo(availability: purchaseAvailability),
              const SizedBox(height: 18),
            ],
            _PurchaseStatus(status: purchases.status),
            if (purchases.processing) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
            ],
            if (canPurchase) ...[
              const SizedBox(height: 22),
              Center(
                child: TextButton(
                  onPressed: purchases.processing || !purchases.available
                      ? null
                      : () =>
                          ref.read(quizPlusPurchaseProvider.notifier).restore(),
                  child: Text(t.restore.toUpperCase()),
                ),
              ),
            ],
            if (canManage) ...[
              const SizedBox(height: 22),
              SubscriptionManagementButton(subscription: subscription!),
            ],
          ],
        ),
      ),
    );
  }
}

class PurchaseAvailabilityInfo extends StatelessWidget {
  const PurchaseAvailabilityInfo({required this.availability, super.key});

  final PurchaseAvailability availability;

  @override
  Widget build(BuildContext context) {
    final t = context.t.profile.settings.subscription_page;
    return _InfoText(
      switch (availability) {
        PurchaseAvailability.comingSoon => t.coming_soon,
        PurchaseAvailability.temporarilyUnavailable =>
          t.temporarily_unavailable,
        _ => t.temporarily_unavailable,
      },
    );
  }
}

class SubscriptionManagementButton extends ConsumerWidget {
  const SubscriptionManagementButton({
    required this.subscription,
    super.key,
  });

  final SubscriptionEntity subscription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = subscription.managementUrl;
    if (!subscription.entitlementActive ||
        subscription.accessReason != SubscriptionAccessReason.subscription ||
        subscription.provider?.isNotEmpty != true ||
        url == null ||
        url.isEmpty) {
      return const SizedBox.shrink();
    }
    return Center(
      child: TextButton(
        onPressed: () =>
            ref.read(subscriptionManagementLauncherProvider).launch(url),
        child: Text(
          context.t.profile.settings.subscription_page.manage_subscription
              .toUpperCase(),
        ),
      ),
    );
  }
}

class _Offerings extends ConsumerWidget {
  const _Offerings({required this.purchases});

  final QuizPlusPurchaseState purchases;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings.subscription_page;
    if (purchases.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (!purchases.available) {
      return _InfoText(t.billing_unavailable);
    }
    if (purchases.packages.isEmpty) {
      return _InfoText(t.no_offerings);
    }
    return Column(
      children: purchases.packages
          .map(
            (package) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _PackageCard(
                package: package,
                disabled: purchases.processing,
                onPurchase: () => ref
                    .read(quizPlusPurchaseProvider.notifier)
                    .purchase(package.packageId),
              ),
            ),
          )
          .toList(growable: false),
    );
  }
}

class _PackageCard extends StatelessWidget {
  const _PackageCard({
    required this.package,
    required this.disabled,
    required this.onPurchase,
  });

  final QuizPlusPackageEntity package;
  final bool disabled;
  final VoidCallback onPurchase;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.profile.settings.subscription_page;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors.text.primary),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            package.title,
            style: GoogleFonts.unbounded(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: colors.text.primary,
            ),
          ),
          if (package.description.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              package.description,
              style: GoogleFonts.spectral(
                fontSize: 15,
                color: colors.text.secondary,
              ),
            ),
          ],
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: disabled ? null : onPurchase,
              child: Text(t.subscribe(price: package.price).toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}

class _PurchaseStatus extends StatelessWidget {
  const _PurchaseStatus({required this.status});

  final QuizPlusPurchaseStatus status;

  @override
  Widget build(BuildContext context) {
    final t = context.t.profile.settings.subscription_page;
    final message = switch (status) {
      QuizPlusPurchaseStatus.storePending => t.store_pending,
      QuizPlusPurchaseStatus.awaitingServer => t.awaiting_server,
      QuizPlusPurchaseStatus.activated => t.activated,
      QuizPlusPurchaseStatus.restoredWithoutEntitlement =>
        t.restored_without_entitlement,
      QuizPlusPurchaseStatus.failed => t.failed,
      _ => null,
    };
    return message == null ? const SizedBox.shrink() : _InfoText(message);
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.spectral(
          fontSize: 15,
          color: context.palette.text.secondary,
        ),
      );
}

class SubscriptionSummaryCard extends StatelessWidget {
  const SubscriptionSummaryCard({required this.subscription, super.key});

  final SubscriptionEntity? subscription;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.profile.settings.subscription_page;
    final locale = LocaleSettings.instance.currentLocale.languageCode;
    final periodEndsAt = subscription?.currentPeriodEndsAt;
    final entitlementActive = subscription?.entitlementActive == true;
    final isMarketPreview =
        subscription?.accessReason == SubscriptionAccessReason.marketPreview;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors.text.primary, width: 1.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'QUIZ',
                        style: GoogleFonts.unbounded(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: colors.text.primary,
                        ),
                      ),
                      TextSpan(
                        text: '+',
                        style: GoogleFonts.unbounded(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: colors.text.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                (entitlementActive ? t.active : t.inactive).toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: entitlementActive
                      ? colors.answer.success
                      : colors.text.secondary,
                ),
              ),
            ],
          ),
          if (subscription != null) ...[
            const SizedBox(height: 8),
            if (isMarketPreview)
              Text(
                t.market_preview.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colors.text.accent,
                ),
              ),
            if (!isMarketPreview &&
                subscription!.accessReason ==
                    SubscriptionAccessReason.promotion)
              Text(
                t.promotion_access.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colors.text.secondary,
                ),
              ),
            if (!isMarketPreview &&
                subscription!.accessReason ==
                    SubscriptionAccessReason.adminGrant)
              Text(
                t.granted_access.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colors.text.secondary,
                ),
              ),
            if (periodEndsAt != null &&
                subscription!.status == SubscriptionStatus.activeRenewing &&
                subscription!.willRenew) ...[
              const SizedBox(height: 2),
              Text(
                t
                    .next_billing(
                        date: DateFormat('dd.MM.yyyy', locale)
                            .format(periodEndsAt))
                    .toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colors.text.secondary,
                ),
              ),
            ],
            if (periodEndsAt != null &&
                subscription!.status == SubscriptionStatus.canceledActive) ...[
              const SizedBox(height: 2),
              Text(
                t
                    .access_until(
                        date: DateFormat('dd.MM.yyyy', locale)
                            .format(periodEndsAt))
                    .toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colors.text.secondary,
                ),
              ),
            ],
            if (!entitlementActive &&
                subscription!.status == SubscriptionStatus.pending) ...[
              const SizedBox(height: 2),
              Text(
                t.pending_confirmation.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colors.text.secondary,
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
