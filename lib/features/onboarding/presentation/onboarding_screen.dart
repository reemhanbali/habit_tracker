import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_gradients.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/models/onboarding_page_ui_model.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/onboarding_page.dart';
import 'package:habits_tracker_app/features/onboarding/repository/onboarding_repository.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/dot_indicators.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);
  final List<OnboardingPageUiModel> _pages = [
    OnboardingPageUiModel(
      illustration: "assets/images/illustration1",
      title: '''Create Good Habits''',
      description:
          "Change your life by slowly adding new healthy habits and sticking to them.",
    ),
    OnboardingPageUiModel(
      illustration: "assets/images/illustration2",
      title: '''Track Your Progress''',
      description:
          "Everyday you become one step closer to your goal. Don’t give up!",
    ),
    OnboardingPageUiModel(
      illustration: "assets/images/illustration3",
      title: '''Stay Together and Strong''',
      description:
          "Find friends to discuss common topics. Complete challenges together.",
    ),
  ];
  static const int _animDuration = 300;

  final OnboardingRepository _repository = OnboardingRepository();

  void _nextPage(int pageIndex) {
    // Move PageView first
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    // Update _currentPage so UI (dots) rebuilds
    setState(() {
      _currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.blueGradient),
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top,
                          ),
                          child: PageView.builder(
                            itemCount: _pages.length,
                            controller: _pageController,
                            onPageChanged: (value) =>
                                setState(() => _currentPage = value),
                            itemBuilder: (context, index) {
                              final page = _pages[index];
                              return OnboardingPage(page: page);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.spacingSmall),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.spacingMedium,
                        ),
                        child: DotIndicators(
                          currentPage: _currentPage,
                          pageCount: _pages.length,
                          onDotTap: (index) {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextButton(onPressed: () {}, child: Text("button1")),
                    Row(
                      children: [
                        TextButton(onPressed: () {}, child: Text("button2")),
                        TextButton(onPressed: () {}, child: Text("button3")),
                        TextButton(onPressed: () {}, child: Text("button3")),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            /*  Image.asset(
              'assets/images/circle_bg.png',
              width: 400,
              height: 400,
              fit: BoxFit.cover,
            ), */
          ],
        ),
      ),
    );
  }
}
