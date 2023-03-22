import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/home/first_screen.dart';
import 'package:next_poject/note_app/model_class.dart';
import 'package:next_poject/reminder/reminder_model_class.dart';
import 'package:path_provider/path_provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {

  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  //
  // Hive.registerAdapter(NoteModelsAdapter());
  // await Hive.openBox<NoteModels>('keepNote');

  AwesomeNotifications().initialize(
      "", [
    NotificationChannel(
        channelKey: 'reminder key',
        channelName: 'reminder name',
        channelDescription: 'description'),
  ],
    // channelGroups: [
    //   NotificationChannelGroup(channelGroupKey: "channelGroupKey", channelGroupName: "channelGroupName"),
    //   // NotificationChannelGroup(
    //   //     channelGroupkey: 'basic_channel_group',
    //   //     channelGroupName: 'Basic group'),
    // ],
  );


  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ModelClassAdapter());
  Hive.registerAdapter(ReminderModelClassAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   AwesomeNotifications().setListeners(
  //       onActionReceivedMethod: NotificationController.onActionReceivedMethod);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        navigatorKey: MyApp.navigatorKey,
        home: MainPage(
    ));
  }
}
