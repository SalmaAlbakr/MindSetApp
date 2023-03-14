import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:next_poject/calculator/calculator_screen.dart';
import 'package:next_poject/home/first_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:next_poject/main.dart';
import 'package:next_poject/reminder/notification_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var timer = Timer (Duration(seconds: 4),(){
    MyApp.navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
  });

  @override
  void initState() {
    super.initState();
    // Timer (Duration(seconds: 4),(){
    //   // MyApp.navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => MainPage()));
    //   // Navigator.pushReplacement(
    //   //     context , MaterialPageRoute(builder: (context) => MainPage()));
    // });
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
      body:Center(
          child: Lottie.asset("assets/98050-creativity.json")
      ),
    );
  }
}
