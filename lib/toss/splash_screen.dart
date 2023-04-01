import 'dart:async';
import 'dart:math' as math;
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:next_poject/toss/toss_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget latterT = ScaleAnimation(child: Image.asset("assets/img_14.png"));
  Widget latterO = Text("");
  Widget latterS = Text("");
  Widget lastS = Text("");

  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        setState(
          () {
            latterT = ScaleAnimation(
                duration: Duration(seconds: 1),
                child: Image.asset("assets/download.png"));
          },
        );
      },
    );
    // Timer(
    //   const Duration(seconds: 1),
    //   () {
    //     setState(
    //       () {
    //         latterO = ScaleAnimation(
    //           duration: Duration(seconds: 1),
    //           child: Text(
    //             "O",
    //             style: TextStyle(
    //               fontSize: 100,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white,
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
    // Timer(
    //   const Duration(seconds: 1),
    //   () {
    //     setState(
    //       () {
    //         latterS = ScaleAnimation(
    //           duration: Duration(seconds: 1),
    //           child: AnimatedBuilder(
    //             animation: _controller,
    //             child: Text(
    //               "\$",
    //               style: TextStyle(
    //                 fontSize: 100,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white,
    //               ),
    //             ),
    //             builder: (BuildContext context, Widget? child) {
    //               return Transform(
    //                 alignment: Alignment.center,
    //                 transform: Matrix4.identity()
    //                   ..setEntry(3, 2, 0.001)
    //                   ..rotateY(
    //                     _controller.value * (-math.pi),
    //                   ),
    //                 child: child,
    //               );
    //             },
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
    // Timer(
    //   const Duration(seconds: 3),
    //   () {
    //     setState(
    //       () {
    //         lastS = ScaleAnimation(
    //           duration: Duration(seconds: 1),
    //           child: AnimatedBuilder(
    //             animation: _controller,
    //             child: Text(
    //               "\$",
    //               style: TextStyle(
    //                 fontSize: 100,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white,
    //               ),
    //             ),
    //             builder: (BuildContext context, Widget? child) {
    //               return Transform(
    //                 alignment: Alignment.center,
    //                 transform: Matrix4.identity()
    //                   ..setEntry(3, 2, 0.001)
    //                   ..rotateY(
    //                     _controller.value * (-math.pi),
    //                   ),
    //                 child: child,
    //               );
    //             },
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
    // Timer(
    //   Duration(seconds: 5),
    //   () {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(
    //         builder: (BuildContext context) {
    //           return TossHomeScreen(
    //             inputList: [],
    //             index: 0,
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }
// هنحرك كل حرف لوحده
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "M I N D S E T",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(height: 300, width: 300, child: latterT),
                // latterO,
                // latterS,
                // lastS,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
