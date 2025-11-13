import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_gradients.dart';
import 'package:habits_tracker_app/features/onboarding/repository/onboarding_repository.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static int _TOTAL_PAGES = 3;
  static const int _animDuration = 300;
  final OnboardingRepository _repository = OnboardingRepository();

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: Duration(microseconds: _animDuration),
        curve: Curves.easeInCubic,
      );
    } else {
      _repository.completeOnboarding();
      // go to auth screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.blueGradient),
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() => _currentPage = value),
          children: [
            Text("Track your habits easily"),
            Text("Visualize your progress."),
            Text("Let's create your first habit!"),
          ],
        ),
      ),
      bottomSheet: TextButton(
        onPressed: _nextPage,
        child: Text(_currentPage == 2 ? "Get Started" : "Next"),
      ),
    );
  }
}
