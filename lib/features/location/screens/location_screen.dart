import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_alarm/common_widgets/gradient_wrapper.dart';
import 'package:travel_alarm/common_widgets/outline_icon_button.dart';
import 'package:travel_alarm/common_widgets/primary_button.dart';
import 'package:travel_alarm/constants/icon_string.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';
import 'package:travel_alarm/features/alarm/screens/alarm_home_screen.dart';
import 'package:travel_alarm/features/location/providers/location_provider.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final locationState = ref.watch(locationProvider);
    return GradientWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 34),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome! Your Smart Travel Alarm",
                        style: TextStyle(
                          fontSize: 28,
                          height: 1.214,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Stay on schedule and enjoy every moment of your journey.",
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5, // 16 * 1.5 = 24px line height
                            color: Color(0xFFE0E0E0),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/location_image.png",
                      height: 296,
                      width: 296,
                    ),
                  ),
                  const Spacer(),

                  OutlineIconButton(
                    label: "Use Current Location",
                    onPressed: () {
                      ref.read(locationProvider.notifier).fetchCity();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlarmHomeScreen(),
                        ),
                      );
                    },
                    icon: IconString.locationIcon,
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: "Home",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlarmHomeScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 73),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
