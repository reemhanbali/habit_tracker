import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool fullWidth;
  final ButtonSize buttonSize;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.fullWidth = false,
    this.buttonSize = ButtonSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: _getHeight(buttonSize),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(AppTextStyles.paragraphMedium),
          iconSize: WidgetStatePropertyAll(_iconSize),
          padding: WidgetStateProperty.all(_getPadding(buttonSize)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_buttonRadius),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.primaryBaseBackground;
            }
            if (states.contains(WidgetState.pressed)) {
              return AppColors.secondaryDarkBlue20;
            }
            return AppColors.primaryBaseWhite;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.primaryBlack40;
            }
            return AppColors.primaryBlack100;
          }),
          iconColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.primaryBlack20;
            }
            return AppColors.primaryBlack100;
          }),
        ),
        child: icon == null
            ? Text(text)
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [icon!, Text(text)],
              ),
      ),
    );
  }

  double _getHeight(ButtonSize buttonSize) {
    switch (buttonSize) {
      case ButtonSize.large:
        return _largeHeight;

      case ButtonSize.small:
        return _smallHeight;

      default:
        return _mediumHeight;
    }
  }

  EdgeInsets _getPadding(ButtonSize buttonSize) {
    switch (buttonSize) {
      case ButtonSize.large:
        return EdgeInsets.symmetric(
          horizontal: 20,
          vertical: AppDimensions.spacingMedium,
        );

      case ButtonSize.small:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMedium,
          vertical: AppDimensions.spacingSmall,
        );

      default:
        return EdgeInsets.symmetric(horizontal: 20, vertical: 12);
    }
  }

  static double _smallHeight = 36;
  static double _mediumHeight = 44;
  static double _largeHeight = 52;
  static double _buttonRadius = 40;
  static double _iconSize = 20;
}
