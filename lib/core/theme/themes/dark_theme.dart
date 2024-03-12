import 'package:architecture/core/theme/core/theme_contracts.dart';
import 'package:flutter/material.dart';

class DarkTheme extends ThemeContracts {
  @override
  ThemeData get theme => ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
          primary: Colors.grey.shade800,
          secondary: Colors.grey.shade900,
          brightness: Brightness.dark,
          background: Colors.black));
}
