import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:architecture/core/firebase/analytics/analytics_manager.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/core/mixins/connectivity_mixin.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/mixins/theme_mixin.dart';

abstract class BaseView extends StatefulWidget {
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity);
  void init();
  void dispose();

  const BaseView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView>
    with ThemeMixin, ConnectivityMixin {
  @override
  void initState() {
    debugPrint("Show -- $widget");
    AnalyticsManager.instance.logViewName('$widget');

    if (mounted) {
      widget.init();
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("Close -- $widget");
    if (mounted) {
      widget.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.startView(context, currentTheme, currentConnection);
  }
}
