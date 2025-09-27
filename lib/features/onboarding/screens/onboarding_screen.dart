import 'package:flutter/material.dart';
import 'package:travel_alarm/common_widgets/gradient_wrapper.dart';
import 'package:travel_alarm/constants/image_strings.dart';
import 'package:travel_alarm/constants/text_strings.dart';
import 'package:travel_alarm/features/onboarding/widgets/indicator.dart';
import 'package:travel_alarm/features/onboarding/widgets/next_button.dart';
import 'package:travel_alarm/features/onboarding/widgets/onboarding_page.dart';
import 'package:travel_alarm/features/onboarding/widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Scroll page
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      OnBoardingPage(
                        image: ImageStrings.onBoardingImage1,
                        title: TextStrings.onBoardingTitle1,
                        subTitle: TextStrings.onBoardingSubTitle1,
                      ),
                      OnBoardingPage(
                        image: ImageStrings.onBoardingImage2,
                        title: TextStrings.onBoardingTitle2,
                        subTitle: TextStrings.onBoardingSubTitle2,
                      ),
                      OnBoardingPage(
                        image: ImageStrings.onBoardingImage3,
                        title: TextStrings.onBoardingTitle3,
                        subTitle: TextStrings.onBoardingSubTitle3,
                      ),
                    ],
                  ),

                  // Skip Button
                  SkipButton(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Indicator(pageController: _pageController),
                  const SizedBox(height: 56),
                  NextButton(
                    currentPage: _currentPage,
                    pageController: _pageController,
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
