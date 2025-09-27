import 'package:flutter/material.dart';
import 'package:travel_alarm/common_widgets/gradient_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientWrapper(child: Center(child: CircularProgressIndicator()));
  }
}
