import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/models/segment.dart';
import 'package:habits_tracker_app/core/widgets/segment_control.dart';
import 'package:habits_tracker_app/core/widgets/welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBaseBackground,
      appBar: Header(
        leftIcon: AssetIcon(AppIconType.calendar.assetPath),
        rightIcon: AssetIcon(AppIconType.notification.assetPath),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMedium,
          vertical: AppDimensions.spacing12,
        ),
        child: Column(
          children: <Widget>[
            Welcome(
              name: "Reem",
              description: "Let’s make habits together!",
              modeEmoji: "😇",
            ),

            SegmentControl<int>(
              selectedValue: _selected,
              onValueChanged: (v) => setState(() => _selected = v),
              segments: [
                Segment(
                  value: 0,
                  child: Center(
                    child: Text(
                      "Today",
                      style: AppTextStyles.paragraphMedium.copyWith(
                        color: _selected == 0
                            ? AppColors.primaryBlue100
                            : AppColors.primaryBlack60,
                      ),
                    ),
                  ),
                ),
                Segment(
                  value: 1,
                  child: Center(
                    child: Text(
                      "Clubs",
                      style: AppTextStyles.paragraphMedium.copyWith(
                        color: _selected == 1
                            ? AppColors.primaryBlue100
                            : AppColors.primaryBlack60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(onPressed: () {}, child: const Text('View A details')),
          ],
        ),
      ),
    );
  }
}
