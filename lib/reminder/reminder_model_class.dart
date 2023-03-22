import 'package:hive/hive.dart';
part 'reminder_model_class.g.dart';

@HiveType(typeId: 2)
class ReminderModelClass {
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String disc;
  @HiveField(4)
  final String date;
  @HiveField(5)
  final String time;
  @HiveField(6)
  final int id;

  ReminderModelClass({
    required this.title,
    required this.disc,
    required this.date,
    required this.time,
    required this.id,
  });
}
