import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_gradients.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/utils/string_utils.dart';
import 'package:habits_tracker_app/core/widgets/gradient_text.dart';

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    super.key,
    required this.isSelected,
    required this.dayNumber,
    required this.dayName,
    required this.onTap,
  });

  final bool isSelected;
  final int dayNumber;
  final String dayName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dayNameStyle = _getDayNameStyle(isSelected);
    final dayNumberStyle = _getDayNumberStyle(isSelected);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: isSelected
            ? _totalWidth + (2 * _selectedBorderWidth)
            : _totalWidth + (2 * _unSelectedBorderWidth),
        height: isSelected
            ? _totalHeight + (2 * _selectedBorderWidth)
            : _totalHeight + (2 * _unSelectedBorderWidth),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingSmall,
          vertical: AppDimensions.spacing12,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryBaseWhite,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          border: BoxBorder.all(
            color: isSelected
                ? AppColors.gradientBlueStop0
                : AppColors.primaryBlack10,
            width: isSelected ? _selectedBorderWidth : _unSelectedBorderWidth,
          ),
        ),
        child: Column(
          children: [
            dayNumberStyle.gradient != null
                ? GradientText(
                    text: "$dayNumber",
                    style: AppTextStyles.headline6.copyWith(
                      color: Colors.white,
                    ),
                    gradient: dayNumberStyle.gradient!,
                  )
                : Text(
                    "$dayNumber",
                    style: AppTextStyles.headline6.copyWith(
                      color: AppColors.primaryBlack100,
                    ),
                  ),
            dayNameStyle.gradient != null
                ? GradientText(
                    text: dayName.firstChars(3).toUpperCase(),
                    style: AppTextStyles.chip.copyWith(color: Colors.white),
                    gradient: dayNameStyle.gradient!,
                  )
                : Text(
                    dayName.firstChars(3).toUpperCase(),
                    style: AppTextStyles.chip.copyWith(
                      color: AppColors.primaryBlack20,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  ({Gradient? gradient, Color? color}) _getDayNumberStyle(bool isSelected) {
    if (isSelected) {
      return (gradient: AppGradients.blueGradient, color: null);
    } else {
      return (gradient: null, color: AppColors.primaryBlack100);
    }
  }

  ({Gradient? gradient, Color? color}) _getDayNameStyle(bool isSelected) {
    if (isSelected) {
      return (gradient: AppGradients.blueGradient, color: null);
    } else {
      return (gradient: null, color: AppColors.primaryBlack20);
    }
  }

  static const double _totalWidth = 48;
  static const double _totalHeight = 64;
  static const double _selectedBorderWidth = 2; // each side
  static const double _unSelectedBorderWidth = 1; // each side
}
