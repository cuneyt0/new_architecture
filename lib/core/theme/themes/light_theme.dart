import 'package:architecture/core/theme/core/theme_contracts.dart';
import 'package:flutter/material.dart';

class LightTheme extends ThemeContracts {
  @override
  ThemeData get theme => ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
/**        primary: Colors.grey.shade300,
 *          secondary: Colors.grey.shade600,
*/
          brightness: Brightness.light,
          background: Colors.white));
}
