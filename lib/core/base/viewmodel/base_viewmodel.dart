import 'package:flutter/foundation.dart';

abstract class BaseViewModelProtocol extends ChangeNotifier {
  void notify();
}

class BaseViewModel extends BaseViewModelProtocol {
  @override
  void notify() {
    notifyListeners();
  }
}
