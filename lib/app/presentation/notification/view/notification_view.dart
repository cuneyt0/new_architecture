import 'package:architecture/app/component/no_connection_view.dart';
import 'package:architecture/app/presentation/notification/viewmodel/notification_viewmodel.dart';
import 'package:architecture/app/presentation/notification/widget/_notificationBox.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/view/base_view.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationView extends BaseView<NotificationViewModel> {
  NotificationView({super.key});
  @override
  void dispose() {}

  @override
  void init() {
    viewModel.getAllNotifications();
  }

  @override
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity) {
    return connectivity.hasConnection == false
        ? NoConnectionView()
        : Scaffold(
            appBar: AppBar(
              title: Text("Bildirimler"),
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 18),
            ),
            body: Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Notification box
                      NotificationBox(
                        notificationMessage: "Merhaba bu birinci bildirim ",
                        title: "Notification1",
                      ),
                      NotificationBox(
                        notificationMessage: "Merhaba bu ikinci bildirim ",
                        title: "Notification2",
                      ),
                      NotificationBox(
                        notificationMessage: "Merhaba bu üçüncü bildirim ",
                        title: "Notification3",
                      ),
                      NotificationBox(
                        notificationMessage: "Merhaba bu dördüncü bildirim ",
                        title: "Notification4",
                      ),
                      NotificationBox(
                        notificationMessage: "Merhaba bu beşinci bildirim ",
                        title: "Notification5",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
