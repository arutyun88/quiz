import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/demo/presentation/demo_start_page.dart';
import 'package:quiz/features/demo/presentation/provider/demo_config_provider.dart';

class DemoStartFlow extends ConsumerWidget {
  const DemoStartFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => DemoStartPage(
        config: ref.watch(demoConfigProvider),
      );
}
