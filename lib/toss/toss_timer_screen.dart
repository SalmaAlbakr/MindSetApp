import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:next_poject/toss/toss_result_screen.dart';

class TossTimerScreen extends StatefulWidget {
 final List<String> inputList;
 final int index;
  TossTimerScreen({required this.index, required this.inputList, Key? key})
      : super(key: key);

  @override
  State<TossTimerScreen> createState() => _TossTimerScreenState();
}

class _TossTimerScreenState extends State<TossTimerScreen> {
  Widget time = ScaleAnimation(
    duration: Duration(seconds: 1),
    child: Text(
      "3",
      style: TextStyle(
        fontSize: 100,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        setState(
          () {
            time = FadedScaleAnimation(
              scaleDuration: Duration(seconds: 1),
              child: Text(
                "2",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        setState(
          () {
            time = ScaleAnimation(
              duration: Duration(seconds: 1),
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        );
      },
    );
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return TossResultScreen(
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
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple[400],
      //   title: Row(
      //     children: [
      //       Image.asset(
      //         "assets/T-web.gif",
      //         height: 45,
      //         width: 45,
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //         "Toss",
      //       ),
      //     ],
      //   ),
      // ),
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
