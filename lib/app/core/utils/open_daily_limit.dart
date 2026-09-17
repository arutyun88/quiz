import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

void openDailyLimit(BuildContext context, {String? reviewSourceAttemptId}) {
  final router = GoRouter.of(context);
  if (reviewSourceAttemptId == null) {
    router.goNamed('rating');
    scheduleMicrotask(() => router.pushNamed<void>('daily-limit'));
    return;
  }

  router.pushNamed<void>(
    'daily-limit',
    queryParameters: {'reviewAttemptId': reviewSourceAttemptId},
  );
}
