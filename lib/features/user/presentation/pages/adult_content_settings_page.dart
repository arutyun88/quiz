import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/widgets/dialog/app_confirm_dialog.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';
import 'package:quiz/features/user/presentation/provider/age_access_provider.dart';
import 'package:quiz/gen/strings.g.dart';

enum AdultContentViewStatus {
  loading,
  enabled,
  eligible,
  unavailable,
  blocked,
  failed,
}

AdultContentViewStatus adultContentViewStatus(AgeAccessState state) {
  if (!state.isFresh) {
    return state.failure == null
        ? AdultContentViewStatus.loading
        : AdultContentViewStatus.failed;
  }
  final status = state.status;
  if (status == null) return AdultContentViewStatus.failed;
  if (status.storeAgeSignal == StoreAgeSignal.minor ||
      status.storeAgeSignal == StoreAgeSignal.restricted ||
      status.adultAccessOverride == AdultAccessOverride.deny ||
      status.adultAccessOverride == AdultAccessOverride.unknown) {
    return AdultContentViewStatus.blocked;
  }
  if (status.adultContentEnabled) return AdultContentViewStatus.enabled;
  if (status.adultEligible) return AdultContentViewStatus.eligible;
  return AdultContentViewStatus.unavailable;
}

class AdultContentSettingsPage extends ConsumerWidget {
  const AdultContentSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copy = context.t.profile.settings.adult_content;
    final state = ref.watch(ageAccessProvider);
    final viewStatus = adultContentViewStatus(state);

    return AppScaffold(
      title: copy.title,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 28, 22, 32),
        child: switch (viewStatus) {
          AdultContentViewStatus.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          AdultContentViewStatus.failed => _StatusBody(
              icon: Icons.sync_problem,
              title: copy.unavailable_title,
              body: copy.unavailable_body,
              buttonLabel: copy.retry,
              onPressed: ref.read(ageAccessProvider.notifier).refresh,
            ),
          AdultContentViewStatus.blocked => _StatusBody(
              icon: Icons.block,
              title: copy.blocked_title,
              body: copy.blocked_body,
            ),
          AdultContentViewStatus.unavailable => _StatusBody(
              icon: Icons.shield_outlined,
              title: copy.unavailable_title,
              body: copy.unavailable_body,
            ),
          AdultContentViewStatus.enabled => _StatusBody(
              icon: Icons.check_circle_outline,
              title: copy.enabled_title,
              body: copy.enabled_body,
              buttonLabel: copy.revoke,
              danger: true,
              onPressed: () => _revoke(
                context,
                ref,
                title: copy.revoke_dialog_title,
                body: copy.revoke_dialog_body,
                confirmLabel: copy.revoke,
                cancelLabel: copy.cancel,
              ),
            ),
          AdultContentViewStatus.eligible => _StatusBody(
              icon: Icons.warning_amber_outlined,
              title: copy.eligible_title,
              body: copy.eligible_body,
              buttonLabel: copy.confirm,
              onPressed: () => _confirm(
                context,
                ref,
                title: copy.confirm_dialog_title,
                body: copy.confirm_dialog_body,
                confirmLabel: copy.confirm,
                cancelLabel: copy.cancel,
              ),
            ),
        },
      ),
    );
  }

  Future<void> _confirm(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String body,
    required String confirmLabel,
    required String cancelLabel,
  }) async {
    final confirmed = await showAppConfirmDialog(
      context,
      title: title,
      message: body,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
    );
    if (confirmed) await ref.read(ageAccessProvider.notifier).confirm();
  }

  Future<void> _revoke(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String body,
    required String confirmLabel,
    required String cancelLabel,
  }) async {
    final confirmed = await showAppConfirmDialog(
      context,
      title: title,
      message: body,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      danger: true,
    );
    if (confirmed) await ref.read(ageAccessProvider.notifier).revoke();
  }
}

class _StatusBody extends StatelessWidget {
  const _StatusBody({
    required this.icon,
    required this.title,
    required this.body,
    this.buttonLabel,
    this.onPressed,
    this.danger = false,
  });

  final IconData icon;
  final String title;
  final String body;
  final String? buttonLabel;
  final Future<void> Function()? onPressed;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(icon, size: 42, color: colors.text.accent),
        const SizedBox(height: 22),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.unbounded(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: colors.text.primary,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          body,
          textAlign: TextAlign.center,
          style: GoogleFonts.spectral(
            fontSize: 16,
            height: 1.5,
            color: colors.text.secondary,
          ),
        ),
        const Spacer(),
        if (buttonLabel != null && onPressed != null)
          AppButtonV2(
            label: buttonLabel!,
            backgroundColor: danger ? colors.text.danger : null,
            onTap: (complete) async {
              await onPressed!();
              complete();
            },
          ),
      ],
    );
  }
}
