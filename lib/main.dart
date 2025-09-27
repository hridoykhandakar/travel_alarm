import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_alarm/app.dart';
import 'package:travel_alarm/features/alarm/models/alarm_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init();
  await Hive.initFlutter();
  Hive.registerAdapter(AlarmModelAdapter());

  // opening box for alarms
  await Hive.openBox<AlarmModel>('alarmBox');
  runApp(ProviderScope(child: App()));
}
