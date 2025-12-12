import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';
import 'package:habits_tracker_app/core/widgets/models/badge_color.dart';

class StatusBadge extends StatelessWidget {
  final AppIconType? icon;
  final String text;
  final BadgeColor color;
  final bool showIcon;

  const StatusBadge({
    super.key,
    this.icon,
    required this.text,
    this.color = BadgeColor.orange,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, Color> colors = _getBadgeColors(color);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingXSmall,
        vertical: AppDimensions.spacingXxSmall,
      ),
      decoration: BoxDecoration(
        color: colors[_backgroundKey],
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) AssetIcon(icon!.assetPath, size: 16),
          Text(
            text,
            style: AppTextStyles.paragraphMedium.copyWith(
              color: colors[_foregroundKey],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, Color> _getBadgeColors(BadgeColor color) {
    switch (color) {
      case BadgeColor.blue:
        return {
          "background": AppColors.primaryBlue10,
          "foreground": AppColors.primaryBlue100,
        };

      case BadgeColor.red:
        return {
          _backgroundKey: AppColors.primaryRedError10,
          _foregroundKey: AppColors.primaryRedError100,
        };
      case BadgeColor.orange:
        return {
          _backgroundKey: AppColors.primaryOrangeWarning10,
          _foregroundKey: AppColors.primaryOrangeWarning100,
        };
      case BadgeColor.green:
        return {
          _backgroundKey: AppColors.primaryGreenSuccess10,
          _foregroundKey: AppColors.primaryGreenSuccess100,
        };

      case BadgeColor.purple:
        return {
          _backgroundKey: AppColors.secondaryPurple10,
          _foregroundKey: AppColors.secondaryPurple100,
        };
      case BadgeColor.grey:
        return {
          _backgroundKey: AppColors.primaryBlack10,
          _foregroundKey: AppColors.primaryBlack80,
        };
    }
  }

  static const String _backgroundKey = "background";
  static const String _foregroundKey = "foreground";
}
