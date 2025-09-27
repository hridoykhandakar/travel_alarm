import 'dart:async';
import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_alarm/common_widgets/gradient_wrapper.dart';
import 'package:travel_alarm/constants/icon_string.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';
import 'package:travel_alarm/features/alarm/widgets/alarm_title.dart';
import 'package:travel_alarm/features/alarm/widgets/location_section.dart';
import 'package:travel_alarm/helpers/format_time.dart';

class AlarmHomeScreen extends StatefulWidget {
  const AlarmHomeScreen({super.key});

  @override
  State<AlarmHomeScreen> createState() => _AlarmHomeScreenState();
}

class _AlarmHomeScreenState extends State<AlarmHomeScreen> {
  List<AlarmSettings> alarms = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAlarms();
  }

  Future<void> loadAlarms() async {
    final loadedAlarms = await Alarm.getAlarms();
    setState(() {
      alarms = loadedAlarms;
    });
  }

  Future<void> setAlarm(DateTime dateTime) async {
    try {
      if (dateTime.isBefore(DateTime.now())) {
        throw Exception('Cannot set alarm in the past');
      }
      final AlarmSettings alarmSettings = AlarmSettings(
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
        notificationSettings: const NotificationSettings(
          title: 'This is the title',
          body: 'This is the body',
          stopButton: 'Stop the alarm',
          icon: 'notification_icon',
          iconColor: Color(0xff862778),
        ),
      );

      await Alarm.set(alarmSettings: alarmSettings);
      await loadAlarms();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to set alarm: ${e.toString()}')),
      );
    }
  }

  Future<void> stopAlarm(int id) async {
    await Alarm.stop(id);
  }

  void picTimeAndDateSetAlarm() async {
    // Date pick
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final dateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      await setAlarm(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientWrapper(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Selected Location"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(IconString.actionIcon),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top Button
              Container(
                height: 56,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(60),
                ),

                child: LocationSection(),
              ),
              const SizedBox(height: 24),

              // Alarms
              AlarmTitle(),
              const SizedBox(height: 16),
              alarms.isEmpty
                  ? Center(child: Text("No Alarms"))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: alarms.length,
                        itemBuilder: (context, index) {
                          final alarm = alarms[index];
                          return Column(
                            children: [
                              Container(
                                height: 56,
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color(0XFF201A43),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formatTimeWithAmPm(alarm.dateTime),
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.25,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          formatDateWithDay(alarm.dateTime),
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(width: 8),
                                        Switch(
                                          value: alarm.dateTime.isAfter(
                                            DateTime.now(),
                                          ), // alarm active আছে কিনা

                                          onChanged: (bool value) async {
                                            if (value) {
                                              await Alarm.set(
                                                alarmSettings: alarm,
                                              );
                                            } else {
                                              await Alarm.stop(alarm.id);
                                            }
                                            await loadAlarms(); // Refresh list
                                          },
                                          // Active state: purple thumb with white track
                                          activeColor: AppColors
                                              .white, // Thumb color when active
                                          activeTrackColor: AppColors
                                              .primary, // Track color when active
                                          // Inactive state: white thumb with black track
                                          inactiveThumbColor: Color(
                                            0xff05000F,
                                          ), // Thumb color when inactive
                                          inactiveTrackColor: AppColors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: SizedBox(
            height: 66,
            width: 66,
            child: FloatingActionButton(
              elevation: 0,

              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(50),
              ),
              onPressed: picTimeAndDateSetAlarm,
              child: Icon(Icons.add, size: 24),
            ),
          ),
        ),
      ),
    );
  }
}
