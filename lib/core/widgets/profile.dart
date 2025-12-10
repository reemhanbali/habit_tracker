import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.status,
  });

  final String name;
  final String avatarUrl;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 28, backgroundImage: NetworkImage(avatarUrl)),
        SizedBox(width: AppDimensions.spacingSmall),
        Expanded(
          child: Column(
            children: [
              Text(
                name,
                style: AppTextStyles.title.copyWith(
                  color: AppColors.primaryBlack100,
                ),
              ),
              SizedBox(height: AppDimensions.spacingXSmall),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacingXSmall,
                  vertical: AppDimensions.spacingXxSmall,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryOrangeWarning10,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusMedium,
                  ),
                ),
                child: Row(
                  children: [
                    AssetIcon(AppIconType.points.assetPath, size: 16),
                    Text(
                      "666 points",
                      style: AppTextStyles.paragraphMedium.copyWith(
                        color: AppColors.primaryOrangeWarning100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
