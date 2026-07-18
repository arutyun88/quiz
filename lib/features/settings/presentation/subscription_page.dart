import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/widgets/dialog/app_confirm_dialog.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_rows.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class SubscriptionPage extends ConsumerWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings.subscription_page;
    final subscription =
        ref.watch(authenticationProvider).mapOrNull(authenticated: (state) => state.user?.subscription);

    return AppScaffold(
      title: t.title,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SubscriptionCard(subscription: subscription),
            const SizedBox(height: 24),
            SettingsRowGroup(
              children: [
                SettingsLinkRow(label: t.change_plan),
                SettingsLinkRow(label: t.payment_method),
                SettingsLinkRow(label: t.payment_history),
              ],
            ),
            if (kDebugMode && subscription?.active == true) ...[
              const SizedBox(height: 28),
              const Center(child: _CancelButton()),
            ],
          ],
        ),
      ),
    );
  }
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
                (subscription?.active == true ? t.active : t.inactive).toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: subscription?.active == true ? colors.answer.success : colors.text.secondary,
                ),
              ),
            ],
          ),
          if (subscription != null) ...[
            const SizedBox(height: 8),
            Text(
              (subscription!.plan == SubscriptionPlan.yearly ? t.plan_yearly : t.plan_monthly).toUpperCase(),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: colors.text.secondary,
              ),
            ),
            if (renewsAt != null) ...[
              const SizedBox(height: 2),
              Text(
                t.next_billing(date: DateFormat('dd.MM.yyyy', locale).format(renewsAt)).toUpperCase(),
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

/// Debug-only: cancels through the dev endpoint since there is no billing yet.
class _CancelButton extends ConsumerWidget {
  const _CancelButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings.subscription_page;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final confirmed = await showAppConfirmDialog(
          context,
          title: t.cancel_dialog.title,
          message: t.cancel_dialog.message,
          confirmLabel: t.cancel_dialog.confirm,
          cancelLabel: t.cancel_dialog.cancel,
          danger: true,
        );
        if (!confirmed) return;

        final result = await getIt<ApiClient>().delete('/dev/subscription');
        if (result is ResultOk) {
          await ref.read(authenticationProvider.notifier).reload();
          if (context.mounted) context.pop();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          t.cancel.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            color: context.palette.text.danger,
          ),
        ),
      ),
    );
  }
}
