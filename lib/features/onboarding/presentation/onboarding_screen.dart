import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_gradients.dart';
import 'package:habits_tracker_app/core/theme/app_icons.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/secondary_button.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/models/onboarding_page_ui_model.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/onboarding_page.dart';
import 'package:habits_tracker_app/features/onboarding/repository/onboarding_repository.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/onboarding_page_view.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

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
                  flex: 2,
                  child: OnboardingPageView(
                    controller: _pageController,
                    currentPage: _currentPage,
                    pages: _pages
                        .map((page) => OnboardingPage(page: page))
                        .toList(),
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    onDotTap: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );

                      setState(() => _currentPage = index);
                    },
                  ),
                ),
                SizedBox(height: AppDimensions.spacingMedium),
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.spacingMedium),
                  child: Column(
                    children: [
                      SecondaryButton(
                        text: "Continue with E-mail",
                        icon: SvgPicture.asset(AppIcons.login),
                        buttonSize: ButtonSize.large,
                        fullWidth: true,
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.auth);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppDimensions.spacingMedium,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SecondaryButton(
                              text: "Apple",
                              icon: SvgPicture.asset(AppIcons.apple),
                              buttonSize: ButtonSize.small,
                              onTap: () {},
                            ),
                            SizedBox(width: AppDimensions.spacingSmall),
                            SecondaryButton(
                              text: "Google",
                              icon: SvgPicture.asset(AppIcons.google),
                              buttonSize: ButtonSize.small,
                              onTap: () {},
                            ),
                            SizedBox(width: AppDimensions.spacingSmall),
                            Expanded(
                              child: SecondaryButton(
                                text: "Facebook",
                                icon: SvgPicture.asset(AppIcons.facebook),
                                buttonSize: ButtonSize.small,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppDimensions.spacingSmall),
                      Text(
                        "By continuing you agree Terms of Services & Privacy Policy",
                        style: AppTextStyles.alternative.copyWith(
                          color: AppColors.primaryBlue40,
                        ),
                      ),
                    ],
                  ),
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
