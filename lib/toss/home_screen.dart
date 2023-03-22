import 'package:flutter/material.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:next_poject/toss/TimerScreen.dart';
import 'package:next_poject/toss/backgoundImage.dart';

class Toss extends StatefulWidget {
  List<String> inputList = [""];
  int index = 0;
  String selectedImage = "assets/Butterfly-PNG-3.png";
  Toss({
    Key? key,
    required this.inputList,
    required this.index,
    required this.selectedImage,
  }) : super(key: key);

  @override
  State<Toss> createState() => _TossState();
}

class _TossState extends State<Toss> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Row(
          children: [
            Image.asset(
              "assets/T-web.gif",
              height: 45,
              width: 45,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Toss",
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BackgroundImage(),
                    ),
                  );
                },
                child: Text("change Background"))
          ],
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hello, Let's Get Started",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 400,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        scale: 10,
                        image: AssetImage(
                          widget.selectedImage,
                        ),
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.inputList.length,
                      itemBuilder: (context, index) {
                        return ScaleAnimation(
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.inputList[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          widget.inputList.removeAt(index);
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Enter your Options here",
                    ),
                    controller: controller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          widget.inputList.add(controller.text);
                          controller.clear();
                        },
                      );
                    },
                    child: Text(
                      "add",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (widget.inputList.isEmpty) {
                            Fluttertoast.showToast(
                              msg: "plz enter an options",
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerScreen(
                                  index: widget.index,
                                  inputList: widget.inputList,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                    child: Text(
                      "Random",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
