import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/enter_information_screen.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/select_gender_screen.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/select_habits_screen.dart';

class CreateAccountFlow extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: createAccountStep1,
    routes: [
      GoRoute(
        path: createAccountStep1,
        builder: (context, state) => EnterInformationScreen(),
      ),
      GoRoute(
        path: createAccountStep2,
        builder: (context, state) => SelectGenderScreen(),
      ),
      GoRoute(
        path: createAccountStep3,
        builder: (context, state) => SelectHabitsScreen(),
      ),
    ],
  );

  CreateAccountFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

const String createAccountStep1 = "/create_account/enter_info";
const String createAccountStep2 = "/create_account/select_gender";
const String createAccountStep3 = "/create_account/select_habits";
