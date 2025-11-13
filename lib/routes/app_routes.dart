import 'package:flutter/material.dart';
import 'package:habits_tracker_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:habits_tracker_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:habits_tracker_app/features/user_authentication/login_screen.dart';

class AppRoutes {
  static const String onboarding = "/onboarding";
  static const String auth = "/auth";
  static const String habitDashboard = "/dashboard";
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding: return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case auth: return MaterialPageRoute(builder: (_) => LoginScreen());
      case habitDashboard: return MaterialPageRoute(builder: (_) => DashboardScreen());
      default: return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}