import 'dart:io';
import 'dart:ui';

import 'package:alarm/alarm.dart';
import 'package:flutter/foundation.dart';

class AlarmService {
  // Get all Alarms
  Future<List<AlarmSettings>> getAlarms() async {
    try {
      return await Alarm.getAlarms();
    } catch (e) {
      debugPrint("Error loading alarms : $e");
      rethrow;
    }
  }

  //   Create New Alarms
  Future<void> setAlarm(
    DateTime dateTime, {
    String? title,
    String? body,
  }) async {
    try {
      final alarmSettings = createAlarmSettings(
        dateTime,
        title: title,
        body: body,
      );
    } catch (e) {
      debugPrint("Error to set a alarm: $e");
      rethrow;
    }
  }

  // Stop an alarm by ID
  Future<void> stopAlarm(int id) async {
    try {
      await Alarm.stop(id);
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
      rethrow;
    }
  }

  /// Toggle alarm on/off
  Future<void> toggleAlarm(AlarmSettings alarm, bool isActive) async {
    try {
      if (isActive) {
        await Alarm.set(alarmSettings: alarm);
      } else {
        await Alarm.stop(alarm.id);
      }
    } catch (e) {
      debugPrint('Error toggling alarm: $e');
      rethrow;
    }
  }

  /// Check if alarm is active (future date)
  bool isAlarmActive(DateTime alarmDateTime) {
    return alarmDateTime.isAfter(DateTime.now());
  }

  AlarmSettings createAlarmSettings(
    DateTime dateTime, {
    String? title,
    String? body,
    String? assetAudioPath,
  }) {
    return AlarmSettings(
      id: DateTime.now().millisecondsSinceEpoch % 100000,
      dateTime: dateTime,
      assetAudioPath: 'assets/alarm.mp3',
      vibrate: true,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: Duration(seconds: 5),
        volumeEnforced: true,
      ),
      notificationSettings: NotificationSettings(
        title: title ?? 'Travel Alarm',
        body: body ?? 'Time to wake up!',
        stopButton: 'Stop the alarm',
        icon: 'notification_icon',
        iconColor: const Color(0xff862778),
      ),
    );
  }
}
