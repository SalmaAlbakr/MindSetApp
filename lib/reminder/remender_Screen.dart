import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:awesome_notifications/awesome_notifications.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  List<List> titleList = [];
  int id = 0;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  DateTime dateTime = DateTime.now();
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();

  @override
  // void initState() {
  //   super.initState();
  //   const AndroidInitializationSettings androidInitializationSettings =
  //   AndroidInitializationSettings("@mipmap/ic_launcher");
  //
  //
  //   const InitializationSettings initializationSettings =
  //   InitializationSettings(
  //     android: androidInitializationSettings,
  //     macOS: null,
  //     linux: null,
  //   );
  //
  //   flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //    onDidReceiveNotificationResponse: (NotificationResponse) async {
  //       //NotificationResponse.payload;
  //      await Navigator.push(context, MaterialPageRoute(builder:(context) => Reminder()));
  //    }
  //    // onSelectNotification: (dataYouNeedToUseWhenNotificationIsClicked) {},
  //   );
  //
  // }

  // showNotification() {
  //
  //   if (_title.text.isEmpty || _desc.text.isEmpty) {
  //     return;
  //   }
  //
  //   const AndroidNotificationDetails androidNotificationDetails =
  //   AndroidNotificationDetails(
  //     "ScheduleNotification001",
  //     "Notify Me",
  //     importance: Importance.high,
  //   );
  //
  //
  //   const NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidNotificationDetails,
  //     macOS: null,
  //     linux: null,
  //   );
  //
  //   tz.initializeTimeZones();
  //   final tz.TZDateTime scheduledAt = tz.TZDateTime.from(dateTime, tz.local);
  //
  //   flutterLocalNotificationsPlugin.zonedSchedule(
  //       id, _title.text, _desc.text, scheduledAt, notificationDetails,
  //       uiLocalNotificationDateInterpretation:
  //       UILocalNotificationDateInterpretation.wallClockTime,
  //       androidAllowWhileIdle: true,
  //       payload: 'Ths s the data');
  //
  //      /// test to add notification
  //   setState(() {
  //     titleList.add(detelsList);
  //     id++;
  //     print("my id notification is:  $id");
  //   });
  // }



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
                        final TimeOfDay? selectTime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());

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
                    label: Text("Time",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: titleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration:  BoxDecoration(
                        border: Border.all()
                      ),
                      child: Column(
                        children: [
                          Text(titleList[index][0].toString()),
                          Text(titleList[index][1].toString()),
                          Text(titleList[index][2].toString()),
                          Text(titleList[index][3].toString()),
                          ElevatedButton(onPressed: () {
                            setState(()  {
                              titleList.removeAt(index);
                              id = index;
                              AwesomeNotifications().cancel(id);

                            });
                          }, child: Text("Delete"))
                        ],
                      ),

                    );
                  },
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),backgroundColor: Color(0xffab7ec1)
                  ),
                  onPressed: (){
                    List detelsList = [_title.text , _desc.text , _date.text , _time.text ];
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(id: id, channelKey: 'reminder key',
                        title: _title.text,
                          body: _desc.text
                        ),
                     schedule: NotificationCalendar.fromDate(date: dateTime),
                      actionButtons: [
                        NotificationActionButton(key: "key", label: "label" ,
                        actionType: ActionType.Default,
                        ),
                       // NotificationActionButton(key: "1", label: "label"),

                      ]
                    );
                    setState(() {
                      titleList.add(detelsList);
                      id++;
                    });
                  },
                  //showNotification,
                  child: Text("Show Notification",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              ) ],
          ),
        ),
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