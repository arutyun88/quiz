import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Expanded(
            flex: 2,
            child: AppWidget(
              child: SizedBox.expand(),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidget(
                          background: Colors.red,
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
                SizedBox(height: 10.0),
                Expanded(
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
                          background: Colors.green,
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
