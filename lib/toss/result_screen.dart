import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:next_poject/toss/home_screen.dart';

class ResultScreen extends StatefulWidget {
  List<String> inputList;
  int index;
  ResultScreen({required this.index, required this.inputList, Key? key})
      : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

List<String> ChangeImageList = [
  "images/By2o.gif",
  "images/jhkj.gif",
  "images/load-icon-gif-28.jpg",
  "images/optical-matter-machine-nanoscale-machines-convert-light-into-work.gif",
];

class _ResultScreenState extends State<ResultScreen> {
  String RandomImage = randomChoice(ChangeImageList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Row(
          children: [
            Image.asset(
              "images/T-web.gif",
              height: 45,
              width: 45,
            ),
            SizedBox(width: 10),
            Text("Toss"),
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
                      fontSize: 30),
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
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 25),
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
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 20),
                      ),
                    ),
                    //SizedBox(width: 25,),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        widget.inputList.clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                              inputList: widget.inputList,
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Try Again",
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 20),
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
