import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/home/main_widget/main_widget.dart';
import 'package:next_poject/home/navigation_bar.dart';
import 'package:next_poject/reminder/notification_controller.dart';

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
      backgroundColor: const Color(0XFFFDFDFD),
      appBar: AppBar(
        backgroundColor: const Color(0xffab7ec1),
        elevation: 0.0,
        title: const Text(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "provide you with a collection  daily apps in one place.. ",
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButoon(
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
                    imageName: 'assets/img_8.png',
                    appName: 'Calculator',
                  ),
                  MainButoon(
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
                    imageName: "assets/img_7.png",
                    appName: "Notes",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainButoon(
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
                    imageName: "assets/img_9.png",
                    appName: "StopWatch",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButoon(
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
                    imageName: "assets/img_11.png",
                    appName: "Toss",
                  ),
                  MainButoon(
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
                    imageName: "assets/img_12.png",
                    appName: "Reminder",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


