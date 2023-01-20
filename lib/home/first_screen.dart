import 'package:flutter/material.dart';
import 'package:next_poject/calculator/calculator_screen.dart';
import 'package:next_poject/note/note_screen.dart';
import 'package:next_poject/remender/remender_Screen.dart';
import 'package:next_poject/stop_watch/stop_watch_screen.dart';
import 'package:next_poject/toss/home_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text(
          "MindSet",
          style: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Plz Select an App",style: TextStyle(
                      fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("provide you with a collection  daily apps in one place   ",style: TextStyle(
                      fontSize: 20, color: Colors.blueAccent),),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context) => CalculatorScreen() ));},
                          child: Card(
                            color: Colors.lightGreen,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/dollar.gif"),
                                  radius: 30,
                                ),
                                SizedBox(height: 20,),
                                Text("Calculator",style: TextStyle(
                                    fontSize: 20, color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context) => Notes() ));},
                          child: Card(
                            color: Colors.pinkAccent,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/dollar.gif"),
                                ),
                                SizedBox(height: 20,),
                                Text("Notes",style: TextStyle(
                                    fontSize: 20, color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context) => StopWatch() ));},
                          child: Card(
                            color: Colors.limeAccent,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/img.png"),
                                ),
                                SizedBox(height: 20,),
                                Text("Stop Watch",style: TextStyle(
                                    fontSize: 20, color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context) => Toss(inputList: [],index: 0,)));},
                          child: Card(
                            color: Colors.cyan,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/dollar.gif"),
                                ),
                                SizedBox(height: 20,),
                                Text("Toss",style: TextStyle(
                                    fontSize: 20, color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context) => Reminder() ));},
                          child: Card(
                            color: Colors.deepPurpleAccent,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/reminder.png"),
                                ),
                                SizedBox(height: 20,),
                                Text("Reminder",style: TextStyle(
                                    fontSize: 20, color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ],
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
