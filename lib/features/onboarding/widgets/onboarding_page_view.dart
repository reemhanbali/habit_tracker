import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/dot_indicators.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final int currentPage;
  final List<Widget> pages;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onDotTap;

  const OnboardingPageView({
    super.key,
    required this.controller,
    required this.currentPage,
    required this.pages,
    this.onPageChanged,
    this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: PageView.builder(
              itemCount: pages.length,
              controller: controller,
              onPageChanged: (value) {
                onPageChanged?.call(value); // call the callback with new page
              },
              itemBuilder: (_, index) => pages[index],
            ),
          ),
        ),
        SizedBox(height: AppDimensions.spacingSmall),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingMedium,
          ),
          child: DotIndicators(
            currentPage: currentPage,
            pageCount: pages.length,
            onDotTap: onDotTap,
          ),
        ),
      ],
    );
  }
}
