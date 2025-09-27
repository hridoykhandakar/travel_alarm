import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_alarm/features/alarm/models/alarm_model.dart';
import 'package:travel_alarm/features/alarm/services/alarm_db_service.dart';

class AlarmNotifier extends Notifier<List<AlarmModel>> {
  final local = AlarmDbService();

  @override
  List<AlarmModel> build() {
    // TODO: implement build
    loadFromLocal();
    return [];
  }

  // Load All Alarms
  Future<void> loadFromLocal() async {
    try {
      final alarms = await local.getAlarms();
      print('Loaded ${alarms.length} alarms from database');
      state = alarms;
    } catch (e) {
      print("error $e");
    }
  }

  // Add Alarm
  Future<void> addAlarm(AlarmModel alarm) async {
    await local.deleteAllAlarm();
    try {
      await local.saveAlarm(alarm);
      print('Added to db');
      final updated = [...state, alarm];
      state = updated;
    } catch (e) {
      print('Error adding alarm: $e');
    }
  }

  //   Toggle On Off

  // Delete alarm
}

final alarmProvider = NotifierProvider<AlarmNotifier, List<AlarmModel>>(
  AlarmNotifier.new,
);
