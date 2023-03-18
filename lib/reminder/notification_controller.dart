import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:next_poject/calculator/calculator_screen.dart';
import 'package:next_poject/main.dart';

class NotificationController{

  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here


    print("we find the cooooooood");

    MyApp.navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => CalculatorScreen()));

  }

}

// // to generate unic id by code
// int createUniqueId() {
//   return DateTime.now().millisecondsSinceEpoch.remainder(100000);
// }