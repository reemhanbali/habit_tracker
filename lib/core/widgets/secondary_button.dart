import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/models/widget_constants.dart';

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
      height: buttonSize.height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(AppTextStyles.paragraphMedium),
          iconSize: WidgetStatePropertyAll(iconSize),
          padding: WidgetStateProperty.all(buttonSize.padding),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius),
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
}
