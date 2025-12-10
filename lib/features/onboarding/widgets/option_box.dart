import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';

class OptionBox extends StatelessWidget {
  final String emoji;
  final String title;

  const OptionBox({super.key, required this.emoji, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(emoji, style: AppTextStyles.headline4),
        Text(
          title,
          style: AppTextStyles.paragraphMedium.copyWith(
            color: AppColors.primaryBlack100,
          ),
        ),
      ],
    );
  }
}
