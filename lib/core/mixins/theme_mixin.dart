import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

mixin ThemeMixin<T extends StatefulWidget> on State<T> {
  ThemeManager get currentTheme => context.watch<ThemeManager>();
}
