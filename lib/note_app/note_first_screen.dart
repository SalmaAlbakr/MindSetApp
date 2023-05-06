import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:next_poject/note_app/note_creat_data.dart';
import 'package:next_poject/note_app/note_edit_data.dart';
import 'package:next_poject/note_app/model_class.dart';
import 'package:next_poject/templets/thems.dart';

class NoteHomeScreen extends StatefulWidget {
  const NoteHomeScreen({Key? key}) : super(key: key);

  @override
  State<NoteHomeScreen> createState() => _NoteHomeScreenState();
}

class _NoteHomeScreenState extends State<NoteHomeScreen> {
  @override
  void dispose() {
    Hive.box("boxName").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: const Color(0xFFc793ce),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF533f6a),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NoteCreateData(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FutureBuilder(
              builder: (context, snapshot) {
                final hiveBox = Hive.box("boxName");
                return ValueListenableBuilder(
                  valueListenable: hiveBox.listenable(),
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: hiveBox.length,
                      itemBuilder: (context, index) {
                        final helper = hiveBox.getAt(index) as ModelClass;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Slidable(
                            key: ValueKey(index),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => NoteEditData(
                                          index: index,
                                          name: helper.name,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.edit,
                                  label: "Edit",
                                  backgroundColor: Colors.greenAccent,
                                  foregroundColor: Colors.white,
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    hiveBox.deleteAt(index);
                                  },
                                  icon: Icons.delete,
                                  label: "delete",
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                              ],
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor().mainColor,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    helper.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    helper.age,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
