import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/navigation/router_notifier.dart';

final routerProvider = AsyncNotifierProvider<RouterNotifier, GoRouter>(RouterNotifier.new);
