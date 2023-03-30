import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/reminder/my_reminder_list.dart';
import 'package:next_poject/reminder/reminder_Screen.dart';
import 'package:next_poject/templets/thems.dart';

class ReminderFirstPage extends StatefulWidget {
  ReminderFirstPage({Key? key}) : super(key: key);

  @override
  State<ReminderFirstPage> createState() => _ReminderFirstPageState();
}

class _ReminderFirstPageState extends State<ReminderFirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminder"),
        backgroundColor: Color(0xFF2C0746),
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            final hiveBox = Hive.box("reminderBox");
            return ValueListenableBuilder(
              valueListenable: hiveBox.listenable(),
              builder: (context, value, child) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("hello..Let's get started   " , style: TextStyle(fontSize: 25),),
                          ],
                        ),
                        SizedBox(height: 100,),
                        GestureDetector(
                          onTap: () async {
                            await Hive.openBox("reminderBox");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ReminderMeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 200,
                            color: Color(0xFFA56FCA),
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
                                builder: (_) => MyReminderList(),
                              ),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 200,
                            color: Color(0xFFA56FCA),
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
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 25),
                                  hiveBox.length == 0 ? Container() : Text(
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
