import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:next_poject/calculator/calculator_screen.dart';
import 'package:next_poject/note_app/note_first_screen.dart';
import 'package:next_poject/reminder/repeat_or_rememberme_button.dart';
import 'package:next_poject/stop_watch/stop_watch_screen.dart';
import 'package:next_poject/toss/home_screen.dart';


class NavigationScreen extends StatefulWidget {
  int num = 0;
  NavigationScreen({Key? key , required this.num}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List screen = [
    Toss(inputList: [], index: 0,),
    StopWatch(),
    HomeScreen(),
    ReminderFirstPage(),
    CalculatorScreen()
  ];

  //int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.num,
        onTap: (index) async {
          await Hive.openBox("reminderBox");
          await Hive.openBox("boxName");
          setState(() {
            widget.num = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/img_11.png")),
            activeIcon: Icon(Icons.flip_camera_android_outlined),
            label: "Toss",
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/img_9.png")),
            activeIcon: Icon(Icons.watch_later_outlined),
            label: "Stopwatch",
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/img_7.png")),
            activeIcon:  Icon(Icons.note_alt_outlined),
            label: "note",
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/img_12.png")),
            activeIcon: Icon(Icons.notification_add_outlined),
            label: "reminder",
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/img_8.png")),
            activeIcon: Icon(Icons.calculate_outlined),
            label: "calculator",
          ),
        ],
      ),
      body: screen[widget.num],
    );
  }
}
