import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
//import 'package:animation_wrappers/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:next_poject/toss/result_screen.dart';

class TimerScreen extends StatefulWidget {
  List<String> inputList;
  int index;
  TimerScreen({required this.index, required this.inputList, Key? key})
      : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Widget time = ScaleAnimation(
      duration: Duration(seconds: 1),
      child: Text(
        "3",
        style: TextStyle(
            fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
      ));
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        time = FadedScaleAnimation(
          scaleDuration: Duration(seconds: 1),
          child: Text(
            "2",
            style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        );
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        time = ScaleAnimation(
          duration: Duration(seconds: 1),
          child: Text(
            "1",
            style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        );
      });
    });
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ResultScreen(
                index: widget.index,
                inputList: widget.inputList,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Row(
          children: [
            Image.asset(
              "assets/T-web.gif",
              height: 45,
              width: 45,
            ),
            SizedBox(width: 10),
            Text("Toss"),
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: CircleAvatar(
            child: time,
            backgroundColor: Colors.deepPurple[400],
            radius: 100,
          ),
        ),
      ),
    );
  }
}
