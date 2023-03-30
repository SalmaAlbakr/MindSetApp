import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:next_poject/home/navigation_bar.dart';
import 'dart:math' as math;
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';


class TossResultScreen extends StatefulWidget {
 final List<String> inputList;
  final int index;
  TossResultScreen({required this.index, required this.inputList, Key? key})
      : super(key: key);

  @override
  State<TossResultScreen> createState() => _TossResultScreenState();
}



List<Widget> anotherWidget = [
  CircleAvatar(
    radius: 150,
    backgroundColor: Colors.white,
  ),
  PhysicalShape(
    elevation: 5.0,
    clipper: ShapeBorderClipper(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    color: Colors.white,
    child: const SizedBox(
      height: 300,
      width: 300,
    ),
  ),
  ShapeOfView(
    height: 300,
    width: 300,
    shape: PolygonShape(
        numberOfSides: 9
    ),
    child: Container(
      color: Colors.white,
    ),
  ),
  ShapeOfView(
    height: 300,
    width: 300,
    shape:BubbleShape(
        position: BubblePosition.Bottom,
        arrowPositionPercent: 0.5,
        borderRadius: 20,
        arrowHeight: 10,
        arrowWidth: 10
    ),
    child: Container(
      color: Colors.white,
    ),
  ),
];

class _TossResultScreenState extends State<TossResultScreen> with TickerProviderStateMixin{

  Widget RandomWidget = randomChoice(anotherWidget);
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.deepPurpleAccent[100],
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
                    color: Colors.white,
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
                      child: Container(
                        height: 250,
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    randomChoice(widget.inputList),
                                    maxLines: 5,
                                    style: TextStyle(

                                      color: Colors.deepPurple,
                                      fontSize: 50,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      onPressed: () {
                        widget.inputList.clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavigationScreen(
                              num: 0,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Try New One",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
