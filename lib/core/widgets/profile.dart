import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';
import 'package:habits_tracker_app/core/widgets/status_badge.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMedium,
        vertical: AppDimensions.spacingSmall,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: NetworkImage(avatarUrl)),
          SizedBox(width: AppDimensions.spacingSmall),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.primaryBlack100,
                  ),
                ),
                SizedBox(height: AppDimensions.spacingXSmall),
                StatusBadge(text: status),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
