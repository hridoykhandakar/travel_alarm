import 'package:hive/hive.dart';

class OnboardingService {
  static const String _boxName = 'app_settings';
  static const String _key = 'has_completed_onboarding';

  static Future<bool> checkOnboardingStatus() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_key, defaultValue: false);
  }

  static Future<void> markOnboardingComplete() async {
    final box = await Hive.openBox(_boxName);
    await box.put(_key, true);
  }

  static Future<void> resetOnboarding() async {
    final box = await Hive.openBox(_boxName);
    await box.put(_key, false);
  }
}
