// Provider for onboarding status
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_alarm/features/onboarding/services/onboarding_service.dart';

final onboardingStatusProvider = FutureProvider<bool>((ref) async {
  return await OnboardingService.checkOnboardingStatus();
});

// Provider for onboarding actions
final onboardingControllerProvider = Provider<OnboardingController>((ref) {
  return OnboardingController();
});

class OnboardingController {
  Future<void> markOnboardingComplete() async {
    await OnboardingService.markOnboardingComplete();
  }

  Future<void> resetOnboarding() async {
    await OnboardingService.resetOnboarding();
  }
}
