import 'package:flutter/material.dart';
import 'package:habits_tracker_app/app.dart';
import 'package:habits_tracker_app/features/onboarding/repository/onboarding_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// Check if onboarding is completed
  final onboardingRepo = OnboardingRepository();
  final hasSeenOnboarding = await onboardingRepo.isCompleted();

  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding,));
}