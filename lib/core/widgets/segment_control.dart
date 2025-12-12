import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_shadows.dart';
import 'package:habits_tracker_app/core/widgets/models/segment.dart';

class SegmentControl<T> extends StatelessWidget {
  const SegmentControl({
    super.key,
    required this.segments,
    required this.selectedValue,
    required this.onValueChanged,
  });

  final List<Segment<T>> segments;
  final T selectedValue;
  final ValueChanged<T> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMedium,
        vertical: AppDimensions.spacing12,
      ),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryBlack10,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: AppShadows.box,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: segments.map((segment) {
            final selected = segment.value == selectedValue;
            return Expanded(
              child: GestureDetector(
                onTap: () => onValueChanged(segment.value),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacingMedium,
                    vertical: AppDimensions.spacingXSmall,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.primaryBaseWhite
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusLarge,
                    ),
                  ),
                  child: segment.child,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
