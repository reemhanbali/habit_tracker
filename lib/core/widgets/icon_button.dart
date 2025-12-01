import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/widgets/models/icon_button_size.dart';
import 'package:habits_tracker_app/core/widgets/models/icon_button_state.dart';
import 'package:habits_tracker_app/core/widgets/models/icon_button_type.dart';

class CustomIconButton extends StatelessWidget {
  final IconButtonSize iconButtonSize;
  final IconButtonType iconButtonType;
  final IconButtonState iconButtonState;
  final VoidCallback? onTap;
  final Widget icon;
  double _dimension = 0;

  CustomIconButton({
    super.key,
    this.iconButtonSize = IconButtonSize.medium,
    this.iconButtonType = IconButtonType.icon,
    this.iconButtonState = IconButtonState.normal,
    this.onTap,
    required this.icon,
  }) {
    _dimension = _getDimension(iconButtonSize);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _dimension,
      height: _dimension,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        child: Container(
          padding: _getPadding(iconButtonSize),
          decoration: BoxDecoration(
            color: iconButtonState == IconButtonState.active
                ? AppColors.primaryBlue10
                : AppColors.primaryBaseWhite,
            border: Border.all(
              color: iconButtonState == IconButtonState.active
                  ? AppColors.primaryBlue100
                  : AppColors.primaryBlack10,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          ),
          child: icon,
        ),
      ),
    );
  }

  double _getDimension(IconButtonSize buttonSize) {
    switch (buttonSize) {
      case IconButtonSize.large:
        return _largeSize;

      case IconButtonSize.small:
        return _smallSize;

      default:
        return _mediumSize;
    }
  }

  EdgeInsets _getPadding(IconButtonSize buttonSize) {
    switch (buttonSize) {
      case IconButtonSize.large:
      case IconButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 12, vertical: 12);
      default:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingXSmall,
          vertical: AppDimensions.spacingXSmall,
        );
    }
  }

  static double _smallSize = 36;
  static double _mediumSize = 40;
  static double _largeSize = 48;
  static const double _iconSize = 20;
}
