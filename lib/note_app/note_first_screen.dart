import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:next_poject/note_app/creat_data.dart';
import 'package:next_poject/note_app/edit_data.dart';
import 'package:next_poject/note_app/model_class.dart';
import 'package:next_poject/templets/thems.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void dispose() {
    Hive.box("boxName").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Color(0xFFc793ce),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF533f6a),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateData(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
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
                      endActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            hiveBox.deleteAt(index);
                          },
                          icon: Icons.delete,
                          label: "delete",
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        )
                      ]),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditData(
                                index: index,
                                name: helper.name,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor().MainColor
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                helper.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                helper.age,
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
