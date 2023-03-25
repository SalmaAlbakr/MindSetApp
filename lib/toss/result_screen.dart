import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:next_poject/toss/home_screen.dart';
import 'dart:math' as math;


class ResultScreen extends StatefulWidget {
  List<String> inputList;
  int index;
  ResultScreen({required this.index, required this.inputList, Key? key})
      : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

List<String> ChangeImageList = [
  "assets/By2o.gif",
  "assets/jhkj.gif",
  "assets/load-icon-gif-28.jpg",
  "assets/optical-matter-machine-nanoscale-machines-convert-light-into-work.gif",
];

class _ResultScreenState extends State<ResultScreen> with TickerProviderStateMixin{
  String RandomImage = randomChoice(ChangeImageList);
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Row(
          children: [
            Text(
              "T",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Text(
              "O",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              child: Text(
                "\$",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                      _controller.value * (-math.pi),
                    ),
                  child: child,
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              child: Text(
                "\$",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                      _controller.value * (-math.pi),
                    ),
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(RandomImage),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your Result is :",
                  style: TextStyle(
                    color: Colors.deepPurple[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              ScaleAnimation(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: Text(
                        randomChoice(widget.inputList),
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          randomChoice(widget.inputList);
                          RandomImage = randomChoice(ChangeImageList);
                        });
                      },
                      child: Text(
                        "Another choice",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      onPressed: () {
                        widget.inputList.clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Toss(
                              inputList: widget.inputList,
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Try Again",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
