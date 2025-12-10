import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
    required this.name,
    required this.modeEmoji,
    required this.description,
  });

  final String name;
  final String modeEmoji;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMedium,
        vertical: AppDimensions.spacing12,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, $name👋🏻",
                      style: AppTextStyles.title.copyWith(
                        color: AppColors.primaryBlack100,
                      ),
                    ),
                    SizedBox(height: AppDimensions.spacingXSmall),
                    Text(
                      description,
                      style: AppTextStyles.paragraphBook.copyWith(
                        color: AppColors.primaryBlack40,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryBlueInfo10,
                ),
                child: Center(
                  child: Text(modeEmoji, style: AppTextStyles.headline6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
