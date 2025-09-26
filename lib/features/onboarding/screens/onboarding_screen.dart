import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_alarm/common_widgets/gradient_wrapper.dart';
import 'package:travel_alarm/common_widgets/primary_button.dart';
import 'package:travel_alarm/constants/image_strings.dart';
import 'package:travel_alarm/constants/text_strings.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';
import 'package:travel_alarm/features/location/screens/location_screen.dart';
import 'package:travel_alarm/features/onboarding/services/onboarding_service.dart';

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
                  Positioned(
                    top: 44,
                    right: 22,
                    child: TextButton(
                      onPressed: () async {
                        await OnboardingService.markOnboardingComplete();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationScreen(),
                          ),
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
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: SlideEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: Color(0XFFBA99ff).withValues(alpha: 0.2),
                    ),
                  ),
                  const SizedBox(height: 56),
                  PrimaryButton(
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
                          MaterialPageRoute(
                            builder: (context) => LocationScreen(),
                          ),
                        );
                      }
                    },
                    label: "Next",
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

class OnBoardingPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image(
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Text(
                subTitle,
                style: TextStyle(fontSize: 14, color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
