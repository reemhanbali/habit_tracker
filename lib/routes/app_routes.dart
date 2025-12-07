import 'package:flutter/material.dart';
import 'package:habits_tracker_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/create_account_flow.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/select_gender_screen.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:habits_tracker_app/features/user_authentication/login_screen.dart';

class AppRoutes {
  static const String onboarding = "/onboarding";
  static const String auth = "/auth";
  static const String habitDashboard = "/dashboard";
  static const String createAccountFlow = "/createAccountFlow";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case habitDashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case createAccountFlow:
        return MaterialPageRoute(builder: (_) => CreateAccountFlow());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
