import 'package:flutter/material.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';
import 'package:travel_alarm/features/location/screens/location_screen.dart';
import 'package:travel_alarm/features/onboarding/services/onboarding_service.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 44,
      right: 22,
      child: TextButton(
        onPressed: () async {
          await OnboardingService.markOnboardingComplete();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        },
        child: Text(
          "Skip",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
