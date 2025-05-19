import 'package:flutter/material.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';

class AnswersLoadingWidget extends StatelessWidget {
  const AnswersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: AppWidget.expand()),
                SizedBox(width: 10.0),
                Expanded(child: AppWidget.expand()),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Row(
              children: [
                Expanded(child: AppWidget.expand()),
                const SizedBox(width: 10.0),
                Expanded(child: AppWidget.expand()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
