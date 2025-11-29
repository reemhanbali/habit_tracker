import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';

class DotIndicators extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final double size;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int>? onDotTap; // add this

  const DotIndicators({
    super.key,
    required this.currentPage,
    required this.pageCount,
    this.onDotTap,
    this.size = AppDimensions.radiusSmall,
    this.spacing = AppDimensions.spacingSmall,
    this.activeColor = AppColors.primaryBaseWhite,
    this.inactiveColor = AppColors.primaryBlue60,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List<Widget>.generate(
        pageCount,
        (index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            end: AppDimensions.spacingMedium,
          ),
          child: InkWell(
            onTap: () {
              if (onDotTap != null) onDotTap!(index);
            },
            child: CircleAvatar(
              radius: AppDimensions.radiusSmall,
              backgroundColor: currentPage == index
                  ? AppColors.primaryBaseWhite
                  : AppColors.primaryBlue60,
            ),
          ),
        ),
      ),
    );
  }
}
