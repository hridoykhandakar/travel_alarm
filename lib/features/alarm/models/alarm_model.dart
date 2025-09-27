import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 0)
class AlarmModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final bool isActive;

  @HiveField(2)
  final DateTime dateTime;
  AlarmModel({
    required this.id,
    required this.dateTime,
    required this.isActive,
  });
}
