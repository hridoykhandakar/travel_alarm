import 'package:flutter/cupertino.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';

class GradientWrapper extends StatelessWidget {
  final Widget child;
  const GradientWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.bgGradient),
      child: child,
    );
  }
}
