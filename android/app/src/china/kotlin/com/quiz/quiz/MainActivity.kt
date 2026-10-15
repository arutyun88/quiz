package com.quiz.quiz

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            DISTRIBUTION_CHANNEL,
        ).setMethodCallHandler { call, result ->
            if (call.method == "getDistribution") {
                result.success(BuildConfig.APP_DISTRIBUTION)
            } else {
                result.notImplemented()
            }
        }
    }

    private companion object {
        const val DISTRIBUTION_CHANNEL = "com.quiz.quiz/distribution"
    }
}
