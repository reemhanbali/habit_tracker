import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/widgets/models/widget_constants.dart';

enum ButtonSize { small, medium, large }

extension ButtonSizePadding on ButtonSize {
  EdgeInsets get padding {
    switch (this) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMedium,
          vertical: AppDimensions.spacingSmall,
        );
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 20, vertical: 12);
      case ButtonSize.large:
        return EdgeInsets.symmetric(
          horizontal: 20,
          vertical: AppDimensions.spacingMedium,
        );
    }
  }
}

extension ButtonSizeHeight on ButtonSize {
  double get height {
    switch (this) {
      case ButtonSize.large:
        return largeHeight;

      case ButtonSize.small:
        return smallHeight;

      default:
        return mediumHeight;
    }
  }
}
