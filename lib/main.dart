import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habits_tracker_app/app.dart';
import 'package:habits_tracker_app/features/onboarding/repository/onboarding_repository.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // match Scaffold background
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Check if onboarding is completed
  final onboardingRepo = OnboardingRepository();
  final hasSeenOnboarding = await onboardingRepo.isCompleted();
  final router = AppRoutes.create(hasSeenOnboarding);

  runApp(MyApp(router: router));

  //runApp(MaterialApp(home: CreateAccountFlow()));
}
