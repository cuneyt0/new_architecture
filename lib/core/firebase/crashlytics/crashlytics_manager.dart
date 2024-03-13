import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsManager {
  static CrashlyticsManager? _instance;

  static CrashlyticsManager get instance {
    return _instance ??= CrashlyticsManager._init();
  }

  CrashlyticsManager._init();

  Future<void> sendACrash({
    required dynamic error,
    String? statusCode,
    required StackTrace stackTrace,
    required String reason,
    bool isFatal = true,
  }) async {
    if (kReleaseMode) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: reason,
        fatal: isFatal,
      );
    } else {
      log('________________________________ERROR________________________________');
      log("DEBUG: ${error.toString()}");
      log('____________________________________________________________________');
    }
  }
}
