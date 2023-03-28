import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/home/first_screen.dart';
import 'package:next_poject/home/navigation_bar.dart';
import 'package:next_poject/home/splash_screen.dart';
import 'package:next_poject/note_app/model_class.dart';
import 'package:next_poject/reminder/reminder_model_class.dart';
import 'package:next_poject/toss/result_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  AwesomeNotifications().initialize(
    "",
    [
      NotificationChannel(
          channelKey: 'reminder key',
          channelName: 'reminder name',
          channelDescription: 'description'),
    ],
  );

  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ModelClassAdapter());
  Hive.registerAdapter(ReminderModelClassAdapter());
  runApp(
    RootRestorationScope(
      restorationId: 'not',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepPurple
        ),
      navigatorKey: MyApp.navigatorKey,
      home: MainPage()
    );
  }
}
