import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/calculator/calculator_screen.dart';
import 'package:next_poject/home/navigation_bar.dart';
import 'package:next_poject/note_app/note_first_screen.dart';
import 'package:next_poject/reminder/notification_controller.dart';
import 'package:next_poject/reminder/reminder_first_screen.dart';
import 'package:next_poject/stop_watch/stop_watch_screen.dart';
import 'package:next_poject/templets/widgets.dart';
import 'package:next_poject/toss/toss_home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Color(0xffab7ec1),
        elevation: 0.0,
        title: Text(
          "MindSet",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "provide you with a collection  daily apps in one place.. ",
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(
                                  num: 4,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset("assets/img_8.png")),
                              Text(
                                "Calculator",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Color(0xff5C2681),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Hive.openBox("boxName");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(
                                  num: 2,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset("assets/img_7.png"),),
                              Text(
                                "Notes",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Color(0xff5C2681),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(
                                  num: 1,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset("assets/img_9.png")),
                              Text(
                                "StopWatch",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Color(0xff5C2681),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(
                                  num: 0,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset("assets/img_11.png")),
                              Text(
                                "Toss",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Color(0xff5C2681),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Hive.openBox("reminderBox");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(
                                  num: 3,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset("assets/img_12.png")),
                              Text(
                                "Reminder",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Color(0xff5C2681),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
