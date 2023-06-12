import 'package:MindSet/reminder/my_reminder_list.dart';
import 'package:MindSet/reminder/reminder_Screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReminderFirstPage extends StatefulWidget {
  const ReminderFirstPage({Key? key}) : super(key: key);

  @override
  State<ReminderFirstPage> createState() => _ReminderFirstPageState();
}

class _ReminderFirstPageState extends State<ReminderFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const  Text(
          "Reminder",
        ),
        backgroundColor: const Color(0xFF2C0746),
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
                          children: const [
                            Text(
                              "hello..Let's get started   ",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        //addButton
                        GestureDetector(
                          onTap: () async {
                            await Hive.openBox("reminderBox");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const ReminderMeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 200,
                            color: const Color(0xFFA56FCA),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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
                        const SizedBox(
                          height: 15,
                        ),
                        //myListButton
                        GestureDetector(
                          onTap: () async {
                            await Hive.openBox("reminderBox");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const MyReminderList(),
                              ),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 200,
                            color: const Color(0xFFA56FCA),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
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
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  hiveBox.length == 0
                                      ? Container()
                                      : Text(
                                          hiveBox.length.toString(),
                                          style: const TextStyle(
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
