import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0XFF5200FF);
  static const Color headlineMedium = Color(0XFFFFFFFF);
  static const Color white = Color(0XFFFFFFFF);
  static const Gradient bgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0XFF0B0024), Color(0XFF082257)],
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
    // colors: [Colors.blue, Colors.purple],
  );
}
