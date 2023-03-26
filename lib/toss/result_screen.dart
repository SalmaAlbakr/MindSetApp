import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:next_poject/toss/home_screen.dart';
import 'dart:math' as math;
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';


class ResultScreen extends StatefulWidget {
 final List<String> inputList;
  final int index;
  ResultScreen({required this.index, required this.inputList, Key? key})
      : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}



List<Widget> anotherWidget = [
  ScaleAnimation(
    child: CircleAvatar(
      radius: 150,
      backgroundColor: Colors.deepPurpleAccent,
    ),
  ),
  ScaleAnimation(
    child: PhysicalShape(
      elevation: 5.0,
      clipper: ShapeBorderClipper(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      color: Colors.deepPurpleAccent,
      child: const SizedBox(
        height: 200.0,
        width: 200.0,
      ),
    ),
  ),
  ShapeOfView(
    height: 200,
    width: 200,
    shape: TriangleShape(
        percentBottom: 0.5,
        percentLeft: 0,
        percentRight: 0
    ),
    child: Container(
      color: Colors.greenAccent,
    ),
  ),
  ShapeOfView(
    height: 200,
    width: 200,
    shape: StarShape(
        noOfPoints: 5
    ),
    child: Container(
      color: Colors.greenAccent,
    ),
  ),
  ShapeOfView(
    height: 200,
    width: 200,
    shape: PolygonShape(
        numberOfSides: 9
    ),
    child: Container(
      color: Colors.greenAccent,
    ),
  ),
  ShapeOfView(
    height: 200,
    width: 200,
    shape:BubbleShape(
        position: BubblePosition.Bottom,
        arrowPositionPercent: 0.5,
        borderRadius: 20,
        arrowHeight: 10,
        arrowWidth: 10
    ),
    child: Container(
      color: Colors.greenAccent,
    ),
  ),
];

class _ResultScreenState extends State<ResultScreen> with TickerProviderStateMixin{



  Widget RandomWidget = randomChoice(anotherWidget);
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
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    RandomWidget,
                    Center(
                      child: Column(
                        children: [
                          Text(
                            randomChoice(widget.inputList),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 100,
                    //   backgroundColor: Colors.white,
                    //   child: Text(
                    //     randomChoice(widget.inputList),
                    //     style: TextStyle(
                    //       color: Colors.deepPurple,
                    //       fontSize: 25,
                    //     ),
                    //   ),
                    // ),
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
                          RandomWidget = randomChoice(anotherWidget);
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
