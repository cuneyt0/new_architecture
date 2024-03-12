import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

mixin ConnectivityMixin<T extends StatefulWidget> on State<T> {
  ConnectivityController get currentConnection =>
      context.watch<ConnectivityController>();
}
