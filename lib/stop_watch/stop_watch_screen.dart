import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class StopWatchScreen extends StatefulWidget {
  @override
  _StopWatchScreenState createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  bool isVisible = true;
  String time = "00:00:00";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);
  String StartButton = "Start";

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    setState(() {
      time = swatch.elapsed.inHours.toString().padLeft(2, '0') +
          ":" +
          (swatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
          ":" +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
    });
  }

  void startWatch() {
    setState(
      () {
        isVisible = !isVisible;
      },
    );
    swatch.start();
    startTimer();
  }

  void stopwatch() {
    setState(
      () {
        isVisible = !isVisible;
      },
    );
    swatch.stop();
    StartButton = "Restart";
  }

  void resetWatch() {
    setState(
      () {},
    );
    swatch.reset();
    time = "00:00:00";
    StartButton = "Start";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Stop Watch",
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          ShapeOfView(
            height: 300,
            width: 300,
            shape: PolygonShape(numberOfSides: 9),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.deepPurple[900],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              isVisible
                  ? ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple),
                      ),
                      onPressed: startWatch,
                      child: Text(
                        StartButton,
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple),
                      ),
                      onPressed: stopwatch,
                      child: Text(
                        "Stop",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
              InkWell(
                onTap: resetWatch,
                child: Container(
                  height: 40,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
