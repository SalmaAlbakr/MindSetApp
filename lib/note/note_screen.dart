import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List todos = [];
  String input = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0.0,
        title: Text(
          "Notes",
          style: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
       // centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text("Add To Do List"),
                content: TextField(
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todos.add(input);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Add ",
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Icon(
          size: 40,
          Icons.note_alt_outlined,
          color: Colors.yellow,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
