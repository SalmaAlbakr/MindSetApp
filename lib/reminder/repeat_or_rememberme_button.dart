import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/reminder/my_notificationes_list.dart';
import 'package:next_poject/reminder/remender_Screen.dart';

class ReminderFirstPage extends StatefulWidget {
  ReminderFirstPage({Key? key}) : super(key: key);

  @override
  State<ReminderFirstPage> createState() => _ReminderFirstPageState();
}

class _ReminderFirstPageState extends State<ReminderFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            final hiveBox = Hive.box("reminderBox");
            return ValueListenableBuilder(
              valueListenable: hiveBox.listenable(),
              builder: (context, value, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Hive.openBox("reminderBox");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Reminder(),
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          width: 250,
                          color: Color(0xffab7ec1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 50,
                              ),
                              Text(
                                "add",
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Hive.openBox("reminderBox");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MyList(),
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          width: 250,
                          color: Color(0xffab7ec1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.file_copy_outlined,
                                      size: 55,
                                    ),
                                    Text(
                                      "My List",
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 25),
                                Text(
                                  hiveBox.length.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
