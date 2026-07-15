import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/settings/presentation/provider/notification_settings_provider.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_rows.dart';
import 'package:quiz/gen/strings.g.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings;
    final settings = ref.watch(notificationSettingsProvider);

    String label(NotificationSetting setting) => switch (setting) {
          NotificationSetting.dailyIssue => t.notifications_page.daily_issue,
          NotificationSetting.streakRisk => t.notifications_page.streak_risk,
          NotificationSetting.rankChange => t.notifications_page.rank_change,
          NotificationSetting.promo => t.notifications_page.promo,
        };

    return AppScaffold(
      title: t.notifications,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: SettingsRowGroup(
          children: [
            for (final setting in NotificationSetting.values)
              _ToggleRow(
                label: label(setting),
                value: settings[setting] ?? setting.defaultValue,
                onChanged: (value) => ref.read(notificationSettingsProvider.notifier).toggle(setting, value),
              ),
          ],
        ),
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.spectral(
                  fontSize: 16,
                  color: context.palette.text.primary,
                ),
              ),
            ),
            const SizedBox(width: 12),
            _SquareSwitch(value: value),
          ],
        ),
      ),
    );
  }
}

/// Squared editorial switch: 42×24, ink track when on, no rounding.
class _SquareSwitch extends StatelessWidget {
  const _SquareSwitch({required this.value});

  final bool value;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 42,
      height: 24,
      padding: const EdgeInsets.all(2),
      color: value ? colors.text.primary : colors.background.dynamic,
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 150),
        alignment: value ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
        child: Container(
          width: 20,
          height: 20,
          color: colors.background.static,
        ),
      ),
    );
  }
}
