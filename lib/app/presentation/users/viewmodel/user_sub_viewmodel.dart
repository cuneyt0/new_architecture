import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SubUserViewModel extends BaseViewModel {
  String name = "";

  SubUserViewModel() {
    updateName();
  }

  void updateName() {
    name = "Duzey";
  }
}
