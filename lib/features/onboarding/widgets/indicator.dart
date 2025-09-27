import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      effect: SlideEffect(
        activeDotColor: AppColors.primary,
        dotColor: Color(0XFFBA99ff).withValues(alpha: 0.2),
      ),
    );
  }
}
