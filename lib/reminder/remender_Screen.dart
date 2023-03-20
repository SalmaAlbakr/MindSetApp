import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/calculator/calculator_screen.dart';
import 'package:next_poject/main.dart';
import 'package:next_poject/reminder/my_notificationes_list.dart';
import 'package:next_poject/reminder/notification_controller.dart';
import 'package:next_poject/reminder/reminder_model_class.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:uuid/uuid.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {

 // List<List> titleList = [];
 // int id = 0;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

   int _myID = UniqueKey().hashCode;

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
// void initState() {
//     AwesomeNotifications().setListeners(onActionReceivedMethod:(ReceivedAction receivedAction) async
//     {
//      print("kuuyfufyifuhyiyhoigtirydjfgh");
//       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalculatorScreen() ));
//      } );
//     super.initState();
//   }
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
          builder: (context , snapshot){
            final hiveBox = Hive.box("reminderBox");
            return ValueListenableBuilder(
                valueListenable: hiveBox.listenable(),
                builder: (context , value , child){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //color: Colors.black,
                       // width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                                height: 16),
                            TextField(
                              controller: _title,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                label: Text("Title",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                label: Text("Notes",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                            SizedBox(height: 150),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40),backgroundColor: Color(0xffab7ec1)
                              ),
                              onPressed: () async {
                                final value =
                                ReminderModelClass(
                                    title: _title.text,
                                    disc: _desc.text,
                                    date: _date.text,
                                    time: _time.text,
                                    id: _myID);
                                Hive.box("reminderBox").add(value);

                               // List detelsList = [_title.text , _desc.text , _date.text , _time.text ];
                                AwesomeNotifications().createNotification(
                                    content: NotificationContent(
                                        id: _myID,
                                        channelKey: 'reminder key',
                                        title: _title.text,
                                        body: _desc.text,
                                        payload: {
                                          "navigate" : "true"
                                        }
                                    ),
                                    schedule: NotificationCalendar.fromDate(date: dateTime),
                                    actionButtons: [
                                      NotificationActionButton(key: "key", label: "label" ,
                                      ),
                                    ]
                                );
                                // setState(() {
                                //  // titleList.add(detelsList);
                                //  _id++;
                                // });
                              },
                              //showNotification,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Create Reminder",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Text(hiveBox.length.toString())
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
            });
          })
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