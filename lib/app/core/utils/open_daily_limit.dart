import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

void openDailyLimit(BuildContext context) {
  final router = GoRouter.of(context);
  router.goNamed('rating');
  scheduleMicrotask(() {
    router.pushNamed<void>('daily-limit');
  });
}
