import 'package:flutter/material.dart';

Future<dynamic> showAppBottomSheet(
  BuildContext context, {
  required Widget child,
}) async {
  return await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10.0),
      ),
    ),
    useRootNavigator: true,
    context: context,
    builder: (context) => SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24.0),
            child,
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    ),
  );
}
