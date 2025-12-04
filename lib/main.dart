import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habits_tracker_app/app.dart';
import 'package:habits_tracker_app/core/widgets/widget_preview.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account_screen.dart';
import 'package:habits_tracker_app/features/onboarding/repository/onboarding_repository.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/option_box.dart';

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

  // runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));

  runApp(MaterialApp(home: CreateAccountScreen()));
}
