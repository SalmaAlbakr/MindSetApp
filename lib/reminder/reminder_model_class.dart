import 'package:hive/hive.dart';


//part 'reminder_model_class.g.dart';
@HiveType(typeId: 2)
class ReminderModelClass{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String disc;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String time;

  ReminderModelClass({
   required  this.title,
   required  this.disc,
    required  this.date,
    required  this.time});

}