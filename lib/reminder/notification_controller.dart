import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:next_poject/main.dart';
import 'package:next_poject/reminder/my_reminder_list.dart';

class NotificationController {
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    MyApp.navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => MyReminderList(),
      ),
    );
  }
}

// // to generate unic id by code
// int createUniqueId() {
//   return DateTime.now().millisecondsSinceEpoch.remainder(100000);
// }
