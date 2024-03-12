import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';
import 'theme_contracts.dart';

enum ThemeType { light, dark }

class ThemeManager extends ChangeNotifier {
  GetStorage box = GetStorage();

  ThemeType _themeType = ThemeType.light;
  late ThemeContracts _currentTheme;

  ThemeManager() {
    loadTheme();
  }

  /// Load current theme.
  void loadTheme() {
    var themeName = box.read<String>("theme");
    if (themeName != null) {
      var themeType = ThemeType.values.firstWhere(
          (element) => element.name == themeName,
          orElse: (() => ThemeType.light));
      _switchTheme(to: themeType);
    } else {
      _currentTheme = LightTheme();
    }
  }

  Future<void> changeTheme({required ThemeType to}) async {
    await box.write("theme", to.name);
    _switchTheme(to: to);
  }

  /// You can get current Theme.
  ThemeType get themeType => _themeType;

  /// You can get current Theme Type.
  ThemeContracts get current => _currentTheme;

  // This method will change current theme after calling changeTheme function.
  void _switchTheme({required ThemeType to}) {
    _themeType = to;
    switch (to) {
      case ThemeType.light:
        _currentTheme = LightTheme();
        break;
      case ThemeType.dark:
        _currentTheme = DarkTheme();
        break;
    }
    notifyListeners();
  }
}
