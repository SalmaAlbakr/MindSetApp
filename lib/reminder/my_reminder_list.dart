//my list
//icon files put navigation to this list
//every single notification have 2 slidable for delete and edit
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/reminder/reminder_model_class.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:next_poject/templets/thems.dart';

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
        backgroundColor: AppColor().MainColor,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          final hiveBox = Hive.box("reminderBox");
          return ValueListenableBuilder(
            valueListenable: hiveBox.listenable(),
            builder: (context, value, child) {
              return Container(
                child: ListView.builder(
                  itemCount: hiveBox.length,
                  itemBuilder: (BuildContext context, int index) {
                    final helper = hiveBox.getAt(index) as ReminderModelClass;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  helper.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  helper.disc,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  helper.time,
                                ),
                                Text(
                                  helper.date,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                // hiveBox.deleteAt(index);
                                setState(
                                  () {
                                    AwesomeNotifications().cancel(index);
                                    hiveBox.deleteAt(index);
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.delete_forever,
                              ),
                              color: AppColor().ButtonColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
