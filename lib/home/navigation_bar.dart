import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:MindSet/calculator/calculator_screen.dart';
import 'package:MindSet/note_app/note_first_screen.dart';
import 'package:MindSet/reminder/reminder_first_screen.dart';
import 'package:MindSet/stop_watch/stop_watch_screen.dart';
import 'package:MindSet/toss/toss_home_screen.dart';

class NavigationScreen extends StatefulWidget {
   int num = 0;
  NavigationScreen({Key? key, required this.num}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List screen = [
    TossHomeScreen(
      inputList:  [],
      index: 0,
    ),
    const StopWatchScreen(),
    const NoteHomeScreen(),
    const ReminderFirstPage(),
    const CalculatorScreen()
  ];

  //int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBar(
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
            icon: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/img_11.png"),
            ),
            activeIcon: const Icon(Icons.flip_camera_android_outlined),
            label: "Toss",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/img_9.png"),
            ),
            activeIcon: const Icon(Icons.watch_later_outlined),
            label: "Stopwatch",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/img_7.png"),
            ),
            activeIcon: const Icon(Icons.note_alt_outlined),
            label: "note",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/img_12.png"),
            ),
            activeIcon: const Icon(Icons.notification_add_outlined),
            label: "reminder",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/img_8.png"),
            ),
            activeIcon: const Icon(Icons.calculate_outlined),
            label: "calculator",
          ),
        ],
      ),
      body: screen[widget.num],
    );
  }
}
