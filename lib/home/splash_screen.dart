import 'dart:async';
import 'package:flutter/material.dart';
import 'package:next_poject/home/first_screen.dart';
import 'package:next_poject/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var timer = Timer(
    const Duration(seconds: 4),
    () {
      MyApp.navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (_) => const MainPage(),
        ),
      );
    },
  );

  @override
  void initState() {
    super.initState();
    timer;
  }

  @override
  void dispose() {
    timer;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/textSplash3.gif"),
            const SizedBox(height: 50,),
            Image.asset("assets/download.png"),
          ],
        ),
      ),
    );
  }
}
