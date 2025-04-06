import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Consumer(
          builder: (context, ref, child) {
            final name = ref.read(authenticationProvider).whenOrNull(authenticated: (user) => user?.name);
            return AppBar(
              centerTitle: false,
              title: name != null ? Text(name) : null,
            );
          },
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: AppWidget(
              child: SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidget(
                          child: SizedBox.expand(),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: AppWidget(
                          child: SizedBox.expand(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidget(
                          background: context.palette.answer.success,
                          child: const SizedBox.expand(),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      const Expanded(
                        child: AppWidget(
                          child: SizedBox.expand(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
