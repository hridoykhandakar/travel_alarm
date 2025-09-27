import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';
import 'package:travel_alarm/helpers/format_time.dart';

class AlarmListItem extends StatelessWidget {
  final AlarmSettings alarm;
  final bool isActive;
  final ValueChanged<bool> onToggle;
  final VoidCallback? onTap;

  const AlarmListItem({
    super.key,
    required this.alarm,
    required this.isActive,
    required this.onToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(60),
          child: Container(
            height: 56,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0XFF201A43),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatTimeWithAmPm(alarm.dateTime),
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.25,
                          fontWeight: FontWeight.w500,
                          color: isActive ? Colors.white : Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formatDateWithDay(alarm.dateTime),
                      style: TextStyle(
                        fontSize: 14,
                        color: isActive ? Colors.white70 : Colors.white54,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Switch(
                      value: isActive,
                      onChanged: onToggle,
                      activeColor: AppColors.white,
                      activeTrackColor: AppColors.primary,
                      inactiveThumbColor: const Color(0xff05000F),
                      inactiveTrackColor: AppColors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
