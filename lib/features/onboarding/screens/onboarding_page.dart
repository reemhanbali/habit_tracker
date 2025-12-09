import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/features/onboarding/screens/models/onboarding_page_ui_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageUiModel page;
  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacingMedium),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              width: double.infinity,
              "${page.illustration}.png",
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              Text(
                page.title,
                softWrap: true,
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primaryBaseWhite,
                ),
              ),
              SizedBox(height: AppDimensions.spacingSmall),
              Text(
                page.description,
                softWrap: true,
                style: AppTextStyles.paragraphMedium.copyWith(
                  color: AppColors.primaryBlue20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
