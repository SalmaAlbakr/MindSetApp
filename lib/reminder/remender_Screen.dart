import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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

  DateTime dateTime = DateTime.now();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("@mipmap/ic_launcher");


    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidInitializationSettings,
      macOS: null,
      linux: null,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (dataYouNeedToUseWhenNotificationIsClicked) {},
    );
  }

  showNotification() {
    if (_title.text.isEmpty || _desc.text.isEmpty) {
      return;
    }

    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      "ScheduleNotification001",
      "Notify Me",
      importance: Importance.high,
    );


    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      macOS: null,
      linux: null,
    );

    // flutterLocalNotificationsPlugin.show(
    //     01, _title.text, _desc.text, notificationDetails);

    tz.initializeTimeZones();
    final tz.TZDateTime scheduledAt = tz.TZDateTime.from(dateTime, tz.local);

    flutterLocalNotificationsPlugin.zonedSchedule(
        01, _title.text, _desc.text, scheduledAt, notificationDetails,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true,
        payload: 'Ths s the data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffab7ec1),
        title: Text("Reminder"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView(
           // mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                  height: 16),
              TextField(
                controller: _title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  label: Text("Notification Title",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ),
              const SizedBox(
                  height: 16),
              TextField(
                controller: _desc,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  label: Text("Notification Description",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ),
              const SizedBox(
                  height: 16),
              DateTimePicker(
                decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                calendarTitle: "Date",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                firstDate: DateTime.now(),
                lastDate: DateTime(2095),
                controller: _date,
              ),
              // TextField(
              //   controller: _date,
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12.0),
              //       ),
              //       suffixIcon: InkWell(
              //         child: Icon(Icons.date_range),
              //         onTap: () async {
              //           final DateTime? newlySelectedDate =
              //           await showDatePicker(
              //             context: context,
              //             initialDate: dateTime,
              //             firstDate: DateTime.now(),
              //             lastDate: DateTime(2095),
              //           );
              //
              //           if (newlySelectedDate == null) {
              //             return;
              //           }
              //
              //           setState(() {
              //             dateTime = newlySelectedDate;
              //             // _date.text =
              //             //     "${dateTime.year}/${dateTime.month}/${dateTime.day}";
              //           });
              //         },
              //       ),
              //       label: Text("Date")),
              // ),
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
                        final TimeOfDay? slectedTime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());

                        if (slectedTime == null) {
                          return;
                        }

                        _time.text =
                        "${slectedTime.hour}:${slectedTime.minute}.${slectedTime.period.name}";

                        DateTime newDT = DateTime(
                          dateTime.year,
                          dateTime.month,
                          dateTime.day,
                          slectedTime.hour,
                          slectedTime.minute,
                        );
                        setState(() {
                          dateTime = newDT;
                        });
                      },
                    ),
                    label: Text("Time",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
              ),
              const SizedBox(
                height: 24.0,
              ),
              SizedBox(height: 180,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),backgroundColor: Color(0xffab7ec1)
                  ),
                  onPressed: showNotification,
                  child: Text("Show Notification",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              ) ],
          ),
        ),
      ),
    );
  }
}