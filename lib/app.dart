import 'package:flutter/material.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.hasSeenOnboarding});

  final bool hasSeenOnboarding;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: hasSeenOnboarding ? AppRoutes.auth : AppRoutes.onboarding,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
