import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:next_poject/note_app/model_class.dart';
import 'package:next_poject/note_app/note_first_screen.dart';
import 'package:next_poject/templets/thems.dart';

class NoteCreateData extends StatefulWidget {
  NoteCreateData({Key? key}) : super(key: key);

  @override
  State<NoteCreateData> createState() => _NoteCreateDataState();
}

class _NoteCreateDataState extends State<NoteCreateData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return '';}
                  return null;
                },
                style: TextStyle(fontWeight: FontWeight.bold),
                controller: _nameController,
                decoration: InputDecoration(
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
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return '';}
                    return null;
                  },
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
                  if (formKey.currentState!.validate()) {
                    final value = ModelClass(
                        name: _nameController.text, age: _ageController.text);
                    Hive.box("boxName").add(value);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NoteHomeScreen(),
                      ),
                    );
                  }
                },
                child: Text("create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
