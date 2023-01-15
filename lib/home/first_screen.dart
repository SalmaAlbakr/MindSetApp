import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFC5C5),
      appBar: AppBar(
        backgroundColor: Color(0xffF05151),
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
          child: Container(
            height: 100,
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Plz Select an App",style: TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("provide you with a collection  daily apps in one place   ",style: TextStyle(
                        fontSize: 10, color: Colors.white),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset("assets/dollar.gif"),
                          ),
                          SizedBox(height: 10,),
                          Text("Calculator",style: TextStyle(
                              fontSize: 20, color: Colors.black))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),

          ),
        ),
      ),

    );
  }
}
