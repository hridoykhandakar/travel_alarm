import 'package:flutter/material.dart';

class DateTimePickerService {
  /// Show date and time picker and return selected DateTime
  static Future<DateTime?> pickDateTime(BuildContext context) async {
    try {
      // Pick date first
      final pickedDate = await _pickDate(context);
      if (pickedDate == null) return null;

      // Pick time
      final pickedTime = await _pickTime(context);
      if (pickedTime == null) return null;

      // Combine date and time
      return DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    } catch (e) {
      debugPrint('Error picking date/time: $e');
      return null;
    }
  }

  /// Show date picker
  static Future<DateTime?> _pickDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: const Color(0xff862778)),
          ),
          child: child!,
        );
      },
    );
  }

  /// Show time picker
  static Future<TimeOfDay?> _pickTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: const Color(0xff862778)),
          ),
          child: child!,
        );
      },
    );
  }

  /// Validate if the selected date/time is in the future
  static bool isValidDateTime(DateTime dateTime) {
    return dateTime.isAfter(DateTime.now());
  }
}
