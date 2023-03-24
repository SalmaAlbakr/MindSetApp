//my list
//icon files put navigation to this list
//every single notification have 2 slidable for delete and edit
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/reminder/reminder_model_class.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Column(
                          children: [
                            Text(
                              helper.title,
                            ),
                            Text(
                              helper.disc,
                            ),
                            Text(
                              helper.time,
                            ),
                            Text(
                              helper.date,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                hiveBox.deleteAt(index);
                                setState(
                                  () {
                                    AwesomeNotifications().cancel(index);
                                  },
                                );
                              },
                              child: Text(
                                "Delete",
                              ),
                            )
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
