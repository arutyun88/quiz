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

class SubscriptionPage extends ConsumerWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings.subscription_page;
    final subscription = ref
        .watch(authenticationProvider)
        .mapOrNull(authenticated: (state) => state.user?.subscription);
    final purchases = ref.watch(quizPlusPurchaseProvider);

    return AppScaffold(
      title: t.title,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SubscriptionCard(subscription: subscription),
            const SizedBox(height: 24),
            if (subscription?.active != true) ...[
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
            ],
            _PurchaseStatus(status: purchases.status),
            if (purchases.processing) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
            ],
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

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({required this.subscription});

  final SubscriptionEntity? subscription;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.profile.settings.subscription_page;
    final locale = LocaleSettings.instance.currentLocale.languageCode;
    final renewsAt = subscription?.renewsAt;

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
                (subscription?.active == true ? t.active : t.inactive)
                    .toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: subscription?.active == true
                      ? colors.answer.success
                      : colors.text.secondary,
                ),
              ),
            ],
          ),
          if (subscription != null) ...[
            const SizedBox(height: 8),
            if (subscription!.plan != SubscriptionPlan.unknown)
              Text(
                (subscription!.plan == SubscriptionPlan.yearly
                        ? t.plan_yearly
                        : t.plan_monthly)
                    .toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colors.text.secondary,
                ),
              ),
            if (renewsAt != null) ...[
              const SizedBox(height: 2),
              Text(
                t
                    .next_billing(
                        date: DateFormat('dd.MM.yyyy', locale).format(renewsAt))
                    .toUpperCase(),
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
