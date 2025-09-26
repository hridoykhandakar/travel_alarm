import 'package:intl/intl.dart';

String formatTimeWithAmPm(DateTime dateTime) {
  return DateFormat('h:mm a').format(dateTime);
}

String formatDateWithDay(DateTime dateTime) {
  return DateFormat('EEE d MMM yyyy').format(dateTime);
}
