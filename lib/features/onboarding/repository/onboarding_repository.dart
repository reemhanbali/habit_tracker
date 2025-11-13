import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository {
  final String _key = 'onboarding_complete';

  Future<bool> isCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  Future<void> completeOnboarding() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_key, true);
  }
}