import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:next_poject/ourNote/home_screen.dart';
import 'package:next_poject/ourNote/model_class.dart';

class EditData extends StatefulWidget {
  int index;
  String name;
  EditData({required this.name,required this.index, Key? key}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();


  @override
  void initState() {
    final element = Hive.box("boxName").getAt(widget.index) as ModelClass;
    _nameController.text = element.name;
    _ageController.text = element.age.toString();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "title", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: TextFormField(
                maxLines: 9999,
                controller: _ageController,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
                decoration: InputDecoration(
                    labelText: "note", border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            ElevatedButton(
                onPressed: () {
                  final value = ModelClass(
                      name: _nameController.text,
                      age: _ageController.text,
                      );
                  Hive.box("boxName").putAt(widget.index, value);
                  print("done data");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text("Done"))
          ],
        ),
      ),
    );
  }
}
