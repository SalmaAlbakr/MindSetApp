import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/reminder/reminder_model_class.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class ReminderMeScreen extends StatefulWidget {
  const ReminderMeScreen({Key? key}) : super(key: key);

  @override
  State<ReminderMeScreen> createState() => _ReminderMeScreenState();
}

class _ReminderMeScreenState extends State<ReminderMeScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  int _myID = UniqueKey().hashCode;
  DateTime dateTime = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey();

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
        backgroundColor: Color(0xFF2C0746),
        title: Text("Reminder"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          final hiveBox = Hive.box("reminderBox");
          return ValueListenableBuilder(
            valueListenable: hiveBox.listenable(),
            builder: (context, value, child) {
              return Form(
                key: formKey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Container(
                          height: 500,
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field is required.';
                                  }
                                  return null;
                                },
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
                              TextFormField(
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
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Field is required.';
                                  return null;
                                },
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
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Field is required.';
                                  return null;
                                },
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
                                        initialTime: TimeOfDay.now(),
                                      );

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
                              const SizedBox(
                                height: 150,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              double.infinity,
                              40,
                            ),
                            backgroundColor: Color(0xFFA56FCA),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
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
                                schedule: NotificationCalendar.fromDate(
                                    date: dateTime),
                                actionButtons: [
                                  NotificationActionButton(
                                    key: "key",
                                    label: "label",
                                  ),
                                ],
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.grey,
                                  content: Text(" enter your data"),
                                ),
                              );
                            }
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
                              ),
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
}
