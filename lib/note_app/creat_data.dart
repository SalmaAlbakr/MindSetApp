import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:next_poject/note_app/model_class.dart';
import 'package:next_poject/note_app/note_first_screen.dart';
import 'package:next_poject/templets/thems.dart';

class CreateData extends StatefulWidget {
  CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

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
        backgroundColor: Color(0xFFc793ce),
        title: Text("Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              style: TextStyle(fontWeight: FontWeight.bold),
              controller: _nameController,
              decoration: InputDecoration(
                //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  AppColor().MainColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor().MainColor,
                  ),
                ),
                hintText: "title",
                border: OutlineInputBorder(),
              ),
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
                  //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  AppColor().MainColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor().MainColor,
                    ),
                  ),
                  hintText: "note",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
                backgroundColor: Color(0xFF533f6a),
              ),
              onPressed: () {
                final value = ModelClass(
                    name: _nameController.text, age: _ageController.text);
                Hive.box("boxName").add(value);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text("create"),
            ),
          ],
        ),
      ),
    );
  }
}
