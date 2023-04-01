import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:next_poject/main.dart';
import 'package:next_poject/reminder/my_reminder_list.dart';

class NotificationController {
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    await Hive.openBox("reminderBox");
    MyApp.navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => MyReminderList(),
      ),
    );
  }
}