import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
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
    setState(() {},);
    swatch.reset();
    time = "00:00:00";
    StartButton = "Start";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          ShapeOfView(
            height: 300,
            width: 300,
            shape: PolygonShape(
                numberOfSides: 9
            ),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   height: MediaQuery.of(context).size.height / 2,
          //   width: MediaQuery.of(context).size.width,
          //   margin: EdgeInsets.only(left: 50, right: 50, top: 50),
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.transparent,
          //     border: Border.all(
          //       width: 4,
          //       color: Colors.black,
          //     ),
          //   ),
          //   child: Text(
          //     time,
          //     style: TextStyle(
          //       fontSize: 50,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              isVisible?
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:  MaterialStatePropertyAll(Colors.deepPurple),
                ),
                onPressed: startWatch, child: Text(
                StartButton,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),)
                  :
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:  MaterialStatePropertyAll(Colors.deepPurple),
                ),
                onPressed: stopwatch, child: Text(
                "Stop",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),),
              // InkWell(
              //   onTap: stopwatch,
              //   child: Container(
              //     height: 40,
              //     width: 80,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: Colors.deepPurple,
              //     ),
              //     child: Text(
              //       "Stop",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontStyle: FontStyle.italic,
              //         fontSize: 25,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: resetWatch,
                child: Container(
                  height: 40,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border.all(
                      color: Colors.blue,
                    ),
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
