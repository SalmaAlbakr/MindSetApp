import 'package:MindSet/reminder/reminder_model_class.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class MyReminderList extends StatefulWidget {
  const MyReminderList({Key? key}) : super(key: key);

  @override
  State<MyReminderList> createState() => _MyReminderListState();
}

class _MyReminderListState extends State<MyReminderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C0746),
        title: const Text(
          "My List",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          final hiveBox = Hive.box("reminderBox");
          return ValueListenableBuilder(
            valueListenable: hiveBox.listenable(),
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: hiveBox.length,
                itemBuilder: (BuildContext context, int index) {
                  final helper = hiveBox.getAt(index) as ReminderModelClass;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA56FCA),
                        border: Border.all(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                helper.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                helper.disc,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                helper.time,
                                style: const TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                              Text(
                                helper.date,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  AwesomeNotifications().cancel(index);
                                  hiveBox.deleteAt(index);
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              size: 30,
                            ),
                            color: Colors.black,
                          ),
                        ],
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
