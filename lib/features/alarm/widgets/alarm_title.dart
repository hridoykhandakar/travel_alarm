import 'package:flutter/material.dart';

class AlarmTitle extends StatelessWidget {
  const AlarmTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Alarms",
      style: TextStyle(fontSize: 18, height: 1.55),
      textAlign: TextAlign.start,
    );
  }
}
