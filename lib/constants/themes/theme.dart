import 'package:flutter/material.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';
import 'package:travel_alarm/constants/themes/text_theme.dart';

class KAppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: KTextTheme.darkTextTheme,
  );
}
