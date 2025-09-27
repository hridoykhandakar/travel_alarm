import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

class AlarmService {
  static final AlarmService _instance = AlarmService._internal();
  factory AlarmService() => _instance;
  AlarmService._internal();

  /// Load all alarms from storage
  Future<List<AlarmSettings>> getAlarms() async {
    try {
      return await Alarm.getAlarms();
    } catch (e) {
      debugPrint('Error loading alarms: $e');
      rethrow;
    }
  }

  /// Create and set a new alarm
  Future<void> setAlarm(
    DateTime dateTime, {
    String? title,
    String? body,
    String? assetAudioPath,
  }) async {
    try {
      final alarmSettings = _createAlarmSettings(
        dateTime,
        title: title,
        body: body,
        assetAudioPath: assetAudioPath,
      );
      await Alarm.set(alarmSettings: alarmSettings);
    } catch (e) {
      debugPrint('Error setting alarm: $e');
      rethrow;
    }
  }

  /// Stop an alarm by ID
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

  /// Create alarm settings with default configuration
  AlarmSettings _createAlarmSettings(
    DateTime dateTime, {
    String? title,
    String? body,
    String? assetAudioPath,
  }) {
    return AlarmSettings(
      id: DateTime.now().millisecondsSinceEpoch % 100000,
      dateTime: dateTime,
      assetAudioPath: assetAudioPath ?? 'assets/alarm.mp3',
      vibrate: true,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(fadeDuration: Duration(seconds: 5)),
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
