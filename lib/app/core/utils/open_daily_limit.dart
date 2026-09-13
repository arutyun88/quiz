import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

void openDailyLimit(BuildContext context, {String? reviewSourceAttemptId}) {
  GoRouter.of(context).pushNamed<void>(
    'daily-limit',
    queryParameters: {
      if (reviewSourceAttemptId != null) 'reviewAttemptId': reviewSourceAttemptId,
    },
  );
}
