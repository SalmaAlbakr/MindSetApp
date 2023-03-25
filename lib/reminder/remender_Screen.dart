import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/reminder/reminder_model_class.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  int _myID = UniqueKey().hashCode;
  DateTime dateTime = DateTime.now();

  @override
  void dispose() {
    Hive.box("reminderBox").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffab7ec1),
        title: Text("Reminder"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          final hiveBox = Hive.box("reminderBox");
          return ValueListenableBuilder(
            valueListenable: hiveBox.listenable(),
            builder: (context, value, child) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: _title,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            label: Text(
                              "Title",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: _desc,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            label: Text(
                              "Notes",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DateTimePicker(
                          decoration: InputDecoration(
                            labelText: "Date",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          calendarTitle: "Date",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2095),
                          controller: _date,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextField(
                          controller: _time,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            suffixIcon: InkWell(
                              child: const Icon(
                                Icons.timer_outlined,
                              ),
                              onTap: () async {
                                final TimeOfDay? selectTime =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());

                                if (selectTime == null) {
                                  return;
                                }

                                _time.text =
                                    "${selectTime.hour}:${selectTime.minute}.${selectTime.period.name}";

                                DateTime newDT = DateTime(
                                  dateTime.year,
                                  dateTime.month,
                                  dateTime.day,
                                  selectTime.hour,
                                  selectTime.minute,
                                );
                                setState(() {
                                  dateTime = newDT;
                                });
                              },
                            ),
                            label: Text(
                              "Time",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                            backgroundColor: Color(0xffab7ec1),
                          ),
                          onPressed: () async {
                            final value = ReminderModelClass(
                                title: _title.text,
                                disc: _desc.text,
                                date: _date.text,
                                time: _time.text,
                                id: _myID);
                            Hive.box("reminderBox").add(value);

                            AwesomeNotifications().createNotification(
                              content: NotificationContent(
                                id: _myID,
                                channelKey: 'reminder key',
                                title: _title.text,
                                body: _desc.text,
                                payload: {"navigate": "true"},
                              ),
                              schedule:
                                  NotificationCalendar.fromDate(date: dateTime),
                              actionButtons: [
                                NotificationActionButton(
                                  key: "key",
                                  label: "label",
                                ),
                              ],
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Create Reminder",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                hiveBox.length.toString(),
                              )
                            ],
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
      ),
    );
  }

  //reminder notification window>>

  // Container(
  //     child:
  //   Column(
  //     children: [
  //       Row(
  //         children: [
  //           Text("$variable of notofication title"),
  //         ],
  //       ),
  //
  //    Row(
  //      children: [
  //        ElevatedButton(onPressed: (){}, child: Text("ok")),
  //        SizedBox(height: 20),
  //        ElevatedButton(onPressed: (){rememberMeButton}, child: Text("Set Again")),
  //      ],
  //    )
  // ],
  //     ),
  //
  //
  //     ),

//set again window

// Container(
//     child:
//   Column(
//     children: [
//       Row(
//         children: [
//           Text("use the same date "),
//         ],
//       ),
//
//    Row(
//      children: [
//        ElevatedButton(onPressed: (){}, child: Text("ok")),
//        SizedBox(height: 20),
//        ElevatedButton(onPressed: (){calender or create button}, child: Text("Modify")),
//      ],
//    )
// ],
//     ),

}
