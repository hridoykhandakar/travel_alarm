import 'package:flutter/material.dart';
import 'package:travel_alarm/common_widgets/primary_button.dart';
import 'package:travel_alarm/features/location/screens/location_screen.dart';
import 'package:travel_alarm/features/onboarding/services/onboarding_service.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required int currentPage,
    required PageController pageController,
  }) : _currentPage = currentPage,
       _pageController = pageController;

  final int _currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () async {
        if (_currentPage < 2) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          await OnboardingService.markOnboardingComplete();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        }
      },
      label: "Next",
    );
  }
}
