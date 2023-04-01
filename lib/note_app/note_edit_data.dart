import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:next_poject/note_app/model_class.dart';
import 'package:next_poject/note_app/note_first_screen.dart';
import 'package:next_poject/templets/thems.dart';

class NoteEditData extends StatefulWidget {
  int index;
  String name;
  NoteEditData({required this.name, required this.index, Key? key})
      : super(key: key);

  @override
  State<NoteEditData> createState() => _NoteEditDataState();
}

class _NoteEditDataState extends State<NoteEditData> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
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
        backgroundColor: Color(0xFFc793ce),
        title: Text(widget.name),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
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
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  maxLines: 9999,
                  controller: _ageController,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  decoration: InputDecoration(
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final value = ModelClass(
                      name: _nameController.text,
                      age: _ageController.text,
                    );
                    Hive.box("boxName").putAt(widget.index, value);
                    print("done data");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NoteHomeScreen(),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF533f6a),
                  ),
                ),
                child: Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}