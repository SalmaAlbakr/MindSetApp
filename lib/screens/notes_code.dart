import 'package:flutter/material.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes", style: TextStyle(color: Colors.orange)),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.orange, size: 35,),
        onPressed: () {
          showAboutDialog(context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Todo"),
                  content: TextField(
                    decoration: InputDecoration(
                      hintText: "Add ",
                    ),
                  ),
                )
              }
          )
        },
      ),
    ));
  }
}

