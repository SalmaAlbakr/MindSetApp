import 'package:MindSet/home/navigation_bar.dart';
import 'package:MindSet/note_app/model_class.dart';
import 'package:MindSet/note_app/note_first_screen.dart';
import 'package:MindSet/templets/thems.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NoteCreateData extends StatefulWidget {
  const NoteCreateData({Key? key}) : super(key: key);

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
        backgroundColor: const Color(0xFFc793ce),
        title: const Text("Notes"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: _nameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor().mainColor,
                    ),
                  ),
                  hintText: "title",
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
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
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor().mainColor,
                      ),
                    ),
                    hintText: "note",
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: const Color(0xFF533f6a),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final value = ModelClass(
                        name: _nameController.text, age: _ageController.text);
                    Hive.box("boxName").add(value);
                    await Hive.openBox("boxName");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationScreen(
                          num: 2,
                        ),
                      ),
                    );
                  }
                },
                child: const Text("create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
