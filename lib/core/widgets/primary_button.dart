import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/models/widget_constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool fullWidth;
  final ButtonSize buttonSize;

  const PrimaryButton({
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
      child: Opacity(
        opacity: onTap == null ? 0.5 : 1,
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
              if (states.contains(WidgetState.pressed)) {
                return AppColors.primaryBlue80;
              }
              return AppColors.primaryBlue100;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return AppColors.primaryBlack40;
              }
              return AppColors.primaryBaseWhite;
            }),
            iconColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return AppColors.primaryBaseWhite;
              }
              return AppColors.primaryBaseWhite;
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
      ),
    );
  }
}
