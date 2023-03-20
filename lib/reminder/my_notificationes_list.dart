//my list
//icon files put navigation to this list
//every single notification have 2 slidable for delete and edit
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
        body: FutureBuilder(builder: (context, snapshot) {
      final hiveBox = Hive.box("reminderBox");
      return ValueListenableBuilder(
          valueListenable: hiveBox.listenable(),
          builder: (context, value, child) {
            return Container(
              child: ListView.builder(
                itemCount: hiveBox.length,
// titleList.length,
                itemBuilder: (BuildContext context, int index) {
                  final helper = hiveBox.getAt(index) as ReminderModelClass;
                  return Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        Text(helper.title
//titleList[index][0].toString()
                            ),
                        Text(helper.disc
//titleList[index][1].toString()
                            ),
                        Text(helper.time
//titleList[index][2].toString()
                            ),
                        Text(helper.date
//titleList[index][3].toString()
                            ),
                        Text(helper.id.toString()
//titleList[index][3].toString()
                            ),
                        ElevatedButton(
                            onPressed: () {
                              hiveBox.deleteAt(index);
                              setState(() {
//titleList.removeAt(index);
// id = index;
                                AwesomeNotifications().cancel(index);
                              });
                            },
                            child: Text("Delete"))
                      ],
                    ),
                  );
                },
              ),
            );
          });
    }));
  }
}
