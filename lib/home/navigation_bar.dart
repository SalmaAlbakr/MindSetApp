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
    ReminderFirstPage(),
    HomeScreen(),
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
        unselectedItemColor: Colors.purple[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Toss",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Stopwatch",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "note",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_rounded),
            label: "reminder",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "calculator",
          ),
        ],
      ),
      body: screen[widget.num],
    );
  }
}
