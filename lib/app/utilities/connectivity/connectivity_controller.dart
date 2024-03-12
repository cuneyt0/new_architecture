import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController extends ChangeNotifier {
  late final Connectivity connectivity;
  ConnectivityController() {
    connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        triggerConnection(false);
      } else {
        triggerConnection(true);
      }
    });
    notifyListeners();
  }

  bool? hasConnection = true;

  void triggerConnection(bool value) {
    if (value == hasConnection) return;
    hasConnection = value;
    log('hasConnection $hasConnection');
    notifyListeners();
  }

  Future<bool> checkConnection() async {
    try {
      final ConnectivityResult result = await connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> firstCheck() async {
    final value = await checkConnection();
    hasConnection = value;
  }

  Stream<ConnectivityResult>? connectivityStream;
  Stream<ConnectivityResult> get getConnectivityStream {
    return connectivity.onConnectivityChanged;
  }
}
