import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/enter_information_screen.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/select_gender_screen.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/create_account/select_habits_screen.dart';

class CreateAccountFlow extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/step1',
    routes: [
      GoRoute(
        path: '/step1',
        builder: (context, state) => EnterInformationScreen(),
      ),
      GoRoute(
        path: '/step2',
        builder: (context, state) => SelectGenderScreen(),
      ),
      GoRoute(
        path: '/step3',
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
