import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_gradients.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/models/onboarding_page_ui_model.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/onboarding_page.dart';
import 'package:habits_tracker_app/features/onboarding/repository/onboarding_repository.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<OnboardingPageUiModel> _pages = [
    OnboardingPageUiModel(
      illustration: "assets/images/illustration1",
      title: '''Create 
Good Habits''',
      description:
          "Change your life by slowly adding new healthy habits and sticking to them.",
    ),
    OnboardingPageUiModel(
      illustration: "assets/images/illustration2",
      title: '''Track
Your Progress''',
      description:
          "Everyday you become one step closer to your goal. Don’t give up!",
    ),
    OnboardingPageUiModel(
      illustration: "assets/images/illustration3",
      title: '''Stay Together
and Strong''',
      description:
          "Find friends to discuss common topics. Complete challenges together.",
    ),
  ];

  int _currentPage = 0;
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
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.blueGradient,
            ),
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageController,
              onPageChanged: (value) => setState(() => _currentPage = value),
              itemBuilder: (context, index) {
                final page = _pages[index];
                return OnboardingPage(page: page);
              },
            ),
          ),
          Image.asset(
            'assets/images/circle_bg.png',
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
        ],
      ),
      bottomSheet: TextButton(
        onPressed: _nextPage,
        child: Text(_currentPage == 2 ? "Get Started" : "Next"),
      ),
    );
  }
}