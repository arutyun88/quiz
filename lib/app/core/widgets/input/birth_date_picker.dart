import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

Future<DateTime?> showBirthDatePicker(
  BuildContext context, {
  DateTime? initial,
}) {
  final colors = context.palette;
  final now = DateTime.now();
  var selected = initial ?? DateTime(now.year - 18, now.month, now.day);

  return showModalBottomSheet<DateTime>(
    context: context,
    backgroundColor: colors.background.static,
    shape: const RoundedRectangleBorder(),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 220,
              child: CupertinoTheme(
                data: CupertinoThemeData(brightness: Theme.of(context).brightness),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selected,
                  maximumDate: now,
                  onDateTimeChanged: (date) => selected = date,
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(selected),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                color: colors.text.primary,
                alignment: Alignment.center,
                child: Text(
                  context.t.birth_date_picker.apply.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    color: colors.background.static,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
