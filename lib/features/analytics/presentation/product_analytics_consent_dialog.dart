import 'package:flutter/material.dart';
import 'package:quiz/app/core/widgets/dialog/app_confirm_dialog.dart';
import 'package:quiz/gen/strings.g.dart';

Future<bool> showProductAnalyticsConsentDialog(BuildContext context) {
  final copy = context.t.profile.settings.product_analytics;
  return showAppConfirmDialog(
    context,
    title: copy.dialog_title,
    message: copy.description,
    confirmLabel: copy.confirm,
    cancelLabel: copy.cancel,
  );
}
