import 'package:hive/hive.dart';
import 'package:travel_alarm/features/alarm/models/alarm_model.dart';

class AlarmDbService {
  final String boxName = "alarmBox";

  Box<AlarmModel> _getBox() {
    return Hive.box<AlarmModel>(boxName);
  }

  Future<void> saveAlarm(AlarmModel alarm) async {
    try {
      final box = _getBox();
      final key = alarm.id;
      await box.put(key, alarm);
      print('Alarm saved to DB: ${alarm.id}');
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<List<AlarmModel>> getAlarms() async {
    try {
      final box = _getBox();
      final alarms = box.values.toList();
      print('Loaded ${alarms.length} alarms from DB');
      return alarms;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<AlarmModel?> getAlarmById(String id) async {
    final box = await Hive.openBox<AlarmModel>(boxName);
    return box.get(id);
  }

  Future<void> deleteAlarm(String id) async {
    final box = await Hive.openBox<AlarmModel>(boxName);
    await box.delete(id);
  }

  Future<void> deleteAllAlarm() async {
    final box = _getBox();
    await box.clear();
  }
}
