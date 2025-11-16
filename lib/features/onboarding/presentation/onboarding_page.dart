import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimens.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/features/onboarding/presentation/models/onboarding_page_ui_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageUiModel page;
  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.spacingMedium),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Image.asset(
              "${page.illustration}.png",
              width: double.infinity,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
          Image.asset(
            "${page.illustration}.png",
            width: double.infinity,

            fit: BoxFit.cover,
          ) /* ,
          SizedBox(height: AppDimens.spacingLarge),
          Text(
            page.title,
            style: AppTextStyles.headline2.copyWith(
              color: AppColors.primaryBaseWhite,
            ),
          ),
          SizedBox(height: AppDimens.spacingSmall),
          Text(
            page.description,
            style: AppTextStyles.paragraphMedium.copyWith(
              color: AppColors.primaryBlue20,
            ),
          ), */,
        ],
      ),
    );
  }
}
