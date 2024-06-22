import 'package:hive/hive.dart';

part 'medication_reminder_model.g.dart';

@HiveType(typeId: 0)
class MedicationReminder extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String portion;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final String time;

  MedicationReminder(
      {required this.name,
      required this.portion,
      required this.type,
      required this.time});
}
