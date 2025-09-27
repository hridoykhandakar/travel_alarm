// Async version - এটা আরও ভালো approach
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_alarm/features/alarm/models/alarm_model.dart';
import 'package:travel_alarm/features/alarm/services/alarm_db_service.dart';

final alarmNotifierProvider =
    AsyncNotifierProvider<AlarmAsyncNotifier, List<AlarmModel>>(() {
      return AlarmAsyncNotifier();
    });

class AlarmAsyncNotifier extends AsyncNotifier<List<AlarmModel>> {
  final local = AlarmDbService();

  @override
  Future<List<AlarmModel>> build() async {
    return loadFromLocal();
  }

  Future<List<AlarmModel>> loadFromLocal() async {
    final alarms = await local.getAlarms();
    return alarms;
  }

  Future<void> addAlarm(AlarmModel alarm) async {
    final current = state.value ?? [];
    final updated = [...current, alarm];
    state = AsyncValue.data(updated);
    await local.saveAlarm(alarm);
  }

  Future<void> updateAlarm(AlarmModel updatedAlarm) async {
    final current = state.value ?? [];
    final updatedList = current.map((alarm) {
      if (alarm.id == updatedAlarm.id) {
        return updatedAlarm;
      }
      return alarm;
    }).toList();

    state = AsyncValue.data(updatedList);
    await local.saveAlarm(updatedAlarm);
  }

  Future<void> deleteAlarm(String id) async {
    final current = state.value ?? [];
    final updated = current.where((alarm) => alarm.id != id).toList();
    state = AsyncValue.data(updated);
    await local.deleteAlarm(id);
  }

  Future<void> toggleAlarm(int id) async {
    final current = state.value ?? [];
    final updatedList = current.map((alarm) {
      if (alarm.id == id) {
        return AlarmModel(
          id: alarm.id,
          dateTime: alarm.dateTime,
          isActive: !alarm.isActive,
        );
      }
      return alarm;
    }).toList();

    state = AsyncValue.data(updatedList);

    final toggledAlarm = updatedList.firstWhere((alarm) => alarm.id == id);
    await local.saveAlarm(toggledAlarm);
  }
}
