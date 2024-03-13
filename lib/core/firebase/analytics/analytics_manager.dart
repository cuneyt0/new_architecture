import 'dart:developer';

import 'package:architecture/core/firebase/crashlytics/crashlytics_manager.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class AnalyticsManager {
  static AnalyticsManager? _instance;
  final CrashlyticsManager _crashlyticsManager = CrashlyticsManager.instance;

  static AnalyticsManager get instance {
    return _instance ??= AnalyticsManager._init();
  }

  AnalyticsManager._init();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// send a custom log
  Future<void> sendALog({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      if (kReleaseMode) {
        await _analytics.logEvent(name: name, parameters: parameters);
      } else if (kDebugMode) {
        log('________________________________ANALYTICS________________________________');
        log(name);
        log('____________________________________________________________________');
      }
    } catch (e) {
      await _crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: '$name log caused an error, or internet connection issue');
    }
  }

  /// Log current view
  Future<void> logViewName(String screenName) async {
    try {
      await _analytics.logScreenView(screenName: screenName).onError(
            (error, stackTrace) =>
                throw Exception('Error: $error. View: $screenName'),
          );
    } catch (e) {
      await _crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error setScreenLog',
      );
    }
  }

  /// Log app open
  Future<void> logAppOpen() async {
    try {
      if (kReleaseMode) {
        log('________________________________ANALYTICS________________________________');

        await _analytics.logAppOpen();
      }
    } catch (e) {
      await _crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error logAppOpen',
      );
    }
  }

  //log search
  Future<void> logSearch(
    String searchTerm,
  ) async {
    try {
      if (kReleaseMode) {
        log('________________________________ANALYTICS________________________________');
        await _analytics.logSearch(searchTerm: searchTerm);
      }
    } catch (e) {
      await _crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error logAppOpen',
      );
    }
  }
}
