import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/calculator/calculator_screen.dart';
import 'package:next_poject/ourNote/home_screen.dart';
import 'package:next_poject/reminder/notification_controller.dart';
import 'package:next_poject/reminder/remender_Screen.dart';
import 'package:next_poject/reminder/repeat_or_rememberme_button.dart';
import 'package:next_poject/stop_watch/stop_watch_screen.dart';
import 'package:next_poject/templets/widgets.dart';
import 'package:next_poject/toss/home_screen.dart';

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
      //backgroundColor: Colors.white,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Plz Select an App",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7b19dd),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "provide you with a collection  daily apps in one place ",
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffab7ec1),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                                builder: (context) => CalculatorScreen(),
                              ),
                            );
                          },
                          child: card(
                            backgroundColor: Color(0xffab7ec1),
                            image: "assets/calclogo.jpg",
                            text: "Calculator",
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Hive.openBox("boxName");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: card(
                            backgroundColor: Color(0xffab7ec1),
                            image: 'assets/noteslogo.jpg',
                            text: 'Notes',
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
                                builder: (context) => StopWatch(),
                              ),
                            );
                          },
                          child: card(
                            backgroundColor: Color(0xffab7ec1),
                            image: 'assets/img.png',
                            text: 'StopWatch',
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
                                builder: (context) => Toss(
                                  inputList: [],
                                  index: 0,
                                ),
                              ),
                            );
                          },
                          child: card(
                            backgroundColor: Color(0xffab7ec1),
                            image: 'assets/toss22.PNG',
                            text: 'Toss',
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Hive.openBox("reminderBox");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReminderFirstPage(),
                              ),
                            );
                          },
                          child: card(
                            backgroundColor: Color(0xffab7ec1),
                            image: 'assets/rem22.PNG',
                            text: 'Reminder',
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
