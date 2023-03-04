import 'dart:async';
import 'package:flutter/material.dart';


class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  bool isVisible = true;
  bool isNotVisible = false;
  bool startIsPressed = true;
  bool stopIsPressed = true;
  bool resetIsPressed = true;
  String time = "00:00:00";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);

  void startTimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
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

  void startwatch() {
    setState(() {
      isVisible = !isVisible;
      isNotVisible = !isNotVisible;
      stopIsPressed = false;
      startIsPressed = false;
    });
    swatch.start();
    startTimer();
  }

  void stopwatch() {
    setState(() {
      stopIsPressed = true;
      resetIsPressed = false;
      isVisible = !isVisible;
      isNotVisible = !isNotVisible;
    });
    swatch.stop();
  }

  void resetwatch() {
    setState(() {
      startIsPressed = true;
      resetIsPressed = true;
    });
    swatch.reset();
    time = "00:00:00";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stop Watch"),
      ),
      //backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
              child: Image.asset(
            "assets/stop.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
          )),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 50, right: 50, top: 50),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    )),
                child: Text(
                  time,
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: isVisible,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: InkWell(
                      onTap: startIsPressed ? startwatch : null,
                      child: Container(
                        height: 40,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            border: Border.all(color: Colors.blueAccent)),
                        child: Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isNotVisible,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: InkWell(
                      onTap: stopIsPressed ? null : stopwatch,
                      child: Container(
                        height: 40,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
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
                    ),
                  ),
                  InkWell(
                    onTap: resetIsPressed ? null : resetwatch,
                    child: Container(
                      height: 40,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
