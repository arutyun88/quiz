import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/dialog/app_confirm_dialog.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyHintPanel extends StatelessWidget {
  const DailyHintPanel({
    super.key,
    required this.hintUsed,
    required this.hint,
    required this.obscuredText,
    required this.enabled,
    required this.onUseHint,
    this.subscriptionLocked = false,
    this.onSubscriptionTap,
  });

  final bool hintUsed;
  final String? hint;
  final String obscuredText;
  final bool enabled;
  final Future<void> Function() onUseHint;
  final bool subscriptionLocked;
  final VoidCallback? onSubscriptionTap;

  @override
  Widget build(BuildContext context) {
    final t = context.t.question.hint;
    final colors = context.palette;
    final style = GoogleFonts.spectral(
      fontSize: 15,
      height: 1.35,
      fontStyle: FontStyle.italic,
      color: colors.text.secondary,
    );

    return LayoutBuilder(
      builder: (context, constraints) => Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: constraints.maxWidth * 2 / 3,
          child: Semantics(
            button: !hintUsed,
            enabled: !hintUsed && enabled,
            label: hintUsed
                ? null
                : subscriptionLocked
                    ? t.subscription_title
                    : t.action,
            excludeSemantics: !hintUsed,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: !hintUsed && enabled
                  ? () => subscriptionLocked
                      ? _showSubscriptionDialog(context)
                      : _confirm(context)
                  : null,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: hintUsed
                    ? Text(
                        hint ?? t.unavailable,
                        key: const ValueKey('hint-visible'),
                        textAlign: TextAlign.right,
                        style: style,
                      )
                    : ImageFiltered(
                        key: const ValueKey('hint-obscured'),
                        imageFilter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
                        child: Text(
                          obscuredText,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.right,
                          style: style,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final t = context.t.question.hint;
    final confirmed = await showAppConfirmDialog(
      context,
      title: t.confirm_title,
      message: t.confirm_message,
      confirmLabel: t.confirm_button,
      cancelLabel: t.cancel_button,
    );
    if (confirmed) await onUseHint();
  }

  Future<void> _showSubscriptionDialog(BuildContext context) async {
    final t = context.t.question.hint;
    final hasAction = onSubscriptionTap != null;
    final confirmed = await showAppConfirmDialog(
      context,
      title: t.subscription_title,
      message: t.subscription_required,
      confirmLabel:
          hasAction ? t.subscription_button : t.subscription_acknowledge,
      cancelLabel: hasAction ? t.cancel_button : null,
    );
    if (confirmed) onSubscriptionTap?.call();
  }
}
