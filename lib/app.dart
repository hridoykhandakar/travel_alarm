import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_alarm/constants/themes/theme.dart';
import 'package:travel_alarm/features/location/screens/location_screen.dart';
import 'package:travel_alarm/features/onboarding/providers/app_state_provider.dart';
import 'package:travel_alarm/features/onboarding/screens/onboarding_screen.dart';
import 'package:travel_alarm/features/splash/screens/splash_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingStatus = ref.watch(onboardingStatusProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,

      theme: KAppTheme.darkTheme,
      home:
          // onboardingStatus.when(
          //   loading: () => const SplashScreen(), // Show a neutral splash screen
          //   error: (error, stack) =>
          //       Center(child: Text("error")), // Show error screen
          //   data: (hasCompletedOnboarding) {
          //     return hasCompletedOnboarding
          //         ? const LocationScreen()
          //         : const OnboardingScreen();
          //   },
          // ),
          // DemoScreen(),
          // OnboardingScreen(),
          LocationScreen(),
      // AlarmHomeScreen(),
    );
  }
}
